#!/bin/bash
#This is a script that displays a report on memory useage
#The free command displays importnat memory information to which this script operates

#The /Mem/ line is how the calculations were made with the variables being:
# total     used     free    shared    buff/cache   available


echo "Memory Useage report"

echo "The values are displayed in MB"

#Display the total amount of RAM installed and the amount of free RAM
echo "The total RAM is"
awk '/^Mem:/{print $2}'<(free -m)
echo "free RAM"
awk '/Mem/ {print $4}' <(free -m)

#Calculate and display the sum of the used and cached RAM
echo "Sum of used and cached RAM"
awk '/Mem/ {print $3 + $6}' <(free -m)


#Calculate and display the difference between the available and free amounts
echo "The available amount of RAM is "
awk '/Mem/ {print $7}' <(free -m)
echo "The free amount of RAM is "
awk '/Mem/ {print $4}' <(free -m)

echo "The difference between the amounts are"
echo '/Mem/ {print $7-$4}' <(free -m)


#Calculate and display how much RAM is shared as a percentage of the RAM used
echo "Percentage of RAM used for share is"
awk '/Mem/ {print $5/$3 *100 "%"}' <(free -m)


#Calculate and display how much RAM is used for cache as a percentage of the total RAM
echo "Percentage of the RAM used in tota"
awk '/Mem/ {print $3/$2 *100 "%"}' <(free -m)


#Calculate and display how much RAM is used for cache as a percentage of the total RAM
echo "Percentage of the RAM used for cache"
awk '/Mem/ {print $6/$2 *100 "%"}' <(free -m)
