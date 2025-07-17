#!/bin/bash

abs_script=$(readlink -f "$0")
abs_dir=$(dirname ${abs_script})
WORK_DIR=$abs_dir/userdir 
_ROS_SETUP=/userdir/catkin_ws/devel/setup.bash
# _ROS_IP=
# _ROS_HOSTNAME=
_ROS_MASTER_URI=

while [[ $# -gt 0 ]]; do
    case $1 in
        -w|--workspace)
            WORK_DIR="$2"
            shift
            shift
            ;;
        --ros-setup)
            _ROS_SETUP="$2"
            shift
            shift
            ;;
        --ros-ip)
            _ROS_IP="$2"
            shift
            shift
            ;;
        --ros-hostname)
            _ROS_HOSTNAME="$2"
            shift
            shift
            ;;
        --ros-master-uri)
            _ROS_MASTER_URI="$2"
            shift
            shift
            ;;
        --help)
            echo "run.sh [-w|--workspace workspace] [--ros-setup ROS_SETUP] [--ros-ip ROS_IP] [--ros-hostname ROS_HOSTNAME] [--ros-master-uri ROS_MASTER_URI] "
            exit 0
            ;;
        --)
            shift
            break
            ;;
        -*|--*)
            echo "Unknown option $1"
            exit 1
            ;;
        *)
            POSITIONAL_ARGS+=("$1") # save positional arg
            shift # past argument
            ;;
    esac
done



if [ "${_ROS_IP}" == "" ]; then
    rosip_option=" "
else 
    rosip_option=" --ros-ip ${_ROS_IP} "
fi

if [ "${_ROS_HOSTNAME}" == "" ]; then
    roshostname_option=" "
else 
    roshostname_option=" --ros-hostname ${_ROS_HOSTNAME} "
fi

if [ "${_ROS_MASTER_URI}" == "" ]; then
    rosmaster_option=" "
else 
    rosmaster_option=" --ros-master-uri ${_ROS_MASTER_URI} "
fi

.irsl_docker_irsl_system/run.sh \
--image irsl_ros_detection \
--name irsl_ros_detection \
--workspace ${WORK_DIR} \
--ros-setup ${_ROS_SETUP}  \
${rosmaster_option} \
${roshostname_option} \
${rosip_option}

# --ros-ip ${_ROS_IP}  \
# --ros-hostname ${_ROS_HOSTNAME}  \
# --ros-master-uri ${_ROS_MASTER_URI}  \
# --workspace ${WORK_DIR}
