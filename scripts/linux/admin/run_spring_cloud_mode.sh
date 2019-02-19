#!/bin/bash

itsdiscovery=ON
itsconfig=ON
itsauthen=ON
itsstaticdata=ON
itsaccount=ON
itsorder=ON
itsmarketdata=ON
itsgateway=ON

if [ "${itsdiscovery}" = "ON" ]; then
    echo "Preparing to start itsdiscovery"
    ./start_itsdiscovery.sh
fi

if [ "${itsconfig}" = "ON" ]; then
    echo "Preparing to start itsconfig"
    ./start_itsconfig.sh
fi

if [ "${itsauthen}" = "ON" ]; then
    echo "Preparing to start itsauthen"
    ./start_itsauthen.sh
fi

if [ "${itsstaticdata}" = "ON" ]; then
    echo "Preparing to start itsstaticdata"
    ./start_itsstaticdata.sh
fi

if [ "${itsaccount}" = "ON" ]; then
    echo "Preparing to start itsaccount"
    ./start_itsaccount.sh
fi

if [ "${itsorder}" = "ON" ]; then
    echo "Preparing to start itsorder"
    ./start_itsorder.sh
fi

if [ "${itsmarketdata}" = "ON" ]; then
    echo "Preparing to start itsmarketdata"
    ./start_itsmarketdata.sh
fi

if [ "${itsgateway}" = "ON" ]; then
    echo "Preparing to start itsgateway"
    ./start_itsgateway.sh
fi
