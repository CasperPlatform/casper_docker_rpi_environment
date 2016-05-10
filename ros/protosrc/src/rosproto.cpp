// Include the ROS C++ APIs
#include <ros/ros.h>
#include <boost/asio.hpp>
// Standard C++ entry point
int main(int argc, char** argv) {

boost::asio::io_service io_service;
 // Announce this program to the ROS master as a "node" called "hello_world_node"
 ros::init(argc, argv, "hello_world_node");
 // Start the node resource managers (communication, time, etc)
 ros::start();
 // Broadcast a simple log message
 ROS_INFO_STREAM("Hello, world!");
 // Process ROS callbacks until receiving a SIGINT (ctrl-c)
 ros::spin();
 // Stop the node's resources
 ros::shutdown();
 // Exit tranquilly
 return 0;
}

// g++ -g /src/ros/src/rosproto.cpp -o /src/ros/build/driveserver -I/opt/ros/indigo/include \
// -I/usr/include -L/usr/lib -L/opt/ros/indigo/lib -L/usr/lib/arm-linux-gnueabihf \
// -Wl,-rpath,/opt/ros/indigo/lib \
// -lboost_system -lboost_date_time -lboost_thread -lpthread -lroscpp \
// -lrosconsole -lrostime   


// g++ /src/ros/src/rosproto.cpp -o build/hello_world_node -I/opt/ros/indigo/include \
// -I/usr/include -L/usr/lib -L/opt/ros/indigo/lib -L/usr/lib/arm-linux-gnueabihf \
// -Wl,-rpath,/opt/ros/indigo/lib  -lboost_system -lboost_thread -lpthread -lroscpp \
// -lrosconsole -lrostime