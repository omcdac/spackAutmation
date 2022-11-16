#!/bin/bash
#------------ Author : Om Jadhav ------------------------------------------
#export COMPILER=gcc@11.2.0
#export COMPILER=intel

export COMP=$1   # Take the compiler as argumen from the script

#source /home/shavak/om/spack/spack/share/spack/setup-env.sh
#export SOURCEDIR=/home/shavak/om/spack/AppSetup

list=$SOURCEDIR/scripts/checklist.txt
export pattern="No package matches the query"

rm $SOURCEDIR/logs/checklist.log
rm $SOURCEDIR/logs/succesfull.log
rm $SOURCEDIR/logs/unsuccesfull.log

sc=0
unsc=0
while read app; do
	export APP=$app
	#export query=`spack find $APP%$COMPILER$DEPS | grep -o "No package matches the query"`
	export query=`spack find $APP$COMP | grep -o "No package matches the query"`
	if [[ "$query" == "$pattern" ]] ;
	then
		echo "**************************************************************" |& tee -a $SOURCEDIR/logs/checklist.log
		echo "          !!! >>>  $APP  <<<<!!!         " |& tee -a $SOURCEDIR/logs/checklist.log
		echo ""
		echo "$APP : NOT installed - $COMP" |& tee -a $SOURCEDIR/logs/checklist.log
        	echo "______________________________________________________________" |& tee -a $SOURCEDIR/logs/checklist.log
		unsc=$((unsc + 1))
		echo "$APP : NOT installed - $COMP" >> $SOURCEDIR/logs/unsuccesfull.log
	else
		echo "**************************************************************" |& tee -a $SOURCEDIR/logs/checklist.log
		echo "           !!!>>>  $APP  <<<<!!!         " |& tee -a $SOURCEDIR/logs/checklist.log
		echo ""
		echo "$APP : Installed - $COMP" |& tee -a $SOURCEDIR/logs/checklist.log
		echo "$APP : Installed - $COMP" >> $SOURCEDIR/logs/succesfull.log
		echo ".............................................." |& tee -a $SOURCEDIR/logs/checklist.log
		spack find -l -v -f  $APP$COMP |& tee -a $SOURCEDIR/logs/checklist.log
		echo "_______________________________________________________________" |& tee -a $SOURCEDIR/logs/checklist.log
		sc=$((sc + 1))
	fi
done < $list
echo "" |& tee -a $SOURCEDIR/logs/checklist.log
echo "                   !!! Summary Card !!!                       " |& tee -a $SOURCEDIR/logs/checklist.log
echo "**************************************************************" |& tee -a $SOURCEDIR/logs/checklist.log
echo "Total Succesfull installations = $sc " |& tee -a $SOURCEDIR/logs/checklist.log 
echo ""
cat $SOURCEDIR/logs/succesfull.log   |& tee -a $SOURCEDIR/logs/checklist.log
echo "**************************************************************" |& tee -a $SOURCEDIR/logs/checklist.log
echo "" |& tee -a $SOURCEDIR/logs/checklist.log
echo "**************************************************************" |& tee -a $SOURCEDIR/logs/checklist.log
echo "Total unsuccesfull installations = $unsc " |& tee -a $SOURCEDIR/logs/checklist.log
echo ""
echo "------ List of Unsuccessfull Installations------        " |& tee -a $SOURCEDIR/logs/checklist.log
echo ""
cat $SOURCEDIR/logs/unsuccesfull.log   |& tee -a $SOURCEDIR/logs/checklist.log
echo ""
echo "**************************************************************" |& tee -a $SOURCEDIR/logs/checklist.log
echo "" |& tee -a $SOURCEDIR/logs/checklist.log
#-----------------------------------------------------------------------
