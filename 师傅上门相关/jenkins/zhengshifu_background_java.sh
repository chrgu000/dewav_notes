#!/bin/bash

ifExecuteSuccess () {

	if [ $1  -eq 0 ]
	then
	    echo "执行成功!"
	else
	    echo  "执行失败!"
	    exit 1
	fi
}


cd background_sourcecode/akan_management

#cp  /root/shell_related/application.yml    ./src/main/resources/

#sed -i 's/jump.akan.com.cn/172.17.0.1/g' ./src/main/resources/application.yml

#sed  -i 's/database: 2/database: 3/' ./src/main/resources/application.yml

#sed  -i 's/akanjob.qubaotang.cn:81/crmjob.akan.com.cn:82/' ./src/main/resources/application.yml

source /etc/profile

mvn clean

mvn install


echo  "开始编译后台Java代码！mvn install"
ifExecuteSuccess $?



sleep 1s



tar_dir=$(pwd)"/target"

echo  "恭喜你，编译成功！！！目标文件在:${tar_dir}"

remoteip="180.167.47.14"
#--delete

#rsync  -rvz  ${tar_dir}/akan_management.war ${remoteip}:/data/docker/tomcat/akan_test

rsync  -rvz  ${tar_dir}/akan_management.jar ${remoteip}:/home/alex
ifExecuteSuccess $?


echo   "文件已同步到202服务器${remoteip}:/home/alex下"

remote_cmd="/home/alex/202_cmd.sh"

ssh -t root@${remoteip}  ${remote_cmd}


if [ $?  -eq 0 ]
then
	echo "执行202远程脚本成功！"
else
	echo "执行202远程脚本失败，请查找原因."
fi







