#!/bin/bash
#to run: bash script.sh

filename="input.swc"
cell_folder="Cells/Cell"
mkdir -p Cells
i=1
n=0

while read line; do
  if [[ ${line%% *} == "#Cell" ]]
  then
     ((n++))  # Cell number
     cell_file="${cell_folder}${n}.swc"
     j=$i
     loc=`sed -n "$i"p "$filename"`
     while [ ${loc%% *} != "#" ]
     do
	loc=`sed -n "$j"p "$filename"`
	echo $loc >> $cell_file
        ((j++))
     done
  fi
  ((i++))
done < $filename

