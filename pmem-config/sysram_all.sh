#!/bin/bash

for i in 0 1 2 3 4 5 6 7;
do
    daxctl reconfigure-device dax$i.0 --mode=system-ram
done

dmesg | grep Tiering
