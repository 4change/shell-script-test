#!/bin/bash

apt-get autoclean
apt-get clean
apt-get autoremove
echo '---------------------------------------- 系统软件缓存清理完毕...'

# 查找 ~/.cache 目录中日期大于365天的文件，直接删除之
find /home/root/.cache/ -type f -atime +365 -delete
find /home/fly/.cache/ -type f -atime +365 -delete
echo '---------------------------------------- ~/.cache 目录清理完毕...'

# 清理日志
journalctl --vacuum-size=10M
echo '---------------------------------------- 日志清理完毕...'

# 清楚系统日志
echo > /var/log/syslog			# 清除系统 syslog
echo > /var/log/kern.log		# 清除内核日志
echo '---------------------------------------- 系统日志清理完毕...'

# 清除 deb 包卸载的残留文件
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P 
echo '---------------------------------------- deb 包卸载残留文件清理完毕...'

# 清空回收站
cd /root/.local/share/Trash && sudo rm -rf *
cd /home/fly/.local/share/Trash && sudo rm -rf *
echo '---------------------------------------- 回收站清理完毕...'