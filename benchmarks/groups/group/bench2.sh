#!/bin/bash

# SAT

START=$(date +%s)
c=0
s=0
w=0

for i in `cat name3`; do
		../../.././microsat ../../bench2/sat/$i > results 2>&1
		if (grep -q "[^n]sat" results) || (grep -q "^sat" results); then
		  echo "$i Pass!"
			let "c+=1"
			let "s+=1"
	  else
      echo "$i Wrong!"
			let "s+=1"
			let "w+=1"
	  fi
		
		rm -f results
done

for i in `cat name4`; do
		../../.././microsat ../../bench2/unsat/$i > results 2>&1
		if grep -q "unsat" results; then
		  echo "$i Pass!"
			let "c+=1"
			let "s+=1"
	  else
      echo "$i Wrong!"
			let "s+=1"
			let "w+=1"
	  fi
		
		rm -f results
done

echo "-------- Your Result --------"
echo "Pass: $c/$s"

END=$(date +%s)
DIFF=$((  $END - $START ))
echo "Took $DIFF seconds."