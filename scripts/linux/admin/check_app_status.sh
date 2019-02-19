#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

check_app_status(){

   pid=$(ps -ef | grep com.exiasoft.${1} | grep -v grep | awk '{print $2}')
   echo ${pid}
}

#Declare all modules
modules=( "itsmonolith" "itsdiscovery" "itsconfig" "itsauthen" "itsstaticdata" "itsaccount" "itsorder" "itsmarketdata" "itsgateway" )

#Initialize the parameters
for i in "${modules[@]}"
do
    eval "${i}=SHUTDOWN"
done

#Display the result
echo ""
echo "=============================="
echo "Application Status            "
echo "=============================="

for i in "${modules[@]}"
do
    result=$(check_app_status ${i})
    
    if [ ! -z ${result} ]
    then
         eval "${i}=STARTED"
    fi    

    if [ ${!i} = "STARTED" ]
    then
        echo -e "${i} \t[${GREEN}${!i}${NC}]" 
    else
        echo -e "${i} \t[${RED}${!i}${NC}]" 
    fi
done

echo "=============================="
