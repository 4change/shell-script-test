#!/bin/bash

var="http://www.aaa.com/root/123.htm"
#1. 以 "//" 为分隔符，分割 var 所代表的字符串，并输出第 2 个字符串
echo $var |awk -F '//' '{print $2}'
#2. 以　"/" 为分隔符，分割 var 所代表的字符串，并输出第 5 个字符串
echo $var |awk -F '/' '{print $5}'
#3. 过滤输出 var 变量中匹配正则表达式 "http.*root"　的内容，其中"."匹配除"\n"外的任意字符，"*"表示匹配0-n次
echo $var |grep -o 'http.*root'
#4. 以 "/" 为分隔符，分割 var 所代表的字符串，并输出第 1 个字符串
echo $var |awk -F '/' '{print $1}'
#5. 过滤输出 var 变量中匹配正则表达式 "http://" 的内容
echo $var |grep -o 'http://'
#6. 过滤输出 var 变量中匹配正则表达式 "www.*htm" 的内容，其中"."匹配除"\n"外的任意字符，"*"表示匹配0-n次
echo $var |grep -o 'www.*htm'
#7. 过滤输出 var 变量中匹配正则表达式 "123" 的内容
echo $var |grep -o '123'
#8. 过滤输出 var 变量中匹配正则表达式 "123.htm" 的内容
echo $var |grep -o '123.htm'