# Greenplum集群一键安装

## 一、功能简介

> 基于ansible自动化运维工具提供Greenplum6数据库多节点在CentOS7系统下的一键安装部署功能。

## 二、安装包制作

```
[root@localhost root]# git clone  https://gitee.com/inrgihc/greenplum_installer.git
[root@localhost root]# cd greenplum_installer && make all
[root@localhost root]# tree bin/
.
├── host.ini
└── greenplum6-centos7-installer-release.bin
```

## 三、配置文件host.ini说明

安装所需的配置文件为host.ini，配置内容包括：

### 1、 主机列表配置

见host.ini文件中的[node]节，要求：

- （1）主机列表至少有3台机器（虚拟机或物理机，不支持容器等）；

- （2）ansible_ssh_user参数必须为root，端口号必须为22；

- （3）Greenplum的master节点与standby节点不能重叠(复用)

- （5）[all:vars]节中必须使用主机名进行主机角色配置

示例如下：

```
[node]
192.168.31.54 hostname=node1 ansible_ssh_user=root ansible_ssh_port=22 ansible_ssh_pass='123321'
192.168.31.55 hostname=node2 ansible_ssh_user=root ansible_ssh_port=22 ansible_ssh_pass='123321'
192.168.31.56 hostname=node3 ansible_ssh_user=root ansible_ssh_port=22 ansible_ssh_pass='123321'
192.168.31.57 hostname=node4 ansible_ssh_user=root ansible_ssh_port=22 ansible_ssh_pass='123321'
```

**说明**：

> 第一列为主机的IP地址(根据实际IP进行填写)；

> 第二列为对应主机的主机名hostname(可自定义各个主机的主机名)；

> 第三列为登录账号ansible_ssh_user必须为root；

> 第四列为服务器SSH的端口号（必须为22）；

> 第五列为对应主机root账号的密码。

### 2、 集群参数配置

Greenplum集群参数配置包括：

```
# greenplum在主机上的数据存储目录位置
greenplum_data_directory='/data/gpdb'

# Greenplum数据库的master节点主机名，只能为一个主机
greenplum_master_node='node1'

# greenplum的standby节点主机名，只能为一个主机，可选项，如
# 果被井号注释则代表不配置standby节点，如果配置则务必不能与master节点复用
# greenplum_standby_node='node2'

## greenplum的segment主机节点列表,要求至少有2个节点
greenplum_segment_nodes='node2 node3 node4'
```

## 四、安装与卸载

- 安装操作

请按照上述配置内容配置host.ini文件,然后执行如下命令进行实际的安装操作:

```
[root@localhost bin]# sh ./greenplum6-centos7-installer-release.bin ./host.ini install
```

- 卸载操作

卸载时的配置host.ini文件内容必须与安装时的配置内容完全一致,然后方可执行如下命令进行卸载操作:

```
[root@localhost bin]# sh ./greenplum6-centos7-installer-release.bin ./host.ini uninstall
```

## 五、问题反馈

如果您看到或使用了本工具，或您觉得本工具对您有价值，请为此项目点个赞，多谢！如果您在使用时遇到了bug，欢迎在issue中反馈。也可扫描下方二维码入群讨论：（加好友请注明："程序交流"）

![structure](https://gitee.com/inrgihc/dbswitch/raw/master/images/weixin.PNG)

