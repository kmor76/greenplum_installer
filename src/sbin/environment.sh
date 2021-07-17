#!/bin/bash
############################################
# Function :  环境检查
# Author : tang
# Date : 2020-10-12
#
# Usage: sh environment.sh
#
############################################

# 利用yum安装依赖包函数
function package_install() {
    echo "[INFO]: check command package : [ $1 ]"
    if ! rpm -qa | grep -q "^$1"; then
        yum install -y $1
        package_check_ok
    else
        echo "[INFO]: command [ $1 ] already installed."
    fi
}

# 检查命令是否执行成功
function package_check_ok() {
    ret=$?
    if [ $ret != 0 ]; then
        echo "[ERROR]: Install package failed, error code is $ret, Check the error log."
        exit 1
    fi
}

# 要求必须以root账号执行
if [ "$(whoami)" != 'root' ]; then
    echo "[ERROR]: You have no permission to run $0 as non-root user."
    exit 1
fi

# 判断并利用yum安装依赖
package=(epel-release python ansible ntpdate)
for p in ${package[@]}; do
    package_install $p
done
