FROM osrf/ros:noetic-desktop-full

COPY update_source.sh /opt/update_source.sh
RUN sudo /opt/update_source.sh

RUN apt-get -y update && apt-get install -y openssh-server rsync gdb tmux socat git curl

RUN mkdir /var/run/sshd
#RUN echo 'root:THE_PASSWORD_YOU_CREATED' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN env | grep _ >> /etc/environment && env | grep PATH >> /etc/environment


RUN apt-get install -y libsdl-dev libsdl-image1.2-dev libgflags-dev libpcap-dev libsuitesparse-dev libreadline-dev libceres-dev libgeographic-dev
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-openslam-gmapping ros-$ROS_DISTRO-tf2-sensor-msgs ros-$ROS_DISTRO-move-base-msgs ros-$ROS_DISTRO-sound-play ros-$ROS_DISTRO-ecl-build ros-$ROS_DISTRO-ecl-config ros-$ROS_DISTRO-ecl-exceptions ros-$ROS_DISTRO-ecl-formatters ros-$ROS_DISTRO-ecl-linear-algebra

RUN apt-get install -y qt5-default python3-rosdep python3-vcstool python3-colcon-common-extensions
RUN apt-get install -y valgrind
RUN apt-get install -y gnuplot
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-plotjuggler-ros
RUN apt-get install -y python3-pip
#RUN pip install --user open3d

RUN apt-get -y update && apt-get install -y xauth nautilus x11-xserver-utils
RUN apt install -y libasio-dev libtinyxml2-dev libacl1-dev libncurses5-dev libshp-dev
#RUN apt-get -y update && apt install -y openjdk-19-jdk openjdk-19-jre

# for cross compile
RUN apt-get -y install g++-mingw-w64 mingw-w64 gcc-multilib
