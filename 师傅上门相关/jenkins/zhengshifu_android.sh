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


cd android_sourcecode/

source /etc/profile

sed  -i   's/akan.qubaotang.cn:81/crm.akan.com.cn:82/g'  ./app/src/main/java/com/akan/qf/Constants.java

echo "域名修改为crm.akan.com.cn:82"

echo "当前用户是：$(whoami)"

gradle clean

gradle assembleRelease
#gradle build

ifExecuteSuccess $?

rsync   app/build/outputs/apk/app-release.apk   /root/shell_related/

ifExecuteSuccess $?

echo  "app-release.apk已同步到/root/shell_related/下,已成功生成最新Apk!"
