#!/bin/bash
export NPROCS=`grep -c ^processor /proc/cpuinfo`
export INPUT=$1

function changeGovernor {
  if [ "$INPUT" == "powersave" ]; then
    for (( num=0; num < $NPROCS; num++ ))
      do
        echo "powersave" > /sys/devices/system/cpu/cpu$num/cpufreq/scaling_governor
      done
    echo "Running in powersave"
  elif [ "$INPUT" == "performance" ]; then
    for (( num = 0; num < $NPROCS; num++ ))
      do
        echo "performance" > /sys/devices/system/cpu/cpu$num/cpufreq/scaling_governor
      done
    echo "Running in performance"
  else
    echo "Invalid input"
  fi
}

if [ "$INPUT" != "status" ]; then
  if [ $UID -ne 0 ]; then
    echo "Permission denied"
  else
    changeGovernor && unset NPROC ; unset INPUT
    exit 0
  fi
else
  for (( num = 0; num < $NPROCS; num++ )); do
    export STATUS=`cat /sys/devices/system/cpu/cpu$num/cpufreq/scaling_governor`
    echo "Processor $num : $STATUS"
    unset STATUS
  done
fi
