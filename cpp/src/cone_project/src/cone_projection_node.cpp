#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <fsd_common_msgs/ConeDetections.h>
#include <Eigen/Dense>

class ConeProjector {
private:
    ros::NodeHandle nh_;
    image_transport::ImageTransport it_;
    ros::Subscriber cone_sub_;
    image_transport::Publisher image_pub_;
    
    // 相机内外参矩阵
    Eigen::Matrix3f intrinsic_matrix_;
    Eigen::Matrix4f extrinsic_matrix_;
    
    // 图像尺寸
    const int image_width_ = 1280;
    const int image_height_ = 360;

public:
    ConeProjector() : it_(nh_) {
        // 订阅锥桶检测话题
        cone_sub_ = nh_.subscribe("/perception/fusion/cone_fusion", 1,
                                 &ConeProjector::coneCallback, this);
        
        // 发布投影后的图像
        image_pub_ = it_.advertise("/projected_image", 1);
        
        // 初始化相机内外参矩阵
        initializeCameraMatrices();
    }
    
    ~ConeProjector() {
        cv::destroyAllWindows();
    }
    
    // 初始化相机内外参矩阵
    void initializeCameraMatrices() {
        // 内参矩阵 
        intrinsic_matrix_ << 532.795, 0.0, 632.15,
                             0.0, 532.72, -3.428,
                             0, 0, 1;
        
        // 外参矩阵（从世界坐标系->相机坐标系）
        
        extrinsic_matrix_ << 3.5594209875121074e-03, -9.9987761481865733e-01,-1.5234365979146680e-02, 8.9277270417879417e-02,
                             1.9781062410225703e-03, 1.5241472820252011e-02,-9.9988188532544631e-01, 9.1100499695349946e-01,
                             9.9999170877459420e-01, 3.5288653732390984e-03,2.0321149683686368e-03, 1.9154049062915668e+00,
                             0, 0, 0, 1;
    }
    
    // 3D点到2D像素的投影函数
    cv::Point3f projectToImage(const Eigen::Vector3f& point3d) {
        // 将3D点从齐次坐标表示
        Eigen::Vector4f point_homogeneous(point3d.x(), point3d.y(), point3d.z(), 1.0);
        
        // 应用外参矩阵（世界坐标系 -> 相机坐标系）
        Eigen::Vector4f point_camera = extrinsic_matrix_ * point_homogeneous;
        
        // 转换为相机坐标系下的3D点
        Eigen::Vector3f point_camera_3d(point_camera.x()/point_camera.w(), 
                                        point_camera.y()/point_camera.w(), 
                                        point_camera.z()/point_camera.w());
        
        // 检查点是不是在前
        if (point_camera_3d.z() <= 0) {
            return cv::Point3f(-1, -1, -1); // 点在后方
        }
        
        // 内参矩阵（相机坐标系 -> 图像坐标系）
        Eigen::Vector3f point_image = intrinsic_matrix_ * point_camera_3d;
        
        // 归一化  得到像素坐标
        cv::Point3f pixel(point_image.x()/point_image.z(), 
                         point_image.y()/point_image.z(), 
                         point_camera_3d.z()); // 保留深度信息
        
        return pixel;
    }
    
    // 锥桶检测回调函数
    void coneCallback(const fsd_common_msgs::ConeDetections::ConstPtr& msg) {
        // 创建空白图像
        cv::Mat image = cv::Mat::zeros(image_height_, image_width_, CV_8UC3);
        
        // 遍历所有检测到的锥桶
        for (const auto& cone : msg->cone_detections) {
        // 提取3D坐标
            Eigen::Vector3f cone_position(cone.position.x,
                                         cone.position.y,
                                         cone.position.z);

 // 将3D坐标投到平面
            cv::Point3f pixel = projectToImage(cone_position);
            std::cout<<pixel.x<<" "<<pixel.y<<std::endl;

            cv::Scalar color;

            if(cone.color.data == "b")
                color = cv::Scalar(255, 0, 0);
            if(cone.color.data == "r")
                color = cv::Scalar(0, 0, 255);
            if(cone.color.data == "g")
                color = cv::Scalar(0, 255, 0);

            cv::circle(image, cv::Point(int(pixel.x), int(pixel.y)), 3, color, -1);

        }
        
    // 创建ROS图像 消息
        sensor_msgs::ImagePtr msg_out = cv_bridge::CvImage(std_msgs::Header(), "bgr8", image).toImageMsg();

    // 发布
        image_pub_.publish(msg_out);
    }
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "cone_projection_node");
    ConeProjector cone_projector;
    ros::spin();
    return 0;
}
    