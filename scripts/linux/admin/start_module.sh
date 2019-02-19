#!/bin/bash
. setenv.sh

#Check if the module name is null or not
check_module_name() {
    if [ -z "${1}" ]
    then
        echo "No module name. Exit the program..."
        exit 1
    fi
}

#check if the module already started.
check_already_started() {
    result=$(ps -ef | grep ${1}:bootRun | grep -v grep)

    if [ ! -z "${result}" ]
    then
        echo "${module_name} already started!"
        exit 1
    fi
}

#Get module name
module_name=$1

check_module_name ${module_name}
check_already_started ${module_name} 

#Generate console log filename
now="$(date +'%Y%m%d%H%M%S')"
log_file=${module_name}_${now}.log

#echo "Project Home:${project_home}"

#Use Gradle Deamon to start the application
cd ${project_home}
./gradlew ${module_name}:bootRun > ${script_home}/logs/${log_file} 2>&1 &

echo "Starting ${module_name}......"

#Check if the process is started successfully
${script_home}/check_proc.sh ${log_file}
retn_code=$?

if [ ${retn_code} -eq 0 ]
then
    echo "${module_name} is started successfully!"
elif [ ${retn_code} -eq 1 ]
then
    echo "[ERROR] ${module_name} cannot be started. Please check the log file logs/${log_file}"
else
    echo "[ERROR] Unknown Error!"
fi

echo ""

#Back to the current directory
cd ${script_home}
