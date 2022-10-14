#!/bin/bash

## Pattern to check whether the application has been installed or not !
export pattern="No package matches the query"
#---------------------------------------------
# Get the pattern in a variable
export query=`spack find $APP%$COMPILER$DEPS | grep -o "No package matches the query"`

# check if pattern mathes, if no pattern match it means the application is already installed !
if [[ "$query" == "$pattern" ]] ;
then
        echo "--------------------- $APP$DEPS ------------------------------" |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
        echo " $APP$DEPS installation will start soon, Please wait !"
        sleep 10
	echo ""  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
	echo "Installation Command : spack install $PAR $APP %$COMPILER $DEPS "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
	echo ""  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
	## Here the Installation will start !!
        spack install $PAR $APP %$COMPILER $DEPS |& tee -a $SOURCEDIR/logs/$COMPILER/$LOGFILE
        sleep 2
        tail -3 $SOURCEDIR/logs/$COMPILER/$LOGFILE | head -1 | grep -e "Successfully"
        if [ $? -eq 0 ]; then
                echo "OK: $APP$DEPS has been installed Successfully !" |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
        else
                echo "FAIL: Please check the logs of $LOGFILE" |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
                echo "----------------------------------------------" |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
        fi
        #--------------------------------------------------
else
    echo "$APP%$COMPILER$DEPS is already Installed !" |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
    echo "----------------------------------------------" |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
fi
#-----------------------------------------------------------------------

