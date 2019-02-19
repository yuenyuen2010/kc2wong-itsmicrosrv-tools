#!/bin/bash
. setenv.sh

cd ${project_home}
./gradlew project
cd -
