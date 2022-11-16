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
echo "    Other Applications with $COMPILER Compiler "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################

#------------------------- ninja ---------------------------#
#---------Edit below as per requirement-------
export APP=ninja
export PAR=" -j8 "
export DEPS=" "
export LOGFILE="ninja"
source $SOURCEDIR/scripts/run.sh 
#-----------------------------------------------------------------------

#------------------------- athena ---------------------------#
#---------Edit below as per requirement-------
export APP=athena
export PAR=" "
export DEPS=" "
export LOGFILE="athena"
source $SOURCEDIR/scripts/run.sh        
#-----------------------------------------------------------------------

#------------------------- prism ---------------------------#
#---------Edit below as per requirement-------
export APP=prism
export PAR=" -v -j4 "
export DEPS=" "
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

#------------------------- octave ---------------------------#
#---------Edit below as per requirement-------
export APP=octave
export PAR=" -v -j4 "
export DEPS=" "
export LOGFILE="octave"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

#------------------------- tau ---------------------------#
#---------Edit below as per requirement-------
export APP=tau
export PAR=" -v -j 8"
export DEPS=" "
export LOGFILE="tau"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------























