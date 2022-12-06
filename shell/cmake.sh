#!/bin/bash

#source /home/waxz/CLionProjects/docker_demo/3rdparty/oneapi-tbb-2021.5.0/env/vars.sh
source /opt/ros/$ROS_DISTRO/setup.bash 
source /home/waxz/share/slam_ws/devel/setup.bash --extend
#export ROS_MASTER_URI=http://localhost:11311
quoted_args="$(printf "${1+ %q}" "$@")" # Note: this will have a leading space before the first arg
# echo "Quoted args:$quoted_args" # Uncomment this to see what it's doing
#echo "quoted_args ${quoted_args}"
bash -c "cmake  $quoted_args"

