#!/bin/bash

LOGGER="logger -p local0.crit"
OUTPUT=$(apt-get -s upgrade | grep "^[[:digit:]]\+ upgraded" | awk '{print $1}')

ARG1=""
while getopts ":n:" options; do
  case "${options}" in 
    n)
      ARG1=${OPTARG}
      ;;
    :)
      exit 1
      ;;
    *)
      exit 1
      ;;
  esac
done

if [ "$ARG1" = "check" ]; then
  echo "$ARG1"
  $LOGGER "Notice - Starting update check process"
  apt-get update -y
  if [[ ${OUTPUT} == '0' ]]; then
    $LOGGER "Healthy - No updates available"
  else
    $LOGGER "Warning - ${OUTPUT} updates available"
    $LOGGER "Warning - Acknowledge the SL1 Event to trigger update process"
  fi
elif [ "$ARG1" = "upgrade" ]; then
  rm -f nohup.out
  apt-get update -y
  nohup apt-get upgrade -y &
  while [[ ${OUTPUT} != '0' ]]; do
    echo
  done
  $LOGGER "Notice - Updates have been installed"
  $LOGGER "Change request: Package updates have been installed"
  sleep 30
  $LOGGER "Healthy - No updates available"  
elif ! [[ "$ARG1" =~ [^a-zA-Z0-9\ ] ]];then
  exit 1
else 
  exit 1
fi
exit 0 
