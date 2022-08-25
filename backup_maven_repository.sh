#!/bin/bash
# Program
#		系统备份：每周五定时备份maven库，并自动到指定目录

# TODO
# Maven 仓库的备份
# Library 目录的数据同步及更新

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

now=$(date +%Y%m%d)

if cp -r /home/cx4gxf/.m2/repository /home/cx4gxf/Documents; then
		echo "copy finished..."

		if tar czvf repMaven.tar.gz-${now} repository/; then
				echo "file compression finished..."
		else
				echo "file compresseion failed..."
		fi
else
		echo "`basename $0`: copy failed, please check your program..."
fi
