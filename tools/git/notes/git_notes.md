# git笔记

> git是一个免费、开源的分布式版本控制工具，可快速、高效的处理从小到大各种项目。且简单易学、有廉价的本地库、方便的暂存区和多分支等特性。  

## git概述

> [git官网：https://git-scm.com/](https://git-scm.com/)  
> --everything-is-local  
> --fast-version-control
> --distributed-even-if-your-workflow-isnt  
> 版本控制系统：记录文件内容变化，以便查阅或修改特定版本的系统  

### git工作机制

> 远程库  
> 历史版本 -> 本地库 -> git push 远程库  
> 临时存储 -> 暂存区 -> git commit 本地库  
> 写代码 -> 工作区 -> git add 暂存区  
> git init 初始化本地库

### 代码托管中心

> 基于网络服务的远程代码仓库，即：远程库

- 局域网：GitLab  
- 互联网：GitHub(外网)、Gitee(内网)  

## git的本地使用

### 设置用户签名

> 签名作用：区分不同操作者，查看本次提交是谁做的。  

| 命令 | 作用 |
| ---- | ---- |
| git config --global user.name 用户名 | 设置用户签名 |
| git config --global user.email 邮箱地址 | 设置用户邮箱 |
| git config --list | 查看配置列表 |

### git基本操作

| 命令 | 作用 |
| ---- | ---- |
| git init | 初始化本地库 |
| git status | 查看本地库状态 |
| git add 文件名 | 添加暂存区 |
| git rm --cached 文件名 | 从暂存区删除文件 |
| git commit -m "日志信息" 文件名 | 提交本地库 |
| git reflog | 查看历史记录 |
| git log | 查看详细历史记录 |
| git reset --hard 版本号 | 版本穿梭 |

1. 初始化本地库 git init
2. 查看本地库状态 git status
3. 添加暂存区 git add 文件名
4. 提交本地库 git commit -m "日志信息" 文件名
5. 查看历史记录 git reflog-查看已经提交的历史版本
6. 版本穿梭-回到以前的版本 gitreset --hard 版本号

### git分支基本操作

> 在版本控制中，同时推进多个任务，为每个任务创建独立的分支，从主线分支分离出去，每个分支不会影响主线分支。(分支的底层为指针的引用)  

| 命令 | 作用 |
| ---- | ---- |
| git branch 分支名 | 创建分支 |
| git branch -v | 查看分支 |
| git checkout 分支名 | 切换分支 |
| git merge 分支名 | 合并指定分支 |

1. 创建分支 git branch 分支名  
2. 查看分支 git branch -v  
3. 切换分支 git checkout 分支名  
4. 合并分支-将指定分支合并到当前分支(被合并的分支并不会消失) git merge 分支名  

### 代码冲突和冲突合并

> 代码冲突，两个分支在同一个文件同一个位置有两套完全不同的修改，git无法决定，必须人为决定合并后内容。

- 合并方法：  

1. 手动打开文件认为修改
2. 将修改后的文件添加暂存区
3. 提交本地库（此时提交不能带文件名）（被合并的分支不会被修改）

## 团队协作

> 团队内协作&跨团队协作

| 命令 | 作用 | 备注 |
| ---- | ---- | ---- |
| git remote -v | 查看当前所有远程地址别名 |
| git remote add 别名 远程地址 | 创建远程地址别名 |
| git push 别名或地址 分支名 | 推送本地分支到远程库 |
| git pull 别名或地址 分支名 | 拉去远程端文件到本地库 |
| git clone 地址 | 克隆远程库到本地 | 克隆后自动创建别名为origin |

### GitHub团队协作

[GitHub：https://github.com/](https://github.com/)

1. 创建远程库，复制远程库链接
2. 创建远程库地址别名 git remote add 别名 远程地址
3. 推送本地库到远程库 git push 别名或地址 分支名
4. 拉去远程库到本地库 git pull 别名或地址 分支名
5. 克隆远程库到本地库 git clone 远程库地址

### 跨团队协作

1. 去代码仓库fork一份到自己远程库
2. clone到本地库，进行修改
3. push到自己的远程库，向对方发起pull request请求
4. 对方审核后merge合并到自己的库

## SSH免密登录

- 创建公私钥

```shell
cd ~/.ssh
ssh-keygen -t rsa -C "github登录邮箱"
```

> 1. 输入你的秘钥名
> 2. 输入你的私钥密码 随便写
> 3. 输入命令的目录下就会多两个文件ssh.txt和ssh.txt.pub，其中ssh.txt.pub就是你的公钥

- 添加公钥到github
