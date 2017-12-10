#!/bin/bash
dirCheck="/root/Desktop/Scripting"
oldStat=$(stat -t $dirCheck)

while true
do
newStat=$(stat -t $dirCheck)
if [ "$oldStat" = "$newStat" ];
	then
		echo "Directory has not changed!"
	else
		echo "Directory has changed!"
		now=$(date)
		now=${now//[[:blank:]]/}
		fileName="$now.zip"
		zip -r $fileName $dirCheck
		gdrive upload $fileName
		rm $fileName
fi
oldStat=$(stat -t $dirCheck)
sleep 5
done
