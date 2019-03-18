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

cd background_source_code/ai_kang_shui_dian

cp  -r /root/shell_related/shifuhelp/pom.xml   ./
cp  -r /root/shell_related/shifuhelp/application.yml ./src/main/resources/

source /etc/profile

mvn clean 

mvn install 

echo  "开始编译师傅上门后台Java代码！mvn install"

ifExecuteSuccess $?

tar_dir=$(pwd)"/target"

echo  "恭喜你，编译成功！！！目标文件在:${tar_dir}"

remoteip="180.167.47.14"

rsync  -rvz  ${tar_dir}/ai_kang_shui_dian.jar ${remoteip}:/data/jar

echo   "文件已同步到远程服务器${remoteip}:/data/jar下"

remote_cmd="/home/remote_shifuhelp.sh"

ssh -t root@${remoteip}  ${remote_cmd}

if [ $?  -eq 0 ]
then
	echo "执行远程脚本成功！docker restart akan_test"
else
	echo "执行远程脚本失败，请查找原因."
fi

echo "恭喜你，师傅上门测试服后台Java部署完毕!"