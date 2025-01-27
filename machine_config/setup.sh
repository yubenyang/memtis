#!/bin/bash

if [ $EUID -ne 0 ]; then
   echo "This script must be run as root" 
   exit 1
fi

#Disable frequency scaling to limit stddev
echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo
echo 0 > /sys/devices/system/cpu/cpufreq/boost
echo 0 > /proc/sys/kernel/numa_balancing
#systemctl disable ondemand
for i in $(seq 0 39); do
   echo "performance" > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor
done

#Disable hyperthreading
for i in $(seq 40 79); do
   echo 0 > /sys/devices/system/cpu/cpu$i/online
done

#ulimit -n 4096
