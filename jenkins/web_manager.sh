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

git_repo_name="shifuhelp_repo"

if [ -d ${git_repo_name} ]
then
	echo "source code exist"
else
	git clone git@192.168.0.122:/home/git/shifuhelp_repo.git  -b aikan_ims
	echo "git仓库路径:git@192.168.0.122:/home/git/${git_repo_name}.git"
	echo "代码已从服务器下载完毕!"
fi

ifExecuteSuccess $?

cd ${git_repo_name}/

git reset --hard HEAD
#git clean -fd
git pull --rebase

echo "代码已同步到服务器最新版本！"

cd web_management

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
rsync  -rvz  ${tar_dir}/akan/*  ${remoteip}:/data/static/akan_management/akan
rsync  -rvz  ${tar_dir}/akan.html  ${remoteip}:/data/static/akan_management/
ifExecuteSuccess $?


echo   "文件已同步到远程服务器${remoteip}:/data/static/akan_management/下"

remote_cmd="/home/remote.sh"

#ssh -t root@${remoteip}  ${remote_cmd}

#if [ $?  -eq 0 ]
#then
#	echo "执行远程脚本成功！"
#else
#	echo "执行远程脚本失败，请查找原因."
#fi







