#  **mysql阅读笔记**

## 优化-性能调优

1. 性能决定于DB的三个层次：表结构、检索语句和DB配置
-  软件最终转换为硬件对CPU和IO的使用情况
-  DB层优化：
	* 表结构的正确设计：频繁更新的系统大多为多表少列；大数据分析的系统多是少表多列；
	* 索引
	* 存储引擎：为不同的表结构选择不同的存储引擎（innoDB || myisam）
	* mysql5.5+版本默认为innoDB,性能比myisam要好，且适用于繁忙的业务系统
	* 表结构采用压缩策略，可以大量减少IO操作时间，适用于所有的innodb和可读的myisam表
	* 锁策略：innodb最好
	* 缓存策略：innodb buffer pool配置；myisam的key cache配置；mysql query cache配置
-  硬件调优
	* 硬盘寻址时间：目前寻址能力在10ms以内，即100次/s；最优的方式是多盘存储
	* IO读写时间：目前硬盘吞吐量平均为10-20M/s；最优方式是并发从多盘同时读取
	* CPU周期：数据量大时影响较大；小数据量无所谓；
	* 主缓存：当cpu缓存不够时，主缓存会成为最大瓶颈
-  对便携和性能的平衡：使用/\*! \*/语法
-  优化DB语句



------


## 备份与恢复

###备份策略：

+ 逻辑备份VS物理备份、全部备份VS增量备份
+ 时间点备份
+ 备份调度、压缩算法、加密策略
+ 表格修复