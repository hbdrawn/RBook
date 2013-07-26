golang编译器安装与配置
golang目前有两种编译，一个是golang官方提供的，另一个是gnu提供的gccgo;

golang官方编译器安装与配置

安装gcc工具,因为golang有些功能是使用c写的，所以构建golang的编译是必须的
$ sudo apt-get install bison gawk gcc libc6-dev make
安装mercurial工具，目的使用hg命令来提取golang的源代码
$ sudo apt-get install mercurial
代取提取，如果您的网速比较慢的话，此步要多花点时间
$ hg clone -r release https://go.googlecode.com/hg/ go
编译golang
$ cd go/src
$ ./all.bash
假如正常的话，会出现下面的信息

ALL TESTS PASSED

---
Installed Go for linux/amd64 in /home/you/go.
Installed commands in /home/you/go/bin.
*** You need to add /home/you/go/bin to your $PATH. ***
The compiler is 6g.
＊配置系统环境 你在～/.bashrc或者 ～/.profile写入你的配置文件，下面我会以.bashrc来说明； 那么，golang要设置那些变量呢？ 1、$GOROOT golang的目录，这里我们是~/go 2、$GOOS 和 $GOARCH 系统的参数 设置方法如下：

	$GOOS 	$GOARCH 	
	darwin 	386
	darwin 	amd64
	freebsd 	386
	freebsd 	amd64
	linux 	386
	linux 	amd64
	linux 	arm 	incomplete
	windows 	386 	incomplete
3、$GOBIN golang的bin目录，这里是~/go/bin 下面是一个配置例子：请大家特别注意$GOOS 和 $GOARCH 的配置

$ gedit ~/.bashrc
然后加入

export GOROOT=~/go
export GOARCH=386
export GOOS=linux
export GOBIN=$GOROOT/bin/
export GOTOOLS=$GOROOT/pkg/tool/
export PATH=$PATH:$GOBIN:$GOTOOLS
上面这么多，其实也可以用软件源安装！命令如下

sudo﻿ add-apt-repository ppa:gophers/go
sudo apt-get update
sudo apt-get install golang
gccgo安装 gccgo似乎是从4.6开始支持的。也就是说，要在ubuntu用命令安装gccgo只有ubuntu 11.10包括且以上的版本。

大家可以试一下命令
gcc -v
，查看
--enable-languages=c,c++,objc,obj-c++,java,fortran,ada,go,lto --enable-plugin 
如果有一个go，说明你的gcc支持golang，那么就执行以下命令安装gcc-go(大家试一下这命令，我不敢确定)：

sudo apt-get install gccgo
如果用源代码编译的话，请参照gcc编译。这里就不介绍了！

转：http://wiki.ubuntu.org.cn/Golang#golang.E7.BC.96.E8.AF.91.E5.99.A8.E5.AE.89.E8.A3.85.E4.B8.8E.E9.85.8D.E7.BD.AE