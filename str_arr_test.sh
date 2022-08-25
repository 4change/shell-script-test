#!/bin/bash

arr=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "a" "b" "c" "e" "e" "f")

for value in ${arr[@]}
do
	echo $value
done
echo "----------------------another way----------------------"

for value in $(mysql -uroot -p123456 -e"use nbcb_panel; show tables;")
do
	echo $value
done
