#!/bin/bash

# for ip in $1.{1..254}; do
for ip in '192.168.0.1' '192.168.0.74' '192.168.0.91' '192.168.0.92' '192.168.0.90' '192.168.0.84' '192.168.0.86' '192.168.0.81'; do
  ping -c 1 -W 16 $ip | grep "64 bytes from" | awk '{print $4}{print $7}' | cut -d":" -f1 | \
	sed -e 's/,/./g' | sed ':begin;$!N;s/\n/,/;tbegin' | sed -e 's/time=//g' &

done
