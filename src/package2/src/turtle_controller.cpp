#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <package2/TurtleVel.h>  // 包名

// 全局参数
double angular_velocity; //角速度
double max_speed;//最大线速度
void velCallback(const package2::TurtleVel::ConstPtr& msg, 
                 ros::Publisher& twist_pub)
{
    geometry_msgs::Twist twist;
    
 // 限制速度不超过 max_speed怕失控
    if(msg->linear_x > max_speed) {
        twist.linear.x = max_speed;
    } else {
        twist.linear.x = msg->linear_x;
    }
    
    twist.linear.y = msg->linear_y;// 其实没用 只用x
    twist.angular.z = angular_velocity;//固定下角速度
    
// 发布控制指令
    twist_pub.publish(twist);
    ROS_INFO("控制乌龟: 线速度=%.2f, 角速度=%.2f", twist.linear.x, twist.angular.z);
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "turtle_controller");//节点的初始化
    ros::NodeHandle nh;//句柄
    
    // 从参数服务器获取参数，加载angular_velocity，max_speed
    nh.getParam("angular_velocity", angular_velocity);
    nh.getParam("max_speed", max_speed);
    
    // 创建控制指令发布者
    ros::Publisher twist_pub = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);
    
    // 订阅自定义速度的消息
    ros::Subscriber sub = nh.subscribe<package2::TurtleVel>(
        "/turtle_vel_cmd", 10, 
        [&](const package2::TurtleVel::ConstPtr& msg) {
            velCallback(msg, twist_pub);
        });//向话题turtle1/cmd_vel发布消息Twist，控制小龟
    
    ROS_INFO("乌龟控制器已启动，角速度: %.2f rad/s，最大线速度: %.2f m/s", 
             angular_velocity, max_speed);
    
    ros::spin();//打印启动日志，看参数加载成功
    return 0;
}
