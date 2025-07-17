# irsl_ros_detection_ws

## clone repo.
```
git clone --recursive https://github.com/Hiroaki-Masuzawa/irsl_ros_detection_ws.git
```

## build
```
./build.sh
```

## run service server
```
./run.sh
```
```
cd catkin_ws
catkin build
source devel/setup.bash
roslaunch irsl_ros_detection instance_segmentation.launch
```

## run sample
```
docker exec -it irsl_ros_detection bash
```
```
source /userdir/catkin_ws/devel/setup.bash
cd catkin_ws/src/irsl_ros_detection/sample/
wget http://images.cocodataset.org/val2017/000000439715.jpg -q -O input.jpg
python3 sample.py
```