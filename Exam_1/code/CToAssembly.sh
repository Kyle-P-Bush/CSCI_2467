#!/usr bash

for i in *.c
do
	echo "Compiling $i into assembly..."
	gcc -Wall -S $i -o ${i%.c}.s
done

for i in *.s
do 
	echo "CounterScript for $i :"
	python3 CounterScript.py $i
done
