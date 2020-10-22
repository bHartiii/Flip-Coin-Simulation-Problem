#!/bin/bash 
heads=0
tails=0
declare -A FlipCoinCombination
flipCoin(){
        flipResult=$((RANDOM%2))
        case $flipResult in
                0) flipResult="H";;
                1) flipResult="T";;
        esac
	echo $flipResult
}
for((i=1;i<=10;i++))
do
	singlet=$(flipCoin)
	FlipCoinCombination[$i]=$singlet
done
for((i=11;i<=20;i++))
do
        res1=$(flipCoin)
	res2=$(flipCoin) 
        FlipCoinCombination[$i]=`echo $res1$res2`
done

echo ${FlipCoinCombination[@]}
for((i=1;i<=10;i++))
do
	varx=${FlipCoinCombination[$i]}
	if [ $varx == "H" ]
	then
		((heads++))
	else
		((tails++))
	fi
done
for((i=11;i<=20;i++))
do
        varx=${FlipCoinCombination[$i]}
        if [ $varx == "HH" ]
        then
                headsD=$((headsD+2))
        elif [ $varx == "TT" ]
	then
                tailsD=$((tailsD+2 ))
	else
		((headsD++))
		((tailsD++))
        fi
done
echo "Percentage of singlets : "
echo "Heads - "$((heads*100/10))"%"
echo "Tails - "$((tails*100/10))"%"
echo "Percentage of doublets : "
echo "Heads - "$((headsD*100/10))"%"
echo "Tails - "$((tailsD*100/10))"%"
