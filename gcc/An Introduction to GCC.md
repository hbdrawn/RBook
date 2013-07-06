=================================================
本书比较简单，只列出对应的目录结构，==>温习使用：
=================================================

1. stallman认为软件的特质：简单、稳定、道德伦理上的自由使用；

2. 自由软件的含义：

3. gcc= gnu compile collection

4. gcc主要特征：
	
	a. 可移植性：自编译、跨平台编译；
	
	b. 支持类型众多；
	
	c. 模块化设计；
	
	d. 自由使用、修改；

5. 编译概念：源码->机器码（控制cpu的二级制可执行文件）；

6. 命令：

	a. gcc -Wall -o(a.out)
	
	b. gcc -c ：编译为对象文件=》链接器为可执行文件；对象文件的链接次序；
	
	c. 外部库文件链接：静态库（.a）+ 动态库；
	   
	   静态库生成：归档器ar从文件对象生成；
	   
	   系统库：/usr/lib || /lib || /usr/lib/include/*.h /usr/lib64 || /lib64
	   
	   gcc -Wall A.c -lm -c A
	   
	   库的链接次序：从左到右；
	
	d. 使用库的头文件：接口的正确匹配；

7. 编译选项
	
	a. 设置搜索路径:覆盖优先级；
		
		INCDLUE路径：/usr/local/include -> /usr/include/;
		
		链接路径：/usr/local/lib -> /usr/lib;
		
		-I -L
		
		环境变量设置：C_INCLUDE_PATH、CPP_INCLUDE_PATH、LIBRARY_PATH;
	
	b. 扩展搜索路径：搜索路径的原则=I+L->环境变量->系统默认路径；

8. 共享库与静态库

	a. 共享对象：so
	
	b. 与静态库区别：编译加载方式、无需重新编译,优先级更高；
	
	c. 动态链接：执行之前，需要先加载到内存，故需要默认放到链接路径中
	
	d. -r LD_LIBRARY_PATH
	
	e. -static 优先使用静态库

9. C标准
	
	a. -ansi -std   ???

10. 预处理器cpp
	
	a. 定义宏 #ifdef #endif #define 
	
	b. gcc -dM /def/null 
	
	c. -Dname=value
	
	d. 加个()
	
	e. gcc -E || -save-temps
	
	f. -g带编译信息调试
	
	h. ulimit -c || gdb a.out core 
	
	g. 显示回显堆栈 gdb backtrace（up,down）

11. 编译优化:提高可执行代码的运行速度或减少大小
	
	a. 源码级优化
		
		公共子表达式消除（CSE）；
		
		函数内嵌：inline
	
	b. 速度和空间的折中
	
		循环展开：空间更大，但速度更快；
		
		指令调度：编译器决定各条指令的最佳次序；提高运行速度，但内存跟编译时间更多；
	
	c. 优化级别
		
		-O0调试、默认 -O1普通优化 -O2发版默认级别、指令调度 -O3函数内嵌 -Os减少文件大小
	
	d. 优化及调试：发布程序默认为-g -O2

9. 知识点：
	
	a. #include "" 与 #include <>区别
	
	b. 编译时无需在gcc参数中指定头文件
	
	c. null = 0x00
	
	d. gcc -v

===========================================================================================

1. ar cr(create and replace) *.a *.o
   
	ar t *.a

2. 性能剖析工具 gprof
   
	-pg

3. 覆盖测试工具
   
	-fprofile-arcs -ftest-coverage

4. 辨识文件 file a.out

5. 查找动态链接库 ldd a.out
