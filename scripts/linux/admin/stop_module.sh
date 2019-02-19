#!/bin/bash
. setenv.sh

#Get module name
module_name=$1

if [ -z "${module_name}" ]
then
    echo "Usage: ./stop_module.sh {module_name}"
    exit 1
fi

pid=$(ps -ef | grep com.exiasoft.${module_name} | grep -v grep | awk '{print $2}')

if [ -z "${pid}" ]
then
    echo "[ERROR] Nothing to do... No ${module_name} program started!"
    exit 1
fi

kill -9 ${pid}
echo "${module_name} has been stopped."
