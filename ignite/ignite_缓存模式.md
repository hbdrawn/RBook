apache ignite使用手册

1. 缓存操作的三种模型：partitioned，replicated & local
2. 以上三种模型在CacheModel中配置

#分区模型（分块模型）
1. 最好的可扩展性
2. 在节点间平均分配，形成巨大的分布式缓存模型
3. 百级别T级数量级数据，节点越多，数据量越大，无限制
4. 与replicated模式对比，写操作更节省资源（只更新缓存和备份节点），但是读操作更费时（只存在部分节点）；
5. affinity colocation：亲和托管
6. 针对大数据集和频繁更新类操作，分区模型最适合

#复制模式
1. 每个节点都有其他所有节点的备份
2. 写入操作会发生在所有节点上，浪费资源
3. 适用场合：数据集小、读操作比写操作频繁；假如80%时间都在使用读操作，则推荐使用此场景

#本地模式
1. 轻量级使用模式，只在当前节点存储数据；
2. 适用场景：只读或固定频率刷新
3. 与read-throuth配合使用

#模式配置
```xml
    <bean class="org.apache.ignite.configuration.IgniteConfiguration">
    ...
    <property name="cacheConfiguration">
        <bean class="org.apache.ignite.configuration.CacheConfiguration">
            <!-- Set a cache name. -->
            <property name="name" value="cacheName"/>
            
            <!-- Set cache mode. -->
            <property name="cacheMode" value="PARTITIONED"/>
            ... 
        </bean
    </property>
    </bean>
```

#原生的有序写操作
1. 配置节点写入顺序配置：CacheAtomicity.ATMOIC
2. CacheAtomicWriteOrderMode:CLOCK & PRIMARY
3. CLOCK:写入sender节点
4. 当使用CacheWriteSynchronizationMode.FULL_SYNC时，CLOCK模式自动打开，此时性能更高，因为主节点和备份节点同时被通知
5. PRIMARY：写操作只在主节点，此模式下sender节点会发送写请求到主节点，主节点厚道请求后，会发送写指令到sender节点

```xml
    <bean class="org.apache.ignite.configuration.IgniteConfiguration">
    ...
    <property name="cacheConfiguration">
        <bean class="org.apache.ignite.configuration.CacheConfiguration">
            <!-- Set a cache name. -->
            <property name="name" value="cacheName"/>
            
            <!-- Atomic write order mode. -->
            <property name="atomicWriteOrderMode" value="PRIMARY"/>
            ... 
        </bean
    </property>
    </bean>
```