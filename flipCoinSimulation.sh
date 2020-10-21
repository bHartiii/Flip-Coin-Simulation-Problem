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
for((i=0;$heads!=21 && $tails!=21;i++))
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
if [[ $heads -eq 21 && $tails -eq 21 ]]
then
        echo "It's a tie."

elif [ $heads -eq 21 ]
then
        echo "Heads wins by " $(($heads-$tails))
else
	echo "Tails wins by " $(($tails-$heads))
fi
