#!/bin/sh
rmmod ./dw1000_mod.ko
modprobe hwmon
modprobe mac802154
insmod ./dw1000_mod.ko
echo Driver Installed
