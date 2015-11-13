Ubutun中文乱码问题
==================
打开vim的配置文件，位置在/etc/vim/vimrc,在最后面附加如下三行代码即可
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
set fileencodings=utf-8,gb2312,gbk,gb18030

set termencoding=utf-8

set encoding=prc
