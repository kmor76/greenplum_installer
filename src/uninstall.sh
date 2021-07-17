#!/bin/bash
############################################
# Function :  项目卸载入口
# Author : tang
# Date : 2020-10-12
#
# Usage: sh uninstall.sh
#
############################################
INI_FILE_NAME=$1
SELF_SHELL_PATH=$(cd `dirname $0`; pwd)

# 屏幕打印
source ./sbin/logo_printer.sh

# 环境检查
source ./sbin/environment.sh

# 使用ansible执行项目卸载操作
ansible-playbook -c paramiko -i $INI_FILE_NAME ./clean.yml
if [[ "$?" -ne 0 ]]; then
    echo "[ERROR]: 本次卸载操作失败，您可以尝试再次执行【卸载】操作! "
    exit 1
else
    echo "[INFO]: 卸载操作执行成功! "
fi