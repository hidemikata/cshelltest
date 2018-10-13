#!/bin/csh


###if 9 ok else ng##

mkdir -p /Users/mikata/test/dat/ok
mkdir -p /Users/mikata/test/dat/ng
mkdir -p /Users/mikata/test/dat/result
set count=1
set tmp = 0
##   ファイルが多すぎ
#foreach f (`ls -1 ./dat/*dat`)
#	echo $f
#	set trail=`tail -1 "$f"`
#	
#	if ($trail == 9) then
#		cp "$f" /Users/mikata/test/dat/ok 
#	else
#		echo NG"$f"
#		cp "$f" /Users/mikata/test/dat/ng
#	endif
#end
#
#
#foreach f (`ls -1 /Users/mikata/test/dat/ok`)
#	grep -v 9 /Users/mikata/test/dat/ok/"$f" >> /Users/mikata/test/dat/result/data
#end

foreach f (`find /Users/mikata/test/dat -name "*.dat"`)
	@ tmp = $count % 1000
	if ($tmp == 0) then
		echo $count
	endif
	set trail=`tail -1 "$f"`
	if ($trail == 9) then
		mv $f /Users/mikata/test/dat/ok 
	else
		echo 'ng'
		mv $f /Users/mikata/test/dat/ng
	endif
	@ count++
end

#headで１行だけとった方が早いかも？
find /Users/mikata/test/dat/ok/ -name "*.dat" -exec  grep -v 9 {} >> /Users/mikata/test/dat/result/data \;

