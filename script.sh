#!/usr/bin/bash

temp=0
flag_0=0
temp1="docker"

#run container
doc_run_test_container () {
docker build -t t1613 /root/src
docker run -d -t t1613
}

#check for prerequisite
check_prerequisite () {
check=$(command -v docker)
if [[ "$check" =~ .*"$temp1".* ]]; then
flag_0=1;
echo "Docker is Installed"
else
echo "Docker is not Installed:Install manually"
fi
}


#check for resources
check_for_resource () {
docker ps
docker logs --tail 10 $(docker ps -l -q --filter ancestor=t1613)
docker stats --no-stream
docker inspect $(docker ps -a -q --filter ancestor=t1613)
}

#cleanup commands
cleanup () {
docker stop $(docker ps -a -q --filter ancestor=t1613)
docker rmi -f t1613
}

echo "Container Resource Discovery:T1613"
check_prerequisite
if [ "$flag_0" == "1" ]
then
doc_run_test_container
temp=1
else
flag_0=0
fi

if [ "$temp" = "1" ]
then
check_for_resource
echo "Do you want to run clean up function [Y|N]"
read input
if [ "$input" = "Y" ]
then
echo "Cleaning in Process"
cleanup
echo "Cleaning Completed"
elif [ "$input" = "N" ]
then
echo "Cleanup function not selected"
else
echo "Wrong input selected"
fi
fi
