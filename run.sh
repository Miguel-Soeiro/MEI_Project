#!/usr/bin/bash

rm -rf ./alg
mkdir ./alg
#Problema 1, percentagem fixa e vertices altos capacidade fixa
for n in {150..500..50}; do
    echo $n
    mkdir -p ./alg/prob1/$n

    search_dir="./inputs/prob1/$n/*.txt"
    for file in $search_dir; do
        ./Dinic 9999 $file >>./alg/prob1/$n/Dinic_$n.txt
        ./EK 9999 $file >>./alg/prob1/$n/EK_$n.txt
        ./MPM 9999 $file >>./alg/prob1/$n/MPM_$n.txt
    done
done
#Problema 2, percentagem fixa e vertices baixos capacidade fixa
for n in {20..55..5}; do
    echo $n
    mkdir -p ./alg/prob2/$n

    search_dir="./inputs/prob2/$n/*.txt"
    for file in $search_dir; do
        ./Dinic 9999 $file >>./alg/prob2/$n/Dinic_$n.txt
        ./EK 9999 $file >>./alg/prob2/$n/EK_$n.txt
        ./MPM 9999 $file >>./alg/prob2/$n/MPM_$n.txt
    done
done

#Problema 3, percentagem alta e vertices fixos capacidade fixa
for n in {70..95..5}; do
    echo $n
    mkdir -p ./alg/prob3/$n

    search_dir="./inputs/prob3/$n/*.txt"
    for file in $search_dir; do
        ./Dinic 9999 $file >>./alg/prob3/$n/Dinic_$n.txt
        ./EK 9999 $file >>./alg/prob3/$n/EK_$n.txt
        ./MPM 9999 $file >>./alg/prob3/$n/MPM_$n.txt
    done
done

#Problema 4, percentagem fixa e vertices baixo capacidade fixa
for n in {15..40..5};
    do
    echo $n
    mkdir -p ./alg/prob4/$n
    search_dir="./inputs/prob4/$n/*.txt"
    for file in $search_dir; do
        echo $file
        ./Dinic 9999 $file >>./alg/prob4/$n/Dinic_$n.txt
        ./EK 9999 $file >>./alg/prob4/$n/EK_$n.txt
        ./MPM 9999 $file >>./alg/prob4/$n/MPM_$n.txt
    done
done







echo "DONE"
