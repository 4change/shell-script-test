#!/bin/bash

mailAddress=2289200570@qq.com
mailTitle="笔记本系统监控"
tmpFile=/tmp/message.txt
avail=`free -m | grep Mem | awk -F ' ' '{print $7}'`
message="笔记本可用内存为(M)："
memLimit=2000

if [ ${avail} -lt ${memLimit} ]; then
	echo ${message}${avail} > ${tmpFile}
	mail -s ${mailTitle} ${mailAddress} < ${tmpFile} 
fi

