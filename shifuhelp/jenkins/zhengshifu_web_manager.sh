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

cd web_management

sed  -i 's/akan.qubaotang.cn:81/crmjob.akan.com.cn:82/' ./src/config/env.js

source /etc/profile

npm install
ifExecuteSuccess $?
echo "node modules下载完毕！"

sleep 1s

echo  "开始编译后台管理代码！"

npm run build

ifExecuteSuccess $?

tar_dir=$(pwd)"/dist"

echo  "恭喜你，编译成功！！！目标文件在:${tar_dir}"

remoteip="180.167.47.14"
#--delete
rsync --delete -rvz  ${tar_dir}/akan  ${remoteip}:/home/alex/web
rsync  -rvz  ${tar_dir}/akan.html  ${remoteip}:/home/alex/web
ifExecuteSuccess $?

echo   "文件已同步到远程服务器${remoteip}:/home/alex/web下"

remote_cmd="/home/alex/202_web.sh"

ssh -t root@${remoteip}  ${remote_cmd}

if [ $?  -eq 0 ]
then
	echo "执行远程脚本成功！"
else
	echo "执行远程脚本失败，请查找原因."
fi







