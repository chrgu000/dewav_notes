#/bin/bash

PROJECT=${1}
DIR="${2}"
if [ -d ${DIR} ];then
	rm -rf ${DIR}
        mkdir -p ${DIR}
    else
        mkdir -p ${DIR}    
fi


help_info() {
	echo
	echo "#################################################################################" 
	echo "#   Usage:                                                                      #"
	echo "#   ./cpbin.sh project_name target_dir                                          #"
	echo "#   Example:                                                                    #"
	echo "#   ./cpbin.sh c1268 c1268_img                                                  #"
	echo "#   If not exist directory c1268_img, it will be created in current directory.  #"
	echo "#################################################################################"
	echo
}

if [  $# -lt 1 ];then
	help_info
	exit
elif [ "-h" = $1 ] || [ "help" = $1 ] || [ "-help" = $1 ];then
	help_info
	exit
fi

# Copy bin(s) for download
cp out/target/product/${PROJECT}/{*.txt,*.bin,*.img,DSP*,EBR1,EBR2,MBR} ./${DIR}/ -v

# Copy AP Database
#MTK_CGEN_AP_Editor_DB := $(MTK_CGEN_OUT_DIR)/APDB_$(MTK_PLATFORM)_$(MTK_CHIP_VER)_$(MTK_BRANCH)_$(MTK_WEEK_NO)
cp out/target/product/${PROJECT}/obj/CGEN/APDB_* ./${DIR}/ -v

# Copy Modem Database
cp out/target/product/${PROJECT}/system/vendor/etc/mddb/BPLG*_1_lwg_n ./${DIR}/ -v

#Copy System.map
cp out/target/product/${PROJECT}/obj/KERNEL_OBJ/System.map ./${DIR}/ -v
