
#!/bin/bash

while true
do
	sudo echo "26" > /sys/class/gpio/export
	sudo echo "out" > /sys/class/gpio/gpio26/direction
	sudo echo "1" > /sys/class/gpio/gpio26/value

	sleep 1

	sudo echo "0" > /sys/class/gpio/gpio26/value

	sudo echo "26" > /sys/class/gpio/unexport

	sleep 1
done
