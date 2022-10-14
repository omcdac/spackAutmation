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
echo "                     GCC Compiler                         "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
################################# Applications #########################

#------------------------- gcc.11.2.0 ---------------------------#
#---------Edit below as per requirement-------
export APP=gcc@11.2.0
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="gcc@11.2.0"
source $SOURCEDIR/scripts/run.sh 
spack load gcc@11.2.0
spack compiler find
#-----------------------------------------------------------------------

#------------------------- gcc.10.3.0 ---------------------------#
#---------Edit below as per requirement-------
export APP=gcc@10.3.0
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="gcc@10.3.0"
source $SOURCEDIR/scripts/run.sh
spack load gcc@10.3.0
spack compiler find
#-----------------------------------------------------------------------

#------------------------- gcc - latest ---------------------------#
#---------Edit below as per requirement-------
export UserCompiler=$COMPILER
export COMPILER=gcc@11.2.0
dir=$SOURCEDIR/logs/$COMPILER
[ ! -d "$dir" ] && mkdir -p "$dir"
#------------------------------------------------------------------
export APP=gcc@12.2.0
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="gcc-12.2.0"
source $SOURCEDIR/scripts/run.sh
spack load gcc@12.2.0
spack compiler find
export COMPILER=$UserCompiler
#-----------------------------------------------------------------------

## Note if required you can install other compilers by uncommenting following lines of code

#------------------------- gcc.9.4.0 ---------------------------#
#---------Edit below as per requirement-------
#export APP=gcc@9.4.0
#export PAR=" -j8 -v "
#export DEPS=" "
#export LOGFILE="gcc@9.4.0"
#source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

















