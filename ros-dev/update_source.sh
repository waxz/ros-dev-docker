#! /usr/bin/env bash

set -e


# script directory
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# check ubuntu version
# otherwise warn and point to docker?
UBUNTU_RELEASE=$(bash <(cat /etc/os-release; echo 'echo ${VERSION_ID/*, /}'))
echo "UBUNTU_RELEASE=$UBUNTU_RELEASE"
mv /etc/apt/sources.list /etc/apt/sources.list.bak

TARGETFILE="/etc/apt/sources.list"
if [[ "${UBUNTU_RELEASE}" == "14.04" ]]; then
	
tee -a ${TARGETFILE} > /dev/null <<EOT
deb https://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse

deb https://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse

deb https://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse

## Not recommended
# deb https://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
# deb-src https://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse

EOT
        echo "Ubuntu 14.04"
elif [[ "${UBUNTU_RELEASE}" == "16.04" ]]; then
	
tee -a  ${TARGETFILE} > /dev/null <<EOT
deb http://ftp.sjtu.edu.cn/ubuntu/ xenial main
deb-src http://ftp.sjtu.edu.cn/ubuntu/ xenial main

deb http://ftp.sjtu.edu.cn/ubuntu/ xenial-updates main
deb-src http://ftp.sjtu.edu.cn/ubuntu/ xenial-updates main

deb http://ftp.sjtu.edu.cn/ubuntu/ xenial universe
deb-src http://ftp.sjtu.edu.cn/ubuntu/ xenial universe
deb http://ftp.sjtu.edu.cn/ubuntu/ xenial-updates universe
deb-src http://ftp.sjtu.edu.cn/ubuntu/ xenial-updates universe

deb http://ftp.sjtu.edu.cn/ubuntu/ xenial-security main
deb-src http://ftp.sjtu.edu.cn/ubuntu/ xenial-security main
deb http://ftp.sjtu.edu.cn/ubuntu/ xenial-security universe
deb-src http://ftp.sjtu.edu.cn/ubuntu/ xenial-security universe

EOT
        echo "Ubuntu 16.04"
elif [[ "${UBUNTU_RELEASE}" == "18.04" ]]; then

tee -a  ${TARGETFILE} > /dev/null <<EOT
deb http://ftp.sjtu.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb-src http://ftp.sjtu.edu.cn/ubuntu/ bionic main restricted universe multiverse

deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://ftp.sjtu.edu.cn/ubuntu/ bionic-security main restricted universe multiverse

deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://ftp.sjtu.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse

# deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
# deb-src http://ftp.sjtu.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse

deb http://ftp.sjtu.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://ftp.sjtu.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse

EOT

	echo "Ubuntu 18.04"
elif [[ "${UBUNTU_RELEASE}" == "20.04" ]]; then


tee -a  ${TARGETFILE} > /dev/null <<EOT
deb http://ftp.sjtu.edu.cn/ubuntu/ focal main restricted universe multiverse
deb-src http://ftp.sjtu.edu.cn/ubuntu/ focal main restricted universe multiverse

deb http://ftp.sjtu.edu.cn/ubuntu/ focal-security main restricted universe multiverse
deb-src http://ftp.sjtu.edu.cn/ubuntu/ focal-security main restricted universe multiverse

deb http://ftp.sjtu.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://ftp.sjtu.edu.cn/ubuntu/ focal-updates main restricted universe multiverse

# deb http://ftp.sjtu.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse
# deb-src http://ftp.sjtu.edu.cn/ubuntu/ focal-proposed main restricted universe multiverse

deb http://ftp.sjtu.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://ftp.sjtu.edu.cn/ubuntu/ focal-backports main restricted universe multiverse

EOT
	echo "Ubuntu 20.04"
elif [[ "${UBUNTU_RELEASE}" == "22.04" ]]; then


tee -a  ${TARGETFILE} > /dev/null <<EOT
deb https://mirrors.ustc.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse


EOT
	echo "Ubuntu 22.04"
fi
