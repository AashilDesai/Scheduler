#!/bin/bash

for f in $(ls schedule)
do
	while read -r line
	do
		IFS=' ' read -r -a words <<< $line
		at "${words[1]}" $f echo "${words[0]}"
	done < $f
done
