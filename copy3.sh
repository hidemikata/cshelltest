#!/bin/csh

mkdir -p takusan

set cnt=1

while($cnt <= 100000 )

cp 0_1152_1.dat takusan/0_1152_1_3_"$cnt".dat
@ cnt++
end







