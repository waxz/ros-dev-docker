#!/bin/bash
source /opt/ros/$ROS_DISTRO/setup.bash
#echo 1234 | sudo -S  sh -c "sudo ln -s /opt/cmake/bin/* /usr/local/bin/"
cmake --version
echo "please input password to start ssh server"
sudo /usr/sbin/sshd -p 2222
tmux

