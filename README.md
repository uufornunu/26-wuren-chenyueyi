https://github.com/uufornunu/26-wuren-chenyueyi
1）目录
hw_ros_ws/ 
├── build/ 
├── devel/
│   ├── lib/ 
│   │   └── package2/      # 节点可执行文件 
│   │       ├── turtle_controller_node  # C++控制器 
│   │       └── turtle_vel_pub.py        # Python发布者 
│   └── setup.bash         # 环境激活脚本 
└── src/ 
    └── package2/          # 功能包主目录 
        ├── config/  
        │   └── params.yaml               # 速度阈值配置  
        ├── launch/  
        │   └── control.launch            # 启动文件  
        ├── msg/  
        │   └── TurtleVel.msg             # 自定义消息  
        ├── scripts/  
        │   └── turtle_vel_pub.py         # 速度发布节点源码  
        ├── src/  
        │   └── turtle_controller.cpp     # 运动控制器源码  
        └── package.xml                   # 包依赖声明

2）启动流程
cd ~/hw_ros_ws 
catkin_make              # 生成可执行文件 
source devel/setup.bash  # 激活环境（不要再忘记了T T）
roslaunch package2 control.launch

3)作业完成思路
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
	


