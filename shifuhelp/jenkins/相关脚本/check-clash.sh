#!/bin/bash

# 检查代码冲突，主要原理就是比较公版文件和客户文件夹中文件的
# 最后提交时间。
#
# 白名单”ClashWhiteList.txt”中保存公版文件的路径，用于忽略不用检查的文件
# 路径为"vendor/dewav/proprietary/custom_name/ClashWhiteList.txt"
#
# 作者： Segon
# 日期： 2017-06-22

#================ 脚本配置区 ======================

#================ 变量定义区 ======================
# 客户source文件夹的路径
mVendorSourcePath=""
# 白名单，表示不用同步的文件
mWhiteList=""
# 存在冲突的文件
mClashFiles=""

#================ 方法定义区 ======================
# 参数解析
function analyzeParams(){
    # 确保以”/”结尾
    if [[ "$1" =~ "source/" ]]; then
        mVendorSourcePath=$1
    else
        mVendorSourcePath=$1/
    fi

    if [ ! -d ${mVendorSourcePath} ]; then
        echo "\"${mVendorSourcePath}\" is not exist !!!"
        exit 2
    fi
}

# 读取白名单，路径为"vendor/dewav/proprietary/custom_name/ClashWhiteList.txt"
function readWhiteList(){
    local whiteListFilePath="${mVendorSourcePath/source\//}ClashWhiteList.txt"
    echo "check clash whitelist file: ${whiteListFilePath}"

    if [ -f $whiteListFilePath ]; then
        mWhiteList=`cat $whiteListFilePath`
    fi
}

# 检查冲突，当公版中的文件最后提交时间晚于客户文件，即认为存在冲突
function checkClash(){
    local vendorCommitTime=0
    local publicCommitTime=0
    local publicFile=""
    local errorIsEchoed="no"
    for vendorFile in `find ${mVendorSourcePath} -type f`
    do
        publicFile=${vendorFile//${mVendorSourcePath}/}
        vendorCommitTime=`git log --pretty="%at" -1 -- ${vendorFile}`
        publicCommitTime=`git log --pretty="%at" -1 -- ${publicFile}`

        # 公版文件存在，并且客户目录中的文件最后提交时间早于公版中的时间
        if [ "$publicCommitTime" != "" ] && [ $vendorCommitTime -lt $publicCommitTime ]; then
            # 如果公版文件和客户文件内容一致(通过md5判断)，就忽略
            local vendorSum=`md5sum ${vendorFile} | cut -d ' ' -f 1`
            local publicSum=`md5sum ${publicFile} | cut -d ' ' -f 1`
            if [ "${vendorSum}" = "${publicSum}" ]; then
                continue
            fi

            # 如果不在白名单中则认为有冲突
            if [[ ! "$mWhiteList" =~ "${publicFile}" ]]; then
                if [ "$errorIsEchoed" = "no" ]; then
                    local errorIsEchoed="yes"
                    echo "check clash error:"
                fi
                echo "    |-- ${vendorFile}"
                mClashFiles=${mClashFiles}" "${vendorFile}
            fi
        fi
    done
}

# 分析检测结果，如果存在冲突，返回非0值
function analyzeResult(){
    if [ "$mClashFiles" != "" ]; then
        # 存在冲突文件
        showError
        exit 3
    else
        echo "check clash ok !"
    fi
}

# 输出醒目报错图案
function showError() {
    echo "                 "
    echo "  .-\"      \"-. "
    echo " /            \  "
    echo "|              | "
    echo "|,  .-.  .-.  ,| "
    echo "| )(__/  \__)( | "
    echo "|/     /\     \| "
    echo "(_     ^^     _) "
    echo " \__|IIIIII|__/  "
    echo "  |-\IIIIII/-|   "
    echo "  \          /   "
    echo "   \`--------\`  "
    echo "                 "
}
#================ 执行区 ======================
analyzeParams $*
readWhiteList
checkClash
analyzeResult
