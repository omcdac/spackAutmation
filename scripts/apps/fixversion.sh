#!/bin/bash

#------------------------- paraview ---------------------------#
#---------Edit below as per requirement-------
export COMPILER=gcc@10.3.0
export APP=paraview
export PAR=" -v -j8 "
export DEPS=" ^mesa%gcc@10.3.0 +hdf5 +ipo +python3 +qt"
export LOGFILE="paraview"
source $SOURCEDIR/scripts/run.sh
#-----------------------------------------------------------------------

#------------------------- visit ---------------------------#
#---------Edit below as per requirement-------
export COMPILER=gcc@10.3.0
export APP=visit
export PAR=" -v -j8 "
export DEPS=" ^mesa%gcc@10.3.0"
export LOGFILE="visit"
source $SOURCEDIR/scripts/run.sh
#----------------------------------------------------------------------
