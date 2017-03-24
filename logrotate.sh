#log rotation script for dnsmasq


#to be run by daemon launcher

#viviparous 2017

#args: thiscmd triggersize watchedfilename mvdir 




doErrorExit() {
 echo "Error: $1"
 exit
}

doGoodExit() {
 echo "End: $1"
 exit
}

trigsize=5000000

argTrigSize=$1
argWatchedFile=$2
argMvDir=$3


tstamp=$(date +"_%Y-%m-%d_%H%M_")
ofilePrefix=logrot_
ofileSuffix=$tstamp
ofileName=$ofilePrefix$argWatchedFile$ofileSuffix
oTempFile=tmp_$argWatchedFile

echo Script name: $0
echo Found $# arguments 

if [ "$#" -ne 3 ]; then
 echo "Need 4 parameters"
 doErrorExit "args: thiscmd triggersize watchedfilename mvdir"
else
 echo "Args: $1 //  $2 //  $3"
fi

sizeTarg=$(wc -c < $argWatchedFile)

if [ "$sizeTarg" -gt "$argTrigSize" ]; then
 echo To Do: zip and cp $argWatchedFile $ofileName
else
 doGoodExit "No action for $argWatchedFile with size $sizeTarg"
fi

cp $argWatchedFile $oTempFile
tail -n 3 $oTempFile > $argWatchedFile
zip -9 $ofileName.zip $oTempFile
mv $ofilePrefix* $argMvDir
rm $oTempFile

echo Files in $argMvDir
ls -lh $argMvDir$ofilePrefix*
bucount=$(ls -lh $argMvDir$ofilePrefix*)
echo Count $bucount



