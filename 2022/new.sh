# Basic shell script to create new directory and copy template into it


arg1=$1 #should beday number
tempName="temp.lua"
folderName="day${arg1}"
fileName="day${arg1}.lua"

mkdir $folderName
cp $tempName $folderName
mv "${folderName}/${tempName}" "${folderName}/${fileName}"

