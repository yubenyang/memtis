#!/bin/bash

daxctl reconfigure-device dax0.0 --mode=system-ram

dmesg | grep Tiering
