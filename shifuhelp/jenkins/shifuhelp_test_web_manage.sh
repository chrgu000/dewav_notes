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

cd background_source_code/ai_kang_shui_dian_manager

sed  -i 's/wx.shifuhelp.com/aksd.qubaotang.cn:81/' ./src/common.js
sed  -i 's/https/http/' ./src/common.js
source /etc/profile

npm install

ifExecuteSuccess $?
echo "node modules下载完毕！"

sleep 1s

echo  "开始编译师傅上门后台管理代码！"

npm run build

ifExecuteSuccess $?

tar_dir=$(pwd)"/dist"

echo  "恭喜你，编译成功！！！目标文件在:${tar_dir}"

remoteip="180.167.47.14"
#--delete
rsync --delete -rvz  ${tar_dir}/manager/*  ${remoteip}:/data/static/ai_kang_shui_dian/manager
rsync  -rvz  ${tar_dir}/manager_index.html ${remoteip}:/data/static/ai_kang_shui_dian

ifExecuteSuccess $?

echo   "文件已同步到远程服务器${remoteip}:/data/static/ai_kang_shui_dian下"

echo "恭喜你，后台管理部署成功"
#remote_cmd="/home/alex/202_web.sh"

#ssh -t root@${remoteip}  ${remote_cmd}









