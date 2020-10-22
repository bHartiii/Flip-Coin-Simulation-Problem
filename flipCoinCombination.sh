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
}
for((i=0;i<10;i++))
do
	flipCoin
	FlipCoinCombination[$i]=$flipResult
done
echo ${FlipCoinCombination[@]}
