#!/bin/bash

export pattern="No package matches the query"
#---------------------------------------------
export query=`spack find $APP%$COMPILER$DEPS | grep -o "No package matches the query"`
if [[ "$query" == "$pattern" ]] ;
then
        echo "--------------------- $APP$DEPS ------------------------------" |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
        echo " $APP$DEPS installation will start soon !"
        sleep 3
        spack install  --no-checksum $APP %$COMPILER $DEPS |& tee -a $SOURCEDIR/logs/$COMPILER/$LOGFILE
        sleep 2
        tail -3 $SOURCEDIR/logs/apps/$COMPILER/$LOGFILE | head -1 | grep -e "Successfully"
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

