#!/bin/bash
#description: creating a simple script for an ATM user.
#Author: Mathias
#Here is the code

echo "welcome to World Bank"
echo "please insert your card"
echo "please enter the last 4-digits of your card"
read cvc
echo "thank  you for activating your card"
echo "now set up your 4-digit pin"
read -s pin1
echo "please confirm your pin"
read -s pin2
if [ $pin1 -eq $pin2 ]
then
	echo "thank you, your pin is now set"
else
	echo "your pin does not match , please try again"
fi
