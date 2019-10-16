#!/bin/bash

IN_PATH=~/machine_learning/github/Sound-Datasets/ESC-50
OUT_PATH=~/machine_learning/workspace/Working_on_datasets/ESC-50-splitted


echo Input path: $IN_PATH
echo Output path: $OUT_PATH

ONE=A-
TWO=B-
THREE=C-
FOUR=D-
FIVE=E-

cd $IN_PATH

OIFS=$IFS; IFS=$'\n'; array=($(ls )); IFS=$OIFS; echo "${array[0]}"

echo size of : ${#array[@]}

for revolution in "${array[@]}"; do
	echo $revolution
	mkdir -p ${OUT_PATH}/$revolution
	cd ${revolution}
        inside_array=($(ls ));
	for inside_revolution in "${inside_array[@]}"; do
		echo "Listing: ${inside_revolution}"

       	        sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/$ONE${inside_revolution}" trim 0 1
	        sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/$TWO${inside_revolution}" trim 1 1
	        sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/$THREE${inside_revolution}" trim 2 1
	        sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/$FOUR${inside_revolution}" trim 3 1
	        sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/$FIVE${inside_revolution}" trim 4 1

         done

	cd ..
done


#for revolution in "${array[@]}"; do
#	echo $revolution
#	mkdir -p ${OUT_PATH}/$revolution
#	cd ${revolution}
#	for inside_revolution in "${inside_array[@]}"; do
#	    echo "Listing: ${inside_revolution}"

#	    sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/${inside_revolution}$ONE" trim 0 00:01
#	    sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/${inside_revolution}$TWO" trim 00:01 00:02
#	    sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/${inside_revolution}$THREE" trim 00:02 00:03
#	    sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/${inside_revolution}$FOUR" trim 00:03 00:04
#	    sox "${IN_PATH}/${revolution}/${inside_revolution}" "${OUT_PATH}/${revolution}/${inside_revolution}$FIVE" trim 00:04 00:05
#        done

#	cd ..
#done
