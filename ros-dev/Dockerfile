FROM osrf/ros:noetic-desktop-full

COPY update_source.sh /opt/update_source.sh
RUN sudo /opt/update_source.sh

RUN apt-get -y update && apt-get install -y openssh-server rsync gdb tmux socat

RUN mkdir /var/run/sshd
#RUN echo 'root:THE_PASSWORD_YOU_CREATED' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN env | grep _ >> /etc/environment && env | grep PATH >> /etc/environment
