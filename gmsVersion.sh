#!/bin/bash 
projectDirName=$1

ProjectDirMkfile="scm/${projectDirName}/${projectDirName}.mk"
echo "${ProjectDirMkfile}"
GMSVersion=`cat ${ProjectDirMkfile} | awk -F 'GMS_PACKAGE' '{print $2}'|sed '/^$/d'|tr '' '\o'| sed 's/ //g'|sed 's/=//g' | tr A-Z a-z `
echo "${GMSVersion}"
googleFolder="google"
newgoogleFolder="vendor/${googleFolder}_${GMSVersion}"
oldgoogleFolder="vendor/${googleFolder}"
defaultgoogleFolder="vendor/${googleFolder}_default"

if [ -d ${oldgoogleFolder} ]
  then
    exit 2	    
fi

if [ -d ${newgoogleFolder} ]
  then
    mv  ./vendor/${googleFolder}_${GMSVersion} ./vendor/${googleFolder}
elif [ -d ${defaultgoogleFolder} ]
  then
    mv  ./vendor/${googleFolder}_default ./vendor/${googleFolder}
else 
   echo "you need to directory not exist!"
    exit 2
fi

find ./vendor/google_* -iname *.mk | xargs rm



