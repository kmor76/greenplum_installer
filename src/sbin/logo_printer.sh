#!/bin/bash
############################################
# Function :  LOGO版权打印
# Author : tang
# Date : 2020-10-21
#
# Usage: sh logo_printer.sh
#
############################################

# 发布时间设置
PUBLISH_DATE=2021-07-17
VERSION_CODE=1.0
AUTHOR_NAME=tang
CONTACT_ADDR=inrgihc@126.com

now_time=$(date +"%Y-%m-%d %H:%M:%S")
shellwidth=$(stty size | awk '{print $2}')

function print_line() {
    for ((i = 1; i <= $shellwidth; i++)); do
        echo -n '*'
    done
}

print_line
echo ''
echo ' ________  ________  _______   _______   ________   ________  ___       ___  ___  _____ ______      '
echo '|\   ____\|\   __  \|\  ___ \ |\  ___ \ |\   ___  \|\   __  \|\  \     |\  \|\  \|\   _ \  _   \    '
echo '\ \  \___|\ \  \|\  \ \   __/|\ \   __/|\ \  \\ \  \ \  \|\  \ \  \    \ \  \\\  \ \  \\\__\ \  \   '
echo ' \ \  \  __\ \   _  _\ \  \_|/_\ \  \_|/_\ \  \\ \  \ \   ____\ \  \    \ \  \\\  \ \  \\|__| \  \  '
echo '  \ \  \|\  \ \  \\  \\ \  \_|\ \ \  \_|\ \ \  \\ \  \ \  \___|\ \  \____\ \  \\\  \ \  \    \ \  \ '
echo '   \ \_______\ \__\\ _\\ \_______\ \_______\ \__\\ \__\ \__\    \ \_______\ \_______\ \__\    \ \__\'
echo '    \|_______|\|__|\|__|\|_______|\|_______|\|__| \|__|\|__|     \|_______|\|_______|\|__|     \|__|'
echo ''
echo ''
echo ' Greenplum Cluster Automatic Installer V'$VERSION_CODE' '
echo ' Publish Time  : '$PUBLISH_DATE' '
echo ' Write Author  : '$AUTHOR_NAME'  '
echo ' Contact Email : '$CONTACT_ADDR'  '
echo ' Copyright @ tang reserved!'
echo ''
echo ' Operation time: '$now_time ' '
echo ''
print_line
