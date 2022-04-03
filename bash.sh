i=0;
mainArr=()
search=()
index=-1 
for user in "$@" 
do      
        if [ "$user" = "-f" ]
        then 
                index=$((i));
                break
        fi
        search+=("$user")
        i=$((i + 1));
done


for user in "$@" 
do
        mainArr+=("$user")
done

BAR=${search[@]}
BAZ=${BAR// /_}
fileName="default.log"
if [ $index -ne "-1" ]
then 
        index=$((index+1))
        C=("${mainArr[@]:$index}")   
        BAR=${C[@]}
        fileName=${BAR// / }
fi

code=$(curl -LI https://en.wikipedia.org/wiki/${BAZ} -o /dev/null -w '%{http_code}\n' -s)

	if [ "$fileName" ]
	then 
		echo "https://en.wikipedia.org/wiki/${BAZ}" | cat >> $fileName
		echo "https://en.wikipedia.org/wiki/${BAZ}"
		sleep 1
		echo "file given file name : $fileName"
	else
		echo "https://en.wikipedia.org/wiki/${BAZ}" | cat >> defaultFile.log
		echo "https://en.wikipedia.org/wiki/${BAZ}"
		sleep 1
		echo "file not given data is in defaultFile.log" 
	fi
		
else
	if ! [ "$BAZ" ]
	then 
		echo "enter the article name"
	fi
	echo "bad request "
fi