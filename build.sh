docker pull repo.irsl.eiiris.tut.ac.jp/irsl_base:cuda_12.1.0-cudnn8-devel-ubuntu22.04_one
docker build . -f Dockerfile -t irsl_ros_detection

# catkin_create_pkg irsl_ros_detection std_msgs sensor_msgs  irsl_detection_msgs irsl_detection_srvs 