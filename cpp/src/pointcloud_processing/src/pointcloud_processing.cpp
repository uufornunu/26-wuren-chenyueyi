#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <message_filters/subscriber.h>
#include <message_filters/synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>

// 定义点云类型
typedef pcl::PointXYZI PointT;
typedef pcl::PointCloud<PointT> PointCloudT;

 // 点云发布器
ros::Publisher pub;

 // 同步回调函数 (三个雷达的点云)
void callback(
    const sensor_msgs::PointCloud2::ConstPtr& cloud_msg_mid,
    const sensor_msgs::PointCloud2::ConstPtr& cloud_msg_up,
    const sensor_msgs::PointCloud2::ConstPtr& cloud_msg_down)
{
    ROS_INFO("Received synchronized point clouds");
    
    //step 1. ROS消息 -> PCL点云
    PointCloudT::Ptr pcl_mid(new PointCloudT);
    PointCloudT::Ptr pcl_up(new PointCloudT);
    PointCloudT::Ptr pcl_down(new PointCloudT);
    
    pcl::fromROSMsg(*cloud_msg_mid, *pcl_mid);
    pcl::fromROSMsg(*cloud_msg_up, *pcl_up);
    pcl::fromROSMsg(*cloud_msg_down, *pcl_down);
    
    // step2. 点云拼接
    PointCloudT::Ptr combined_cloud(new PointCloudT);
    *combined_cloud = *pcl_mid;
    *combined_cloud += *pcl_up;  // 上部雷达点云
    *combined_cloud += *pcl_down; // 下部雷达点云
    
    // step3. 调整强度值范围 (0~1 → 1~256)
    for (auto& point : combined_cloud->points) {
        // makesure强度范围内
        float intensity = point.intensity;
        if (intensity < 0) intensity = 0;
        if (intensity > 1) intensity = 1;
        
       
        point.intensity = 1.0f + intensity * 255.0f;
    }
    
    // step4. 转换回ROS消息格式
    sensor_msgs::PointCloud2 output_msg;
    pcl::toROSMsg(*combined_cloud, output_msg);
    
    // step5. 设置消息头信息
    output_msg.header.frame_id = "lidar";  
    output_msg.header.stamp = cloud_msg_mid->header.stamp; // 使用中间雷达时间戳
    
    // step6. 发布处理后的点云
    pub.publish(output_msg);
    ROS_INFO("Published combined point cloud with adjusted intensity");
}

int main(int argc, char** argv)
{
    // 初始化ROS节点
    ros::init(argc, argv, "pointcloud_processing");
    ros::NodeHandle nh;
    
    // 创建发布器 (话题名 /lidar_points)
    pub = nh.advertise<sensor_msgs::PointCloud2>("/lidar_points", 10);
    
    // 创建三个点云订阅器
    message_filters::Subscriber<sensor_msgs::PointCloud2> sub_mid(
        nh, "/carla/ego_vehicle/lidar_mid", 10);
    message_filters::Subscriber<sensor_msgs::PointCloud2> sub_up(
        nh, "/carla/ego_vehicle/lidar_up", 10);
    message_filters::Subscriber<sensor_msgs::PointCloud2> sub_down(
        nh, "/carla/ego_vehicle/lidar_down", 10);
    
    // 创建时间同步器 (使用近似时间策略)
    typedef message_filters::sync_policies::ApproximateTime<
        sensor_msgs::PointCloud2, 
        sensor_msgs::PointCloud2,
        sensor_msgs::PointCloud2> SyncPolicy;
    
    message_filters::Synchronizer<SyncPolicy> sync(
        SyncPolicy(10), sub_mid, sub_up, sub_down);
    
    // 注册回调函数
    sync.registerCallback(boost::bind(&callback, _1, _2, _3));
    
    // 进入ROS循环
    ros::spin();
    return 0;
}