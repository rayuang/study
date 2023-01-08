# Linux笔记

> Linux之父：Linus Torvalds  
> 主要发行版：Ubuntu、RedHat、CentOS、Debain、Fedora、SuSE、OpenSuSE  
> Linux和Unix：Linux是开发源代码的自由软件，Unix是传统商业软件。Linux的开发是处在一个完全开放的环境之中，Unix的开发完全是处在一个黑箱之中，只有相关的开发人员才能够接触的产品的原型。  
> GNU/Linux是在Unix -> AT&T System V -> Minix的基础上衍生出来的。  
> Unix只针对大型主机或服务器&Linux适用于X86的个人计算机  

## 文件系统

> 在Linux中，一切皆文件

| 目录 | 作用 | 扩展 |
| ---- | ---- | ---- |
| / | 根目录 | |
| /root | root用户主目录 | |
| /home | 家目录 | |
|/home/*|用户目录| |
|/bin| 存放指令的目录 | /usr/bin & /usr/local/bin |
| /sbin |管理员指令|/usr/sbin & /usr/local/sbin|
|/etc|配置文件和子目录| |
|/lib|动态连接共享库，类似于win DLL文件||
|lost+found|一般为空，系统非法关机后，会存放一些文件||
|/usr|系统默认安装程序目录，类似于win program files||
|/boot|linux系统启动相关文件||
|/proc|虚拟目录，系统内存映射，获取系统信息||
|/srv|存放服务启动后需要提取的数据||
|/sys|存放2.6内核中新出现的文件系统sysfs||
|/tmp|存放临时文件||
|/dev|类似于win设备管理器，所有硬件用文件形式存储||
|/media|linux识别设备后挂载的目录||
|/mnt|用户临时挂载别的文件系统||
|/opt|额外安装软件所存放的目录(未安装时)，默认空||
|/usr/local|额外安装软件所安装的目录(安装完)，一般通过编译源码方式安装程序||
|/var|存放不断扩充或一直被修改的文件，如日志文件||
|/selinux|SELinux->安全子系统，控制程序只能访问特定文件，有三种工作模式，可自行设置，需启用||

## vi&vim编辑器
