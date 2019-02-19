#!/bin/bash

cmd="curl -s -H \"Content-Type:application/json\" -X POST -d \"{\\\"userid\\\": \\\"AD2923702\\\"}\" http://localhost:8080/authentication/int/v1/papi/authen-token"
token=$(eval ${cmd})

echo "TOKEN"
echo "===================="
echo ${token}
echo "===================="

cmd="curl -s -H \"Authorization: ${token}\" -X GET http://localhost:8080/order/v1/xapi/trading-accounts/306-1-61151-7/simple-orders"

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
