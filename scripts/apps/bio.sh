#!/bin/bash

#export COMPILER=gcc@11.2.0
#export pattern="No package matches the query"

#--------------- Check if directory exist or not and create it if not ----------
dir=$SOURCEDIR/logs/$COMPILER
[ ! -d "$dir" ] && mkdir -p "$dir"
#-------------------------------------------------------------------------------

################################# Domain #########################
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "    Bio-Informatics Applications with $COMPILER Compiler "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################

#------------------------- mummer ---------------------------#
#---------Edit below as per requirement-------
export APP=mummer
export PAR=" -v -j8"
export DEPS=""
export LOGFILE="mummer"
source $SOURCEDIR/scripts/run.sh 
#-----------------------------------------------------------------------

#------------------------- hmmer ---------------------------#
#---------Edit below as per requirement-------
export APP=hmmer
export PAR=" -v -j8  "
export DEPS=" "
export LOGFILE="hmmer"
source $SOURCEDIR/scripts/run.sh        
#-----------------------------------------------------------------------

#------------------------- meme ---------------------------#
#---------Edit below as per requirement-------
export APP=meme
export PAR=" -v -j8 "
export DEPS=" "
export LOGFILE="meme"
source $SOURCEDIR/scripts/run.sh

#------------------------- clustalw ---------------------------#
#---------Edit below as per requirement-------
export APP=clustalw
export PAR=" -v -j8 "
export DEPS=""
export LOGFILE="clustalw"
source $SOURCEDIR/scripts/run.sh
#---------------------------------------------















