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
echo "    Material Science Applications with $COMPILER Compiler "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################

#------------------------- quantum-espresso ---------------------------#
#---------Edit below as per requirement-------
spack load git
export APP=quantum-espresso
export PAR=" "
export DEPS=" ^bison@3.8.2%$COMPILER ^openmpi ^git@2.37.0  "
export LOGFILE="quantum-espresso"
source $SOURCEDIR/scripts/run.sh 
#-----------------------------------------------------------------------

#------------------------- cp2k ---------------------------#
#---------Edit below as per requirement -------
# Need to edit the cp2k recipe. Please refer : https://github.com/spack/spack/issues/29661
export APP=cp2k
export PAR=" -v "
export DEPS=" smm=blas ^fftw+openmp ^openblas threads=openmp ^openmpi " # GCC
#export DEPS=" ^intel-mkl@2020.4.304 ^openmpi@4.1.1 " # Intel
export LOGFILE="cp2k"
source $SOURCEDIR/scripts/run.sh        
#-----------------------------------------------------------------------

#------------------------- nwchem ---------------------------#
#---------Edit below as per requirement-------
export APP=nwchem
export PAR=" "
export DEPS=" "
export LOGFILE="nwchem"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

#------------------------- abinit ---------------------------#
#---------Edit below as per requirement-------
export APP=abinit@8.10.3
export PAR=" --no-checksum "
export DEPS=" +install-tests+mpi+openmp+scalapack optimization-flavor=standard "
export LOGFILE="abinit"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

#------------------------- siesta ---------------------------#
#---------Edit below as per requirement-------
export APP=siesta
export PAR=" -j8 "
export DEPS=" ^openmpi@4.1.3 /646knqu "
export LOGFILE="siesta"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

#------------------------- mumax ---------------------------#
#---------Edit below as per requirement-------
export APP=mumax
export PAR=""
export DEPS=" "
export LOGFILE="mumax"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------









