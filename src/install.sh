#!/bin/bash
############################################
# Function :  项目安装入口
# Author : tang
# Date : 2020-10-12
#
# Usage: sh install.sh
#
############################################
INI_FILE_NAME=$1
SELF_SHELL_PATH=$(cd `dirname $0`; pwd)

# 屏幕打印
source ./sbin/logo_printer.sh 

# 环境检查
source ./sbin/environment.sh

# 开始计时(时间矫正，否在记录的时间不正确)
/usr/sbin/ntpdate -u ntp1.aliyun.com >/dev/null
begin_time=$(date +"%Y-%m-%d %H:%M:%S")

# 检查参数配置的有效性
ansible-playbook -i $INI_FILE_NAME ./validate.yaml 2>&1 >/dev/null
if [[ "$?" -ne 0 ]]; then
    echo "[ERROR]: Internal error, Please contact developers! "
    exit 1
else
    sh /tmp/greenplum/parameters.sh
    if [[ "$?" -ne 0 ]]; then
        echo "[ERROR]: Install Greenplum cluster failed,Please check log above! "
        source ./sbin/install_failed.sh
        exit 1
    fi
fi
rm -rf /tmp/greenplum/parameters.sh

# 使用ansible执行项目安装操作
ansible-playbook -c paramiko -i $INI_FILE_NAME ./setup.yml
if [[ "$?" -ne 0 ]]; then
    echo "[ERROR]: Install Greenplum cluster failed,Please check log above! "
    source ./sbin/install_failed.sh
else
    # 结束计时
    end_time=$(date +"%Y-%m-%d %H:%M:%S")

    # 打印结束
    source /tmp/greenplum/install_success.sh

    # 打印安装时间
    echo '' 
    echo ' 安装开始时间: '$begin_time 
    echo '' 
    echo ' 安装结束时间: '$end_time
    echo '' 
fi
