#!/bin/bash

for method in random degree betweenness d50b50 ;do
#for method in d50b50 ;do
	for net in ba.txt ba-sparse.txt ;do
		mkdir -p $method
		for i in `seq 1 100`
		do
		    if [[ ! -e $method/${net}_result_$i ]];then
			python3 sir_$method.py $net > $method/${net}_result_$i &
		    fi
		done
		wait
		
		echo -n "$method $net state R in the end: "
		for i in `seq 1 100`
		do
		    cat $method/${net}_result_$i | tail -n1 | cut -d ' ' -f 4
		done | awk '{a+=$1} END{print a/NR;}'
	done
done
