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
echo "                     OpenMPI Compiler                         "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################
# You need to do following setup to make the OpenMPI slurm aware
# $ which sinfo  # get slurm path
# /usr/bin/sinfo
# $ sinfo -V     # get slrum version
# slurm 20.11.9

# Then edit the file as follows
# vi ~/.spack/packages.yaml
# packages:
#  slurm:
#    paths:
#      slurm@20.11.9: /usr/bin/
#    buildable: False

#------------------------- openmpi ---------------------------#
#---------Edit below as per requirement-------
export APP=openmpi
export PAR=" -j8 -v "
export DEPS=" +pmi schedulers=slurm "
export LOGFILE="openmpi"
source $SOURCEDIR/scripts/run.sh 
#-----------------------------------------------------------------------

















