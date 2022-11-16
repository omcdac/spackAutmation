#!/bin/bash
#------------ Author : Om Jadhav ------------------------------------------
#export COMPILER=gcc@11.2.0
#export pattern="No package matches the query"

#--------------- Check if directory exist or not and create it if not ----------
dir=$SOURCEDIR/logs/$COMPILER
[ ! -d "$dir" ] && mkdir -p "$dir"
#-------------------------------------------------------------------------------

################################# Domain #########################
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "    CFD Applications with $COMPILER Compiler "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################

#------------------------- openfoam-org ---------------------------#
#---------Edit below as per requirement-------
export APP=openfoam-org
export PAR=" -v -j 8"
export DEPS=" "
export LOGFILE="openfoam-org"
source $SOURCEDIR/scripts/run.sh 
#-----------------------------------------------------------------------

#------------------------- openfoam-org ---------------------------#
#---------Edit below as per requirement-------
export APP=openfoam@2206
export PAR=" -v -j 8"
export DEPS=" +metis "
export LOGFILE="openfoam"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------


#------------------------- su2 ---------------------------#
#---------Edit below as per requirement-------
export APP=su2
export PAR=" -v -j 8"
export DEPS=" "
export LOGFILE="su2"
source $SOURCEDIR/scripts/run.sh        
#-----------------------------------------------------------------------
















