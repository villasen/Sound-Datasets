#!/bin/bash

#Original set
#IN_PATH=~/machine_learning/ESC-50-8kHz
#OUT_PATH=~/machine_learning/github/Sound-Datasets/Silence-ESC-50

# Converting for first phase
#IN_PATH=~/machine_learning/github/Sound-Datasets/ESC-50
#OUT_PATH=~/machine_learning/Datasets/Silence-ESC-50-16K

# Converting for second phase
IN_PATH=~/machine_learning/Datasets/ESC-50-16K
OUT_PATH=~/machine_learning/Datasets/Final-ESC-50-16K

echo show path: $IN_PATH 
cd $IN_PATH

OIFS=$IFS; IFS=$'\n'; array=($(ls )); IFS=$OIFS; echo "${array[0]}"
#array=($(ls)); echo "${array[0]}"
#cd ${array[0]}
#ls -l

echo size of : ${#array[@]}


for revolution in "${array[@]}"; do
    echo $revolution
    mkdir -p ${OUT_PATH}/$revolution
    cd   ${revolution}
    #ls   -l
    #OIFS=$IFS; IFS=$'\n'; inside_array=($(ls )); IFS=$OIFS; echo "${inside_array[0]}"
    inside_array=($(ls )); #echo "${inside_array[0]}"
    for inside_revolution in "${inside_array[@]}";do
        echo "Listing: ${inside_revolution}"
        # removes all silence from file, leaving only sound
        sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/${inside_revolution}" silence 1 0.1 1% -1 0.1 1%
  
    done
   
    cd ..
done



