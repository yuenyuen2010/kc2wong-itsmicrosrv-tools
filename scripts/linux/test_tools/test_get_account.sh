#!/bin/bash

cmd="curl -s -H \"Content-Type:application/json\" -X POST -d \"{\\\"userid\\\": \\\"AD2923702\\\"}\" http://localhost:8080/authentication/int/v1/papi/authen-token"
token=$(eval ${cmd})

echo "TOKEN"
echo "===================="
echo ${token}
echo "===================="

cmd="curl -s -H \"Authorization: ${token}\" -X GET http://localhost:8080/account/v1/sapi/trading-accounts"

result=$(eval ${cmd})

echo ""
echo "RESULT"
echo "===================="

if [ -z "${result}" ]
then
      echo "Fail to get order!"

else
      echo ${result}
fi

echo "===================="
