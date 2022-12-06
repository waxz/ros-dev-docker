#!/bin/bash
source /opt/ros/$ROS_DISTRO/setup.bash
#echo 1234 | sudo -S  sh -c "sudo ln -s /opt/cmake/bin/* /usr/local/bin/"
cmake --version
export PATH=$PATH:/usr/bin:$PYTHONUSERBASE/bin
echo "please input password to start ssh server , using port $SSH_PORT "
sudo /usr/sbin/sshd -p $SSH_PORT
tmux

