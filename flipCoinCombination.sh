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
flipCoin

