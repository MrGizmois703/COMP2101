#!/bin/bash

#This is a script that will roll dice and display what is rolled

#Variables to be defined, this is a 6 sided die with 2 dice being rolled

sides="6"
count="2"

#Help Functions
function displayHelp {
  echo "[-h|--help] [-c|--count] [-s|--sides]"
}

sum=0
while [ $count -gt 0 ]; do
  case "$1" in
      -h|--help)
      displayHelp
      ;;
      -c|--count)
      ;;
      -s|--sides)
  esac

    roll=$(( $RANDOM % $sides +1 ))
    sum=$(( $sum + $roll ))
    echo "Rolled $roll"
    count=$((count - 1))
done


echo "You rolled a total of $sum"

cmd || echo 'cmd failed' >/dev/stderr
