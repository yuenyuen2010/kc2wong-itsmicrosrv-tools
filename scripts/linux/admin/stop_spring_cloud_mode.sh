#!/bin/bash

#TODO: Stop all applications gracefully...
./stop_itsgateway.sh
./stop_itsmarketdata.sh
./stop_itsorder.sh
./stop_itsaccount.sh
./stop_itsstaticdata.sh
./stop_itsauthen.sh
./stop_itsconfig.sh
./stop_itsdiscovery.sh
