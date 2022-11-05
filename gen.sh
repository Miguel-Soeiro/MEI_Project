#!/usr/bin/bash
files=""
rm -rf ./inputs
mkdir -p ./inputs

default_capacity=9999
default_probability=0.5
default_vertice=500
default_number_of_seeds=5

prob1_array=(500 750 1000 1250 1500 1750 2000 2250)

prob2_array=(25 35 45 55 65 75 85 95)

prob3_array=(15 18 21 24 27 30 33 36)

prob4_array=(72 75 78 81 84 87 90 93)

#Problema 1, percentagem fixa e vertices altos capacidade fixa
mkdir -p ./inputs/prob1

for vertice in "${prob1_array[@]}"; do
  mkdir -p ./inputs/prob1/$vertice
  echo $vertice
  for ((seed = 1; seed <= $default_number_of_seeds; seed++)); do
    python3 gen.py $vertice $default_probability $default_capacity $seed ./inputs/prob1/$vertice/$vertice"_"$seed.txt

  done
done

#Problema 2, percentagem fixa e vertices baixos capacidade fixa
mkdir -p ./inputs/prob2
for vertice in "${prob2_array[@]}"; do
  mkdir -p ./inputs/prob2/$vertice
  echo $vertice
  for ((seed = 1; seed <= $default_number_of_seeds; seed++)); do
    python3 gen.py $vertice $default_probability $default_capacity $seed ./inputs/prob2/$vertice/$vertice"_"$seed.txt
  done
done

#Problema 3, percentagem alta e vertices fixos capacidade fixa
for probability in "${prob3_array[@]}"; do
  mkdir -p ./inputs/prob3/$probability
  echo $probability

  for ((seed = 1; seed <= $default_number_of_seeds; seed++)); do
    python3 gen.py $default_vertice ".$probability" $default_capacity $seed ./inputs/prob3/$probability/$probability"_"$seed.txt
  done
done

#Problema 4, percentagem fixa e vertices baixo capacidade fixa
for probability in "${prob4_array[@]}"; do
  mkdir -p ./inputs/prob4/$probability
  echo $probability
  for ((seed = 1; seed <= $default_number_of_seeds; seed++)); do
    python3 gen.py $default_vertice ".$probability" $default_capacity $seed ./inputs/prob4/$probability/$probability"_"$seed.txt
  done
done

rm -rf ./alg
mkdir ./alg
#Problema 1, percentagem fixa e vertices altos capacidade fixa
for vertice in "${prob1_array[@]}"; do
  mkdir -p ./alg/prob1/$vertice
  echo $vertice

  search_dir="./inputs/prob1/$vertice/*.txt"
  for file in $search_dir; do
    ./Dinic 9999 $file >>./alg/prob1/$vertice/Dinic_$vertice.txt
    ./EK 9999 $file >>./alg/prob1/$vertice/EK_$vertice.txt
    ./MPM 9999 $file >>./alg/prob1/$vertice/MPM_$vertice.txt
  done
done
#Problema 2, percentagem fixa e vertices baixos capacidade fixa
for vertice in "${prob2_array[@]}"; do
  echo $vertice

  mkdir -p ./alg/prob2/$vertice

  search_dir="./inputs/prob2/$vertice/*.txt"
  for file in $search_dir; do
    ./Dinic 9999 $file >>./alg/prob2/$vertice/Dinic_vertice.txt
    ./EK 9999 $file >>./alg/prob2/$vertice/EK_$vertice.txt
    ./MPM 9999 $file >>./alg/prob2/$vertice/MPM_$vertice.txt
  done
done

#Problema 3, percentagem alta e vertices fixos capacidade fixa
for probability in "${prob3_array[@]}"; do
  echo $probability
  mkdir -p ./alg/prob3/$probability

  search_dir="./inputs/prob3/$probability/*.txt"
  for file in $search_dir; do
    ./Dinic 9999 $file >>./alg/prob3/$probability/Dinic_$probability.txt
    ./EK 9999 $file >>./alg/prob3/$probability/EK_$probability.txt
    ./MPM 9999 $file >>./alg/prob3/$probability/MPM_$probability.txt
  done
done

#Problema 4, percentagem fixa e vertices baixo capacidade fixa
for probability in "${prob4_array[@]}"; do
echo $probability
  mkdir -p ./alg/prob4/$probability
  search_dir="./inputs/prob4/$probability/*.txt"
  for file in $search_dir; do
    echo $file
    ./Dinic 9999 $file >>./alg/prob4/$probability/Dinic_$probability.txt
    ./EK 9999 $file >>./alg/prob4/$probability/EK_$probability.txt
    ./MPM 9999 $file >>./alg/prob4/$probability/MPM_$probability.txt
  done
done
