#!/bin/bash

base_path=/home/cx4gxf/ShellProjects
date_path=`date +%Y-%m-%d`

src_host=127.0.0.1
src_port=3306
src_user=root
src_pwd=123456
src_db=nbcb_panel

des_host=127.0.0.1
des_port=3306
des_user=root
des_pwd=123456
des_db=test

cur_datetime=`date +%Y-%m-%d' '%H:%M:%S`					# 当前日期时间戳
pre_datetime=`date +%Y-%m-%d' '%H:%M:%S --date="-1 day"`	# 当前日期前一天时间戳

tables=("d_i_input_param" "d_i_schema" "data_interface" "decision_flow" "decision_flow_edge" "decision_flow_feature_input" \
	"decision_flow_input" "decision_flow_node" "decision_object" "feature" "feature_input_param" "feature_schema" "file" \
	"ids" "m_l_iterable" "m_l_iteration_setting" "m_l_monitor_setting" "ml_model" "ml_model_input_param" "ml_model_output" \ 
	"rule" "service" "service_branch" "sql_session" "user")

cd ${base_path}
mkdir ${date_path}

for table in ${tables[@]}
do
	echo "------------ dump table ${table} start, pre_datetime: ${pre_datetime}, cur_datetime: ${cur_datetime} ------------- "
	# mysqldump -h127.0.0.1 -P3306 -uroot -p123456 nbcb_panel ${table} --no-create-info |mysql --host=127.0.0.1 -uroot -p123456 test
	
	mysqldump -h${src_host} -P${src_port} -u${src_user} -p${src_pwd} --insert-ignore --no-create-info ${src_db} ${table} > ${base_path}/${date_path}/${table}.sql
	mysql -h${des_host} -P${des_port} -u${des_user} -p${des_pwd} ${des_db} < ${base_path}/${date_path}/${table}.sql
	echo "------------ dump table ${table} end, return $? --------------"
done

echo "------------ dump table request_response start, pre_datetime: ${pre_datetime}, cur_datetime: ${cur_datetime} ------------- "
#mysqldump -h127.0.0.1 -P3306 -uroot -p123456 -C xai_report request_response \
#	-w"create_ts BETWEEN '$pre_datetime' AND '$cur_datetime'" --no-create-info |mysql --host=127.0.0.1 -uroot -p123456 test;

mysqldump -h${src_host} -P${src_port} -u${src_user} -p${src_pwd} --insert-ignore --no-create-info -w"create_ts BETWEEN '$pre_datetime' AND '$cur_datetime'" \
	 xai_report request_response > ${base_path}/${date_path}/request_response.sql
mysql -h${des_host} -P${des_port} -u${des_user} -p${des_pwd} ${des_db} < ${base_path}/${date_path}/request_response.sql
echo "------------ dump table request_response end, return $? --------------"

echo "------------ dump table model_detail start, pre_datetime: ${pre_datetime}, cur_datetime: ${cur_datetime} ------------- "
#mysqldump -h127.0.0.1 -P3306 -uroot -p123456 -C xai_report model_detail \
#	-w"create_ts BETWEEN '$pre_datetime' AND '$cur_datetime'" --no-create-info |mysql --host=127.0.0.1 -uroot -p123456 test;

mysqldump -h${src_host} -P${src_port} -u${src_user} -p${src_pwd} --insert-ignore --no-create-info -w"create_ts BETWEEN '$pre_datetime' AND '$cur_datetime'" \
	 xai_report model_detail > ${base_path}/${date_path}/model_detail.sql
mysql -h${des_host} -P${des_port} -u${des_user} -p${des_pwd} ${des_db} < ${base_path}/${date_path}/model_detail.sql
echo "------------ dump table model_detail end, return $? --------------"
