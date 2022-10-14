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
echo "                     CUDA Compiler                         "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################

#------------------------- cuda ---------------------------#
#---------Edit below as per requirement-------
export APP=cuda
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="cuda"
source $SOURCEDIR/scripts/run.sh 
#-----------------------------------------------------------------------
#------------ Compiler Setup ----------------------
echo "Setting compilers ....."
spack load cuda
spack compilers
spack compiler find
echo "Compiler setup done !"

#------------------------------------------------------

#------------------------- nvhpc ---------------------------#
#---------Edit below as per requirement-------
export APP=nvhpc
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="nvhpc"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------



















