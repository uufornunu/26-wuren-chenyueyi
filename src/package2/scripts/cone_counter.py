#!/usr/bin/env python3
import rospy
from fsd_common_msgs.msg import ConeDetections, Cone
from visualization_msgs.msg import Marker, MarkerArray
from std_msgs.msg import ColorRGBA, String
from geometry_msgs.msg import Point

class ConeVisualizer:
    def __init__(self):
        # 初始化节点
        rospy.init_node('cone_counter', anonymous=True)
        rospy.loginfo("锥桶统计节点已启动！")
        
        # 订阅锥桶检测话题（使用实际话题名）
        self.sub = rospy.Subscriber("/perception/lidar/cone_side", ConeDetections, self.callback, queue_size=10)
        
        # 发布可视化标记
        self.marker_pub = rospy.Publisher("/visualization_markers", MarkerArray, queue_size=10)
        
        # 发布统计信息
        self.count_pub = rospy.Publisher("/cone_counts", String, queue_size=10)
        
        # 初始化计数器
        self.marker_id = 0
        self.blue_count = 0
        self.red_count = 0
        self.yellow_count = 0
        
        # 颜色映射
        self.color_map = {
            'b': ("blue", ColorRGBA(0, 0, 1, 1)),    # 蓝色
            'r': ("red", ColorRGBA(1, 0, 0, 1)),     # 橙色视为红色
            'y': ("yellow", ColorRGBA(1, 1, 0, 1))   # 黄色
        }
        
        rospy.loginfo("等待锥桶数据...")
        rospy.spin()
    def callback(self, msg):
        rospy.loginfo(f"收到{len(msg.cone_detections)}个锥桶检测数据")
        marker_array = MarkerArray()
        current_blue = 0
        current_red = 0
        current_yellow = 0
        
        # 处理每个锥桶
        for cone in msg.cone_detections:
            try:
                color_char = cone.color.data.lower()[0]  # 取首字母
                
                # 统计数量
                if color_char == 'b':
                    current_blue += 1
                elif color_char == 'r':
                    current_red += 1
                elif color_char == 'y':
                    current_yellow += 1
                else:
                    rospy.logwarn(f"未知颜色代码: {color_char}")
                    continue
                
                # 创建标记
                marker = Marker()
                marker.header = msg.header
                marker.ns = "cones"
                marker.id = self.marker_id
                marker.type = Marker.CYLINDER
                marker.action = Marker.ADD
                
                # 设置位置
                marker.pose.position = Point(
                    cone.position.x,
                    cone.position.y,
                    0.1  # 稍微抬离地面
                )
                marker.pose.orientation.w = 1.0
                
                # 设置尺寸
                marker.scale.x = 0.2
                marker.scale.y = 0.2
                marker.scale.z = 0.5
                
                # 设置颜色
                if color_char in self.color_map:
                    marker.color = self.color_map[color_char][1]
                else:
                    marker.color = ColorRGBA(0.5, 0.5, 0.5, 1)  # 未知颜色用灰色
                
                # 设置透明度（基于置信度）
                marker.color.a = max(0.3, min(1.0, cone.poseConfidence.data))
                
                marker.lifetime = rospy.Duration(1.0)  # 1秒后消失
                marker_array.markers.append(marker)
                self.marker_id += 1
                
            except Exception as e:	
                rospy.logerr(f"处理锥桶时出错: {str(e)}")
        
        # 更新全局计数
        self.blue_count += current_blue
        self.red_count += current_red
        self.yellow_count += current_yellow
        
        # 发布标记
        if marker_array.markers:
            self.marker_pub.publish(marker_array)
        
        # 发布统计信息
        count_str = (f"当前帧: 蓝={current_blue}, 红={current_red}, 黄={current_yellow}\n"
                    f"累计统计: 蓝={self.blue_count}, 红={self.red_count}, 黄={self.yellow_count}")
        rospy.loginfo(count_str)
        self.count_pub.publish(count_str)

if __name__ == '__main__':
    try:
        visualizer = ConeVisualizer()
        rospy.spin()
    except rospy.ROSInterruptException:
        rospy.loginfo("节点已关闭")
