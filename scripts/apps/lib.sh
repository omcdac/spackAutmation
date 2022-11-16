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
echo "    Libraries with $COMPILER Compiler "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################

#------------------------- git ---------------------------#
#---------Edit below as per requirement-------
export APP=git
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="git"
source $SOURCEDIR/scripts/run.sh 
#-----------------------------------------------------------------------

#------------------------- fftw ---------------------------#
#---------Edit below as per requirement-------
export APP=fftw
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="fftw"
source $SOURCEDIR/scripts/run.sh        
#-----------------------------------------------------------------------

#------------------------- tcl ---------------------------#
#---------Edit below as per requirement-------
export APP=tcl
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="tcl"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

#------------------------- tk ---------------------------#
#---------Edit below as per requirement-------
export APP=tk
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="tk"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

#------------------------- patch ---------------------------#
#---------Edit below as per requirement-------
export APP=patch
export PAR=" -j8 -v  "
export DEPS=" "
export LOGFILE="patch"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

#------------------------- netcdf-cxx ---------------------------#
#---------Edit below as per requirement-------
export APP=netcdf-cxx
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="netcdf-cxx"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------













