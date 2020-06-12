if [[ "$1" != "" ]]; then
        cat $1 | sort -n -t\; -k2,2 | tr -d ';' >> .list
        IFS=$'\r\n' GLOBIGNORE='*' command eval  'word=($(cat .list))'
        countArray=${#word[@]}
        a="0"
        for (( c = 0; c<$countArray; c++ ))
        do
                #d=$((c+1))
                #echo -n "$d "
                e=$(ping -c1 ${word[$c]} | awk '{print $2,$3}' | sed -n 1p)
                e=${e//(/}
                echo -e "${e//)/}"
                echo -e
        done
        echo -e
        rm -r .list
else
        echo ""
        echo "what file? please type name off file"
        echo ""
        echo "Example: "
        echo ""
        echo "sortWord.sh example.txt"
        echo ""
fi;
