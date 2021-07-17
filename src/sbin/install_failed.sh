#!/bin/bash
############################################
# Function :  安装失败后的提示信息
# Author : tang
# Date : 2020-10-22
#
# Usage: sh install_failed.sh
#
############################################

shellwidth=$(stty size | awk '{print $2}')
function print_line() {
    for ((i = 1; i <= $shellwidth; i++)); do
        echo -n '*'
    done
}

# 打印结束
print_line
echo ""
echo ""
echo ""
print_line
echo ""
echo "   !!! 非 常 抱 歉 本 次 系 统 安 装 【失 败】 !!!"
echo ""
print_line
echo ""
echo " 您可以尝试如下操作："
echo ""
echo " 一、 根据上述提示的错误信息，进行如下步骤:"
echo ""
echo "   1 检查host.ini配置文件中的参数是否错误"
echo ""
echo "   2 重启所有服务器"
echo ""
echo "   3 先执行卸载操作"
echo ""
echo "   4 再次执行安装操作"
echo ""
echo " 二、 经过上述步骤的多次尝试后，仍然无法解决时，您可尝试:"
echo ""
echo "   将安装日志文件(gpdb_install.log)以电子邮件的方式发送至：inrgihc@126.com寻求帮助"
echo ""
print_line