#!/bin/bash
#! Initialice the Pi for input on pin 16
echo "16" > /sys/class/gpio/export
echo "in" > /sys/class/gpio/gpio16/direction

n=0
ni=3
zero=0

#while [ $n -lt 10000 ]
while true
do
   outPi=$(cat /sys/class/gpio/gpio16/value)
   #echo 'Pin is:' $outPi
   sleep 1.5

   # count if pin i low
   if [ "$outPi" -gt "$zero" ]; then
      ni=`expr $ni - 1 ` 
      n=`expr $n + 1 `
      
      #echo "Pi will shut down in" $ni
   else
      n=0
      ni=3
   fi

   if [ $ni -lt 1 ]
   then
      #echo "PowerOff"
      sleep 1.5 
      sudo poweroff
   fi
done

echo "16" > /sys/class/gpio/unexport


