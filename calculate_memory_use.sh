#!/bin/bash

# Program:
#	写一个脚本计算一下Linux系统所有进程占用内存大小的和。

count=0

# 请先熟悉ps命令及awk命令的常见用法
# 	ps aux——查询进程运行信息，第６个参数RSS表示进程占用的内存大小
# 	awk '{print $6}'——取前面输出内存的第六个参数，该参数即为进程占用的内存大小
# 	grep -v 'RSS'——过滤掉'RSS'字符串
for i in `ps aux |awk '{print $6}' |grep -v 'RSS'`

# awk一条命令计算内存使用大小
# ps aux |grep -v 'RSS TTY' |awk '{sum=sum+$6};END{print sum}'`

do
		count=$[$count+$i]
done

echo "ROM use: $count/kb"