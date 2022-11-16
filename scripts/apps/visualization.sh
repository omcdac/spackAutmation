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
echo "    Visualization Tools with $COMPILER Compiler "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################

#------------------------- grads ---------------------------#
#---------Edit below as per requirement-------
export APP=grads
export PAR=" -v -j8 "
export DEPS=""
export LOGFILE="grads"
source $SOURCEDIR/scripts/run.sh 
#-----------------------------------------------------------------------

#------------------------- vmd ---------------------------#
#---------Edit below as per requirement-------
#export COMPILER=gcc@10.3.0
export APP=vmd@1.9.3
export PAR=" -v -j8 "
export DEPS=" ^mesa "
export LOGFILE="vmd@1.9.3"
### manual download required
cd $SOURCEDIR/archives
source $SOURCEDIR/scripts/run.sh
cd -
#---------------------------------------------

#------------------------- pgplot ---------------------------#
#---------Edit below as per requirement-------
export APP=pgplot
export PAR=" -v -j8 "
export DEPS=""
export LOGFILE="pgplot"
source $SOURCEDIR/scripts/run.sh
#---------------------------------------------

