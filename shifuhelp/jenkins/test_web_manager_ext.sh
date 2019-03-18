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

cp /root/shell_related/env.js  ./src/config

source /etc/profile

if  [ -d "node_modules" ]
then
    echo "node_modules exist!"
	npm install
	ifExecuteSuccess $?
	echo "node modules更新完毕！"
else
    npm install
    ifExecuteSuccess $?
    echo "node modules下载完毕！"
fi

sleep 1s

echo  "开始编译后台管理代码！"

npm run build

ifExecuteSuccess $?

tar_dir=$(pwd)"/dist"

echo  "恭喜你，编译成功！！！目标文件在:${tar_dir}"

remoteip="180.167.47.14"
#--delete
rsync --delete  -rvz  ${tar_dir}/akan/*  ${remoteip}:/data/static/akan_test/akan
rsync  -rvz  ${tar_dir}/akan.html  ${remoteip}:/data/static/akan_test/
ifExecuteSuccess $?


echo   "文件已同步到远程服务器${remoteip}:/data/static/akan_test/下"

remote_cmd="/home/remote_test.sh"

#ssh -t root@${remoteip}  ${remote_cmd}

#if [ $?  -eq 0 ]
#then
#	echo "执行远程脚本成功！"
#else
#	echo "执行远程脚本失败，请查找原因."
#fi







