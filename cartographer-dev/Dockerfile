FROM rrdockerhub/cartographer_ros:melodic
#

RUN  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F42ED6FBAB17C654

COPY update_source.sh /opt/update_source.sh
RUN /opt/update_source.sh
RUN apt-get -y update && apt-get install -y openssh-server rsync gdb tmux socat git curl
#RUN apt-key adv --keyserver hkps://keyserver.ubuntu.com --refresh-keys
#RUN apt-key adv --refresh-keys

#RUN apt-key list  | grep "expired: " | sed -ne 's|pub .*/\([^ ]*\) .*|\1|gp' | xargs -n1 sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 

  



RUN mkdir /var/run/sshd
#RUN echo 'root:THE_PASSWORD_YOU_CREATED' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN env | grep _ >> /etc/environment && env | grep PATH >> /etc/environment
#install latest cmake

#COPY install_Cartographer_ros.sh /opt/install_Cartographer_ros.sh

#RUN apt-get install -y ros-$ROS_DISTRO-ridgeback-simulator ros-$ROS_DISTRO-ridgeback-desktop ros-$ROS_DISTRO-ridgeback-navigation
#RUN ros-$ROS_DISTRO-boxer-description ros-$ROS_DISTRO-boxer-desktop ros-$ROS_DISTRO-boxer-simulation ros-$ROS_DISTRO-boxer-robot

RUN apt-get install -y ros-$ROS_DISTRO-hector-slam

RUN useradd -ms /bin/bash waxz && echo 'waxz:1234' | chpasswd && adduser waxz sudo 

