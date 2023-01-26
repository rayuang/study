# Node.js笔记

## 常用命令

```sh
初始化仓库 
npm init [-y]
#-y全部yes，默认初始化
npm install/i 包名 [-g] [--save-dev] {[uninstall],[update]}
#-g全局安装
#-save 的意思是将模块安装到项目目录下，并在package文件的dependencies节点写入依赖
# -save-dev 的意思是将模块安装到项目目录下，并在package文件的devDependencies节点写入依赖。
npm info 包名 
#查看包信息
npm list
#列举项目下载的模块
npm outdated
#检查包是否过时
```

1. package.json中，^3.3.3表示锁定3.*.*取最新版本
2. ~3.3.3表示锁定3.3.*取最新
3. *表示取最新

```sh
nrm ls #查看nrm镜像源
nrm use 镜像源名 #切换镜像源
nrm test #镜像源测速
```

```sh
#yarn并行下载、速度快
yarn init
yarn add [package]@[version] [--dev]
#升级
yarn upgrade [package]@[version]
yarn remove [package]
#安装全部依赖
yarn install

```
