#!/usr/bin/env python3
import rospy
from package2.msg import TurtleVel#自定义消息

def publisher():
    rospy.init_node('turtle_vel_publisher', anonymous=True)#初始化节点，自动添加数，不然重复启动冲突
    pub = rospy.Publisher('/turtle_vel_cmd', TurtleVel, queue_size=10)#发布者对象
    rate = rospy.Rate(1)  # 频率1
    
    while not rospy.is_shutdown():#没有受到终止消息
        vel_msg = TurtleVel()#自定义消息对象
        vel_msg.linear_x = 2.0#线速度x
        vel_msg.linear_y = 0.0#线速度y无用
        pub.publish(vel_msg)#发送到vel_meg
        rospy.loginfo("发布速度命令: x=%.1f m/s, y=%.1f m/s", 
                      vel_msg.linear_x, vel_msg.linear_y)#终端可视化
        rate.sleep()

if __name__ == '__main__':
    try:
        publisher()#主函数
    except rospy.ROSInterruptException:
        rospy.loginfo("节点已终止")#中断
