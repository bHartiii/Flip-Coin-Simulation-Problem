#!/bin/bash -x
heads=0
tails=0
flipCoin(){
        flipResult=$((RANDOM%2))
        case $flipResult in
                0) flipResult="Heads";;
                1) flipResult="Tails";;
        esac
        echo $flipResult
}
for((i=0;i<10;i++))
do
        flipCoin
        if [ $flipResult == "Heads" ]
        then
                ((heads++))
        else
                ((tails++))
	fi

done
echo "Tails - "$tails
echo "Head - "$heads
