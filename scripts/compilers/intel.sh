#!/bin/bash

#export pattern="No package matches the query"

#--------------- Check if directory exist or not and create it if not ----------
dir=$SOURCEDIR/logs/$COMPILER
[ ! -d "$dir" ] && mkdir -p "$dir"
#-------------------------------------------------------------------------------

################################# Domain #########################
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "                     Intel Compiler                         "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################

# Initially it requires for base compiler setp
#export COMPILER=gcc@11.2.0

#------------------------- intel-oneapi-compilers ---------------------------#
#---------Edit below as per requirement-------
export APP=intel-oneapi-compilers
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="intel-oneapi-compilers"
source $SOURCEDIR/scripts/run.sh 
#-----------------------------------------------------------------------
#------------ Compiler Setup ----------------------
echo "Setting compilers ....."
spack load intel-oneapi-compilers
spack compilers
spack compiler find
echo "Intel compiler setup done !"

#------------------------------------------------------

## Now everything will be installed with intel base compiler
export USERCompiler=$COMPILER ## Save the user provided compiler !

export COMPILER=intel

dir=$SOURCEDIR/logs/$COMPILER
[ ! -d "$dir" ] && mkdir -p "$dir"
#------------------------- intel-oneapi-mpi ---------------------------#
#---------Edit below as per requirement-------
export APP=intel-oneapi-mpi
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="intel-oneapi-mpi"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

#------------------------- intel-oneapi-mkl ---------------------------#
#---------Edit below as per requirement-------
export APP=intel-oneapi-mkl
export PAR=" -j8 -v "
export DEPS=" "
export LOGFILE="intel-oneapi-mkl"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

export COMPILER=$USERCompiler   ## set back user provided compiler from main script















