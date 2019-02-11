#!/bin/bash

#=======================判断服务器是否在编译版本中===================#
#while true
#do
#        makenum=`ps -e | grep -c make`
#        echo $makenum
#        if [ $makenum -ge 4 ]
#        then
#                echo "版本编译自动排队中，请稍候，系统会每隔2分钟检查一次。"
#                sleep 120
#        else break;
#        fi
#done

echo "开始编译你的版本了! 服务器时间:"  `date`

#=======================Start clean env for compile===================#
# git reset --hard HEAD
# git clean -fd >>clean.log
# git reset --hard HEAD

#=======================End clean env for compile===================#

customerInternalVersion=$1
customerExternalVersion=$2
#lastCustomerInternalVersionTags=$3
isuserOrEngOTA=$3
#customerInternalVersionTags="${customerInternalVersion}-R"



help() {
echo "Can i help you......."
echo "
      内部版本号CUSTOMER_INTERNAL_VERSION 命名规则: 
          CUSTOMER_INTERNAL_VERSION:公司项目代号_客户代号_客户的项目代号_版本类型及版本数，GB_DW表示公司项目的公版项目
      
      外部版本号CUSTOMER_VERSION          命名规则:
          CUSTOMER_VERSION 公司项目代号_客户的项目代号_版本类型及版本数"
echo  Usage:
echo ./scm.sh CUSTOMER_INTERNAL_VERSION CUSTOMER_VERSION  [UserOrEng]
echo Example:
echo "./scm.sh C1268_GB_DW_C100  C1268_DW_C100    Eng   /* Use Eng mode */"
echo "./scm.sh C1268_GB_DW_C100  C1268_DW_C100    User  /* Use User mode */"
echo "./scm.sh C1268_GB_DW_C100  C1268_DW_C100          /* Use the default User mode */"
echo "\n"
}



if [ "" == $1 ] || [ "-h" == $1 ] || [ "help" == $1 ] || [ "-help" == $1 ] ||[ "--help" == $1 ] ;then
    help 
    exit
fi


echo "   "
echo "   "
echo "   "
echo "   "
echo "输入项 内部版本号 是：  ${customerInternalVersion}"

echo "   "
echo "输入项 外部版本号 是：  ${customerExternalVersion}"

userOrEng=`echo ${isuserOrEngOTA}|cut -d '-' -f 1`
isOTA=`echo ${isuserOrEngOTA}|cut -d '-' -f 2`


case ${userOrEng} in
    "User")
        userOrEng="-o=TARGET_BUILD_VARIANT=user"
        echo "   "
        echo "输入项 编译模式User Or Eng 是：  -o=TARGET_BUILD_VARIANT=user"
        ;;
    "")
        userOrEng="-o=TARGET_BUILD_VARIANT=user"
        echo "   "
        echo "输入项 编译模式User Or Eng 是：  -o=TARGET_BUILD_VARIANT=user"
        ;;
    "UserDebug")
        userOrEng="-o=TARGET_BUILD_VARIANT=userdebug"
        echo "   "

        echo "输入项 编译模式User Or Eng 是：  Eng, 非 -o=TARGET_BUILD_VARIANT=user"
        ;;
    "Userdebug")
        userOrEng="-o=TARGET_BUILD_VARIANT=userdebug"
        echo "   "

        echo "输入项 编译模式User Or Eng 是：  Eng, 非 -o=TARGET_BUILD_VARIANT=user"
        ;;
    "Eng")
        userOrEng=""
        echo "   "

        echo "输入项 编译模式User Or Eng 是：  Eng, 非 -o=TARGET_BUILD_VARIANT=user"
        ;;

     *)
       echo "   "
       echo "Error：UserOrEng参数为编译模式,默认为空或指定为User时使用User模式编译，指定为Eng时使用Eng模式编译。）"
       help
       exit 2
       ;;
esac


echo "   "
echo "   "
echo "   "
echo "   "


#file exist or not

fileExist () {
  if [ -f $1 ]
    then
        echo "file $1 exist!!!"
    else
        echo "file $1 not exist!!!" 
        exit 2   
  fi

}

scmFile="scm/scm.mk"
fileExist ${scmFile}


#修改版本号 $1是读写版本号文件:scm.mk
#         $2是版本号的字段名称：CUSTOMER_INTERNAL_VERSION 或者 CUSTOMER_VERSION
#         $3是内部 或者 外部的 版本号，例如：C1268_GB_DW_C100  C1268_DW_C100
modifiyVerNum(){ 
  sed -i "/^$2/c $2=$3" $1
}

setVersion(){

    str=${3//[^_]}
    interVerNum_=${#str}
#    interVerNum_= `echo $3 | awk -F'_' '{print NF-1}'`
    echo "是否是 版本号 _ 个数：${interVerNum_}   1:$1   2:$2 3:$3"
    case ${interVerNum_} in
    4)
        modifiyVerNum $1 $2 $3
        ;;
    3)
        modifiyVerNum $1 $2 $3
        ;;
    2)
        modifiyVerNum $1 $2 $3
        ;;
    *)
        echo "$3: error named $2"
        help
        exit 2
        ;;
    esac
}



#Set CUSTOMER_INTERNAL_VERSION
setVersion ${scmFile} "CUSTOM_INTERNAL_VERSION" ${customerInternalVersion}
setVersion ${scmFile} "MTK_BUILD_VERNO" ${customerInternalVersion}
#setVersion ${scmFile} "CUSTOM_VERSION" $customerExternalVersion
modifiyVerNum ${scmFile} "CUSTOM_VERSION" ${customerExternalVersion}




# get CUSTOMER_INTERNAL_VERSION from scm.mk
customerInternalVersion=`cat ${scmFile} | awk -F'CUSTOM_INTERNAL_VERSION' '{print $2}'|sed '/^$/d'|tr '' '\o'| sed 's/ //g'|sed 's/=//g'`

#customerTargetProduct=`cat ${scmFile} |  awk -F'CUSTOM_TARGET_PRODUCT' '{print $2}'|sed '/^$/d'|tr '' '\o'| sed 's/ //g'|sed 's/=//g'`

projectName=`echo "${customerInternalVersion}" |cut -d '_' -f 1`

projectDirName=`echo "${projectName}"|sed "s/-/_/g"|tr A-Z a-z`


#echo ${projectDirName}"==?=="${projectDirName}

customerName=`echo "${customerInternalVersion}" |cut -d '_' -f 2`

customerProjectName=`echo "${customerInternalVersion}" |cut -d '_' -f 3`
#echo "customerInternalVersion:" ${customerInternalVersion}
#echo "customerProjectName:" ${customerProjectName}

version=`echo "${customerInternalVersion}" |cut -d '_' -f 4`

saiMa=`echo "${customerInternalVersion}" |cut -d '_' -f 5`
#echo "saima----:${saiMa}"
#case ${saiMa} in
 #     "")
       #echo "test no 5"
  #      projectCustomerProjectName="${projectName}_${customerProjectName}"
  #    ;;
  #   S)
  #      echo "ok"  
  #      projectCustomerProjectName="${projectName}_${customerProjectName}_${saiMa}"
  #         ;;
#esac


versionType=`expr substr "${version}" 1 1`

versionNum=`echo "${version}"| sed 's/[A-Z -]//g'`

#projectCustomerProjectName="${projectName}_${customerProjectName}${saiMa}"
projectCustomerProjectName="${projectName}_${customerProjectName}"

projectCustomerCtmPrjName="${projectName}_${customerName}_${customerProjectName}"

projectCustomerProjectBuildType="${projectName}_${customerProjectName}_${versionType}"


projectCustomerProjectMkfile="scm/${projectCustomerProjectName}/${projectCustomerProjectName}.mk"
projectCustomerProjectBuildTypeMkfile="scm/${projectCustomerProjectName}/${projectCustomerProjectBuildType}.mk"

projectDirMkfile="device/dewav/${projectDirName}/ProjectConfig.mk"
    
fileExist ${projectCustomerProjectMkfile} 
fileExist ${projectCustomerProjectBuildTypeMkfile}
fileExist ${projectDirMkfile}

#tmp file for mkfile
tmpMkfile=tmp.mk

#
cat ${projectCustomerProjectMkfile} ${projectCustomerProjectBuildTypeMkfile} ${scmFile} > ${tmpMkfile}
#xxw
customerProject="${customerName}_${customerProjectName}" 
unstableFile="scm/${projectCustomerProjectName}/unstable.mk"
if [[ "$customerProject" = "GB_DW" || "$customerProject" = "GB-N_DW" ]];
	then
		if [ -f "${unstableFile}" ]
			then
        		echo "${unstableFile} Exist!!!"
			cat ${unstableFile} >> ${tmpMkfile}
		fi
fi	

# del duplicate macro 
#awk '!a[$1]++' ${tmpMkfile} >tmpf.mk
#awk -F'=' '!a[$1]++' tmpf.mk >tmpf1.mk

cp -r ${tmpMkfile} ${projectDirMkfile}

rm -rf ${tmpMkfile}
#rm -rf tmpf1.mk tmpf.mk

#Segon add begin: 将拷贝source目录提前到这里
target_product=`sed -n '/CUSTOM_TARGET_PRODUCT/h;${x;p}' ${projectCustomerProjectMkfile} | awk -F'CUSTOM_TARGET_PRODUCT' '{print $2}'|sed 's/ //g'|sed 's/=//g'`
sourcepath="vendor/dewav/proprietary/${target_product}/source"

#  dw segon: 检查代码冲突 @{
./check-clash.sh ${sourcepath}
if [ $? -ne 0 ] ; then
    exit 3
fi
#  @}

if [ -d "${sourcepath}" ]
    then
        echo "${sourcepath} Exist!!!"
        cp -r ./${sourcepath}/* ./
    else
        echo "${sourcepath} Not Not Not Exist!!!"
        exit 2
fi
#Segon add end

#=======================Start Check lastCustomerInternalVersionTags exist ===================#
#=======================End Check lastCustomerInternalVersionTags exist ===================#

mv .git git
#=======================Start build===================#

echo "   "
echo "   "
echo "   "
echo "   "
echo "Start Building....................................."
buildLogFile="build-ci.log"
cpuNum=`grep -c 'model name' /proc/cpuinfo`
#buildFailStr='                    ==> \[FAIL\]  201'
#根据版本类型 选择是 -o=TARGET_BUILD_VARIANT=user ,现阶段 T(贴片) 、L（量产）、使用user  模式
# 版本类型： T(贴片) 、L（量产）、R（入网）、C（公版测试）（客户试产测试）、S（公版前端生产）、Z（客户招商）、Z（前期增量版本）
echo "userOrEng=${userOrEng}"
echo "   "
if [ "-o=TARGET_BUILD_VARIANT=user" == "${userOrEng}" ] ;then
    echo "make 使用: -o=TARGET_BUILD_VARIANT=user"
    echo "mk  Compiling ..................................."
    echo "若需查看make过程日志log，请查看工程目录中 ./build-ci.log"
    #echo "   ./mk ${userOrEng} ${projectDirName}  new >${buildLogFile} "
	source  build/envsetup.sh 
	lunch full_${projectDirName}-user
	echo "lunch full_${projectDirName}-user"
	make -j${cpuNum} 2>&1 | tee >>${buildLogFile}
     #./mk ${userOrEng} ${projectDirName}  new | tee ${buildLogFile} 

 elif [ "-o=TARGET_BUILD_VARIANT=userdebug" == "${userOrEng}" ] ;then
    echo "make 使用: -o=TARGET_BUILD_VARIANT=userdebug"
    echo "mk  Compiling ..................................."
    echo "若需查看make过程日志log，请查看工程目录中 ./build-ci.log"
    #echo "   ./mk ${userOrEng} ${projectDirName}  new >${buildLogFile} "
	source  build/envsetup.sh 
	lunch full_${projectDirName}-userdebug
	echo "lunch full_${projectDirName}-userdebug"
	make -j${cpuNum} 2>&1 | tee >>${buildLogFile}

  else
    echo "make 使用: 非 -o=TARGET_BUILD_VARIANT=user"
    echo "mk  Compiling ..................................."
    echo "若需查看make过程日志log，请查看工程目录中 ./build-ci.log"
    echo "    ./mk ${projectDirName} new >${buildLogFile}"
	source  build/envsetup.sh 
	lunch full_${projectDirName}-eng
	echo "lunch full_${projectDirName}-eng"
	make -j${cpuNum} 2>&1 | tee >>${buildLogFile}

     #./mk ${projectDirName} new >${buildLogFile}

fi
if [ "${isOTA}" == "OTA" ];then
  echo "The versionType is L,Build OTA..."
	make -j${cpuNum} otapackage >>${buildLogFile}
fi

echo "   "
echo "   "
echo "   "
echo "   "
#=======================End build===================#


#=======================Start Check build status to get changes log===================#
# lastCustomerInternalVersionTags
#将./ mk 编译日志log 输出到buid-ci.log,判断该log文件中十分存在失败log（＊.log_err）,如有拷贝到${customerExternalVersion}，并退出版本编译过程
#   out/target/product/taishengchang_update-api.log_err
if [ -d ${customerExternalVersion} ];then
    rm -rf ${customerExternalVersion}
    mkdir -p ${customerExternalVersion}
    else
    mkdir -p ${customerExternalVersion}    
fi

mv git .git


if [ "`cat ${buildLogFile}|grep -c "#### make completed successfully"`" == 0 ];then

#if  [[ grep "\.log\_err" ${buildLogFile} ]] || [[ grep "\[FAIL\]" ${buildLogFile} ]]; then
##                    ==> [FAIL]  2012/05/21 15:32:05
#if grep "\[FAIL]\ \ 201" ${buildLogFile}; then
# ${lastCustomerInternalVersionTags}
##  make[1]: *** [android] 错误 1
#if grep "^make\[1\]\:\ \*\*\*\ " ${buildLogFile}; then
#if [ ${RESULT} == "" ]; then

    echo " "
    echo " "
    echo "编译出错的模块： `grep "\.log\_err" ${buildLogFile}`"
    echo "JDK error:`grep "\[\jdk\]\:\ \[FAIL\]" ${buildLogFile}`  "
    echo "==================================="
    echo "编译出错！！！！！！！！！！！！！！！！！！"
    echo "myGod!------------------------myGod!"
    
    cp `grep "\.log\_err" ${buildLogFile}` "${customerExternalVersion}"

#所有修改记录
    echo "这次编译版本和最近的25次的提交 之间所有提交信息log，如下："  >${customerExternalVersion}/${customerExternalVersion}-changes.log
    echo "ChangeID	提交信息	测试建议	公共问题	关联模块	提交人	提交时间	简短SHA1	" >>${customerExternalVersion}/${customerExternalVersion}-changes.log

   ` git log --date=local --pretty=format:" %s  提交人：%an  提交时间:%ad 简短SHA1：%h " -25 |grep -v  "Merge\ branch\ " >>${customerExternalVersion}/${customerExternalVersion}-changes.log`

#所有修改文件记录
    echo "这次编译版本和最近的25次的提交 之间 所有修改记录和修改文件记录如下："  >${customerExternalVersion}/${customerExternalVersion}-changes-files.log
echo "ChangeID	提交信息	测试建议	公共问题	关联模块	提交人	提交时间	简短SHA1	" >>${customerExternalVersion}/${customerExternalVersion}-changes-files.log

   ` git log --date=local --pretty=format:" %s  提交人：%an  提交时间:%ad 简短SHA1：%h " --name-status  -25 |grep -v  "Merge\ branch\ " >>${customerExternalVersion}/${customerExternalVersion}-changes-files.log`

    cat ${customerExternalVersion}/${customerExternalVersion}-changes-files.log

    cp -f ${customerExternalVersion}/${customerExternalVersion}-changes.log  changes.log
    cp -f ${customerExternalVersion}/${customerExternalVersion}-changes-files.log  changes-files.log


#转换changes-log to excel 表格
    echo " "
    echo " "
   ./logToExcel.sh ${customerExternalVersion}/${customerExternalVersion}-changes.log
   ./logToExcel.sh  ${customerExternalVersion}/${customerExternalVersion}-changes-files.log


    echo " "
    echo " "
    echo "                                 fk"
    echo "==================================="
    echo " "
    echo " "
    exit 2

else

    echo " "
    echo " "
    echo "==================================="
    echo "编译ok！！！！！！！！！！！！！！！！！！！"
    echo "VeryGood!------------------VeryGood!"
#    echo "生成 & push tag---customerInternalVersionTags：${customerInternalVersionTags}" 


#    git tag -f "${customerInternalVersionTags}"
#    git push origin -f ${customerInternalVersionTags}:${customerInternalVersionTags}



#所有修改记录
    echo "这次编译版本和最近的25次的提交 之间所有提交信息log，如下："  >${customerExternalVersion}/${customerExternalVersion}-changes.log
    echo "ChangeID	提交信息	测试建议	公共问题	关联模块	提交人	提交时间	简短SHA1	" >>${customerExternalVersion}/${customerExternalVersion}-changes.log

   ` git log --date=local --pretty=format:" %s  提交人：%an  提交时间:%ad 简短SHA1：%h " -25 |grep -v  "Merge\ branch\ " >>${customerExternalVersion}/${customerExternalVersion}-changes.log`

#所有修改文件记录
    echo "这次编译版本和最近的25次的提交 之间 所有修改记录和修改文件记录如下："  >${customerExternalVersion}/${customerExternalVersion}-changes-files.log
    echo "ChangeID	提交信息	测试建议	公共问题	关联模块	提交人	提交时间	简短SHA1	" >>${customerExternalVersion}/${customerExternalVersion}-changes-files.log

   ` git log --date=local --pretty=format:" %s  提交人：%an  提交时间:%ad 简短SHA1：%h " --name-status  -25 |grep -v  "Merge\ branch\ " >>${customerExternalVersion}/${customerExternalVersion}-changes-files.log`

    cat ${customerExternalVersion}/${customerExternalVersion}-changes.log
    cp -f ${customerExternalVersion}/${customerExternalVersion}-changes.log  changes.log
    cp -f ${customerExternalVersion}/${customerExternalVersion}-changes-files.log  changes-files.log



#转换changes-log to excel 表格
    echo " "
    echo " "
   ./logToExcel.sh ${customerExternalVersion}/${customerExternalVersion}-changes.log
   ./logToExcel.sh  ${customerExternalVersion}/${customerExternalVersion}-changes-files.log



    echo " "
    echo " "
    echo "                                 ok"
    echo "==================================="
    echo " "
    echo " "
fi
#=======================End Check build status to get changes log===================#


#转换changes-log to excel 表格
#./logToExcel.sh ${customerExternalVersion}/${customerExternalVersion}-changes.log

#./logToExcel.sh  ${customerExternalVersion}/${customerExternalVersion}-changes-files.log



echo "projectCustomerCtmPrjName ${projectCustomerCtmPrjName}"
echo "版本编译完成后版本拷贝cp Checksum zip.................................."
#版本编译后拷贝

if [ "${isOTA}" == "OTA" ];then
  echo "Copy OTA File..."
  cp -v out/target/product/${projectDirName}/*.zip ${customerExternalVersion}/
  cp -v out/target/product/${projectDirName}/obj/PACKAGING/target_files_intermediates/*.zip ${customerExternalVersion}/
fi

./cpbin.sh "${projectDirName}" "${customerExternalVersion}/Release"

./cpaudio.sh "${projectDirName}" "${customerExternalVersion}/${projectDirName}_audio"
zip ${customerExternalVersion}/${projectDirName}_audio.zip ${customerExternalVersion}/${projectDirName}_audio -q -r

./cptouchpanel.sh "${projectDirName}" "${customerExternalVersion}/${projectDirName}_ltc/touchpanel"
./cplcm.sh "${projectDirName}" "${customerExternalVersion}/${projectDirName}_ltc/lcm"
./cpimgsensor.sh "${projectDirName}" "${customerExternalVersion}/${projectDirName}_ltc/imgsensor"
mv ${customerExternalVersion}/${projectDirName}_ltc/imgsensor/camera/  ${customerExternalVersion}/${projectDirName}_ltc/
zip ${customerExternalVersion}/${projectDirName}_ltc.zip ${customerExternalVersion}/${projectDirName}_ltc -q -r

./cppartion.sh "${projectDirName}" "${customerExternalVersion}/${projectDirName}_partion"
zip ${customerExternalVersion}/${projectDirName}_partion.zip ${customerExternalVersion}/${projectDirName}_partion  -q -r
./cpflash.sh "${projectDirName}" "${customerExternalVersion}/${projectDirName}_fba/flash"
./cpbattery.sh "${projectDirName}" "${customerExternalVersion}/${projectDirName}_fba/battery"
./cpagingaudio.sh "${customerExternalVersion}/${projectDirName}_fba/agingaudio"
zip ${customerExternalVersion}/${projectDirName}_fba.zip ${customerExternalVersion}/${projectDirName}_fba -q -r

# copy fat.img and modify *_Android_scatter.txt @{
fatDir=`cat ${projectDirMkfile} | awk -F'CUSTOM_TARGET_PRODUCT' '{print $2}'|sed '/^$/d'|tr '' '\o'| sed 's/ //g'|sed 's/=//g'`
set_make_fat(){
    customBlockCount=`grep $@ |tail -1|sed 's/ //'|awk -F= '{print $2}'`
    echo "customBlocksCount is $customBlockCount"
    if [ -n "$customBlockCount" ]; then
        . make_fat.sh $customBlockCount
        sed -i '/partition_name: FAT/{:n;N;/type: NONE/!bn};s/\n.*\n/\n  file_name: NONE\n  is_download: true\n/'  ${customerExternalVersion}/Release/*_Android_scatter.txt
    fi
}

# 取消每次版本编译时制作fat.img,由软件人员直接提交fat.img到 scm/${projectCustomerProjectName}/ 目录下
#set_make_fat CUSTOM_BLOCK_COUNT  ${projectCustomerProjectMkfile}
if [ -f "vendor/${fatDir}/fat.img" ]
    then
        echo "File fat.img Exist!!!"
        cp -rf vendor/${fatDir}/fat.img ${customerExternalVersion}/Release/
        sed -i '/partition_name: FAT/{:n;N;/type: NONE/!bn};s/\n.*\n/\n  file_name: NONE\n  is_download: true\n/'  ${customerExternalVersion}/Release/*_Android_scatter.txt
    else
        echo "File fat.img Not Not Not Exist!!!"
fi
#cp -rf fat.img ${customerExternalVersion}/Release/
# @}

echo "版本编译完成后版本  Checksum.................................."
cp -r scm/CheckSum/* ${customerExternalVersion}/Release/
cd ${customerExternalVersion}/Release/
./CheckSum_Gen -s *Android_scatter.txt  > ../../checksum.log
rm -rf Log/
rm CheckSum_Gen
rm libflashtool*.so
cd ../../
echo "版本编译完成后版本  Checksum...ok..............................."

echo "版本编译完成后版本 zip.................................."
echo "............ ziping  ........."
zip ${customerExternalVersion}/${customerExternalVersion}.zip ${customerExternalVersion}/Release -j -q -r
echo "ziped Ok ........."
echo "${customerExternalVersion}/${customerExternalVersion}.zip"


#转换changes-log to excel 表格
#./logToExcel.sh  ${customerExternalVersion}/${customerExternalVersion}-changes.log

#./logToExcel.sh  ${customerExternalVersion}/${customerExternalVersion}-changes-files.log



#=======================Start Creat&Push tags===================#
#`git tag -f ${customerInternalVersionTags}`
#`git push origin -f ${customerInternalVersionTags}:${customerInternalVersionTags}`
#=======================Start Creat&Push tags===================#
