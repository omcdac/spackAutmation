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
echo "    Weather and Atmospheric Science Applications with $COMPILER Compiler "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################

#------------------------- wrf ---------------------------#
#---------Edit below as per requirement-------
export UserCompiler=$COMPILER
export COMPILER=gcc@12.2.0
dir=$SOURCEDIR/logs/$COMPILER
[ ! -d "$dir" ] && mkdir -p "$dir"
#--------------------------------- ## The above code is required !
export APP=wrf@4.3.3
export PAR=" -v -j8 "
export DEPS=" ~chem+pnetcdf build_type=dm+sm compile_type=em_real ^bison@3.8.2%$COMPILER ^python@3.8.12 ^openmpi ^netcdf-fortran@4.5.4 ^intel-oneapi-mkl%$COMPILER ^git "
export LOGFILE="wrf"
source $SOURCEDIR/scripts/run.sh 
export COMPILER=$UserCompiler    ## Set the compiler again to the user compiler 
#-----------------------------------------------------------------------

#------------------------- roms ---------------------------#
#---------Edit below as per requirement-------
export APP=roms
export PAR=" -v -j8 "
export DEPS=" "
export LOGFILE="roms"
source $SOURCEDIR/scripts/run.sh        
#-----------------------------------------------------------------------

#------------------------- regcm ---------------------------#
#---------Edit below as per requirement-------
export APP=regcm
export PAR=" -v -j8 "
export DEPS=" "
export LOGFILE="regcm"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------















