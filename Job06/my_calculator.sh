ope=$2

if [ $ope = "x" ]; then
	echo $(($1 * $3))
elif [ $ope = "+" ]; then
	echo $(($1 + $3))
elif [ $ope = "-" ]; then
	echo $(($1 - $3))
elif [ $ope = "/" ]; then
	echo $(($1 / $3))
fi
