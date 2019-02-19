#!/bin/bash

# progress bar function
prog() {
    local w=80 p=$1;  shift
    # create a string of spaces, then change them to dots
    printf -v dots "%*s" "$(( $p*$w/100 ))" ""; dots=${dots// /.};
    # print those dots on a fixed-width space plus the percentage etc. 
    printf "\r\e[K|%-*s| %3d s. %s" "$w" "$dots" "$p" "$*"; 
}

# Initialize variables
log_file=${1}
count=0

# Startup timeout
timeout=180

#Keep checking if the application is started
while [ ${count} -lt ${timeout}  ]; do
    result=$(grep Started ${script_home}/logs/${log_file} | grep seconds)

    if [ -z "${result}" ]
    then
        let "count++" 
        prog "${count}" still starting...
        sleep 1
    else
        exit 0
    fi

done

echo ""
exit 1
