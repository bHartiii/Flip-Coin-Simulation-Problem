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
for((i=21;i<=30;i++))
do
        res1=$(flipCoin)
        res2=$(flipCoin)
	res3=$(flipCoin)
        FlipCoinCombination[$i]=`echo $res1$res2$res3`
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
for((i=21;i<=30;i++))
do
        varx=${FlipCoinCombination[$i]}
        if [ $varx == "HHH" ]
        then
                headsT=$((headsD+3))
        elif [ $varx == "TTT" ]
        then
                tailsT=$((tailsD+3 ))
        elif [[ $varx == "HHT"|| $varx == "HTH" || $varx == "THH" ]]
        then
		headsT=$((headsD+2))
		tailsT=$((tailsD+1))
	elif [[ $varx == "TTH"|| $varx == "THT" ||$varx == "HTT" ]]
	then
		headsT=$((headsD+1))
                tailsT=$((tailsD+2))
        fi
done
for((i=1;i<=30;i++))
do
	if [ $i -le 10 ]
	then
		singlet=${FlipCoinCombination[$i]}
		if [ $singlet == "H" ]
		then
			winArray[((j++))]=$singlet
		fi
	elif [[ $i -ge 11 && $i -le 20 ]]
	then
		doublet=${FlipCoinCombination[$i]}
		if [ $doublet == "HH" ]
		then
			winArray[((j++))]=$doublet
		fi
	else
		triplet=${FlipCoinCombination[$i]}
                if [[ $triplet == "HTH" || $triplet == "HHT"|| $triplet == "HHH" || $triplet == "THH"  ]]
                then
                        winArray[((j++))]=$triplet
                fi

	fi
done
echo "Percentage of singlets : "
echo "Heads - "$((heads*100/10))"%"
echo "Tails - "$((tails*100/10))"%"
echo "Percentage of doublets : "
echo "Heads - "$((headsD*100/10))"%"
echo "Tails - "$((tailsD*100/10))"%"
echo "Percentage of triplets : "
echo "Heads - "$((headsT*100/10))"%"
echo "Tails - "$((tailsT*100/10))"%"
echo "Wins - "${winArray[@]}
