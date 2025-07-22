https://github.com/uufornunu/26-wuren-chenyueyi
一、基础作业
1）目录
hw_ros_ws
├── build/               # ROS 编译生成文件
├── devel/               # 开发环境文件
│   ├── lib/package2/
│   │   ├── cone_counter.py       # 锥桶统计脚本 [关键文件]
│   │   └── turtle_vel_pub.py     # 速度发布脚本
│   └── share/           # 消息和配置
│       ├── fsd_common_msgs/msg/  # 所有自定义消息定义
│       └── package2/             # 项目配置
└── src/                 # 源代码核心
    ├── fsd_common_msgs/          # 项目1: 消息定义
    │   ├── bag/ 
    │   │   └── lidar_cone_side_&_slam_state.orig.bag  # 传感器数据包 
    │   └── msg/                  # 消息文件
    │       ├── Cone.msg          # 锥桶定义
    │       ├── ConeDetections.msg # 锥桶检测组
    │       └── ...（共24个.msg文件）
    │
    └── package2/                 # 项目2: 功能包
        ├── launch/control.launch # 启动配置
        ├── msg/TurtleVel.msg     # 自定义速度消息
        ├── scripts/
        │   ├── cone_counter.py   # 锥桶统计脚本
        │   └── turtle_vel_pub.py  # 乌龟速度发布脚本
        ├── src/turtle_controller.cpp  # C++控制节点
        └── result/               # 输出结果
            ├── screenshots/      # 截图
            └── videos/           # 录屏
2）启动流程
cd ~/hw_ros_ws 
catkin_make              # 生成可执行文件 
source devel/setup.bash  # 激活环境（不要再忘记了T T）
roslaunch package2 control.launch

3)作业1完成思路
1.创建工作空间和包——创建目录——初始化包
2.​​定义消息类型​——创建 msg/TurtleVel.msg
3.参数分离配置——创建 config/params.yaml
4.​​​​设计节点——Python发布节点​​ (scripts/turtle_vel_pub.py)——C++控制节点​​ (src/turtle_controller.cpp)
5.Launch文件整合 (launch/control.launch)
6.测试 环境——参数——通信
*其实环境也很重要，我就因为环境不对报错多次

4)遇到的问题和困难
因为之前没有经常使用ROS ，所以完成这次作业其实也是不断加深我对ROS的理解，做的时候一直有遇到问题，下面是能回忆起来的大问题
首先是自定义消息编译错误，修改TurtleVel.msg后执行catkin_make，C++节点报错，而且rostopic echo /turtle_vel_cmd也无输出，然后我检查发现是CMake配置有问题，缺少message_generation依赖，然后我补全CMakeLists之后重新编译，激活环境消息就生成成功了。（也有忘记激活环境，节点还用的旧消息报错）
然后是参数的读取失败了，控制器nh.getParam("angular_velocity", ang_vel)返回false，小龟原地打转，角速度为0.然后我检查参数，，发现没有加载，再检查了YAML,发现了路径不对，而且YAML是用空格缩进的，我语法也错了，后面就修改再参数验证就对了
然后是节点启动报错，执行rosrun package2 turtle_controller报错，上网搜检查了路径、文件权限、然后发现没有执行权限和忘记指定了正确的Python解释器，修正过后就可以了。
还有很多小问题，修改了.msg文件之后没有重新编译，重做的时候消息名冲突报错、cmake版本不对，但是升级后修改CMakeLists.txt首行版本号才不报错等问题。

5)ROS学习笔记
节点(Node)​​ 独立执行单元turtlesim_node
	
话题(Topic)​​ 异步通信通道turtle1/cmd_vel
	
消息(Message)​​ 话题数据载体geometry_msgs/Twist
	
 ​​自定义消息开发
 1.创建msg/TurtleVel.msg
 2.修改package.xml
 3.修改CMakeLists.txt
 ​​参数服务器使用​​
 1.YAML配置​​ (config/params.yaml)
 2.​​代码读取​​ 
 3.launch
 
 注意事项：检查环境是否未激活或路径是否正确、检查YAML加载和路径、检查脚本无执行权限、要能模块化验证
	
二、进阶作业
1）启动流程
cd ~/hw_ros_ws
catkin_make
source devel/setup.bash
roscore
rosrun package2 cone_counter.py
~/hw_ros_ws/src/fsd_common_msgs/bag$ rosbag play "lidar_cone_side_&_slam_state.bag"

rviz


2)作业2完成思路
配置环境- 确认锥桶的消息定义在Cone.msg
在初级任务工作空间下,放入所给的包,然后就编写脚本
脚本县初始化节点,订阅和发布话题,然后统计颜色(这里有参考了别人的代码)
rosbag play Bag 文件,再rosrun cone_counter.py 
启动RViz
3)遇到的困难
首先是因为不熟悉和目录复杂,所以脚本的路径上总是出错,后面用绝对路径和每次运行前会检查.然后是编写代码的时候没有订阅的话题名和bag中不一致，后面该改过来，节点和话题连上了就没问题了
其实还遇到了很多很多问题,消息倒入不成功,Rviz没有配好不能可视化之类的,不能读取Bag文件等,后面查资料和问同学都已经解决了.

三、选做作业可视化锥桶
启动 roslaunch cone_sim spawn_cone.launch
完成思路，参考了网络的结构和参数，然后按模板编译代码

遇到的问题，因为关节的连接没有正确定义，后面用urdf_to_graphiz生成结构图，看到没有连上，修改之后就没有问题了。
