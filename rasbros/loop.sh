#!/bin/bash
# http://www.compciv.org/topics/bash/loops/
# https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash
echo Start loop ...

cat peptides.txt | while read line
do
   # do something with $line here
   echo "Line = " + $line
done


## Второй вариант
# while read p; do
#       echo "------>" "$p"
# done <peptides.txt


## Третий вариант
# echo Третий вариант ------------------------

# filename='peptides.txt'
# exec 4 < $filename
# echo Start
# while read -u4 p ; do
#     echo ******** $p
# done


# http://www.compciv.org/topics/bash/loops/
# for x in Q Zebra 999 Smithsonian
# do      
#    echo Hi $x
# done


## Расклад по словам каждое предложение
# for line in $(cat peptides.txt)
# do
#     echo "$line"
# done


