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
echo "    Molecular Dynamics Applications with $COMPILER Compiler "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "      Date:   `date`                                      "  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo "=========================================================="  |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log
echo ""                                                            |& tee -a $SOURCEDIR/logs/$COMPILER/apps.log

################################# Applications #########################

#------------------------- gromacs ---------------------------#
#---------Edit below as per requirement-------
export APP=gromacs
export PAR=" -v -j 8"
export DEPS=""
export LOGFILE="gromacs"
source $SOURCEDIR/scripts/run.sh 
#-----------------------------------------------------------------------

#------------------------- gromacs + cuda ---------------------------#
#---------Edit below as per requirement-------
export APP=gromacs
export PAR=" -v -j 8"
export DEPS=" +cuda"
export LOGFILE="gromacs+cuda"
source $SOURCEDIR/scripts/run.sh        
#-----------------------------------------------------------------------

#------------------------- gromacs + plumed---------------------------#
#---------Edit below as per requirement-------
export APP=gromacs@2020.4
export PAR=" -v -j 8"
export DEPS=" ^plumed "
export LOGFILE="gromacs+plumed"
source $SOURCEDIR/scripts/run.sh

#------------------------- lammps ---------------------------#
#---------Edit below as per requirement-------
export APP=lammps
export PAR=" -v -j 8"
export DEPS=""
export LOGFILE="lammps"
source $SOURCEDIR/scripts/run.sh
#---------------------------------------------

#------------------------- lammps + plumed ---------------------------#
#---------Edit below as per requirement-------
export APP=lammps
export PAR=" -v -j 8"
export DEPS=" ^plumed "
export LOGFILE="lammps+plumed"
source $SOURCEDIR/scripts/run.sh
#---------------------------------------------

#------------------------- namd ---------------------------#
#---------Edit below as per requirement-------
export APP=namd@2.13
export PAR=" -v -j 8"
export DEPS=""
export LOGFILE="namd@2.13"
### manual download required 
cd $SOURCEDIR/archives 
#wget --no-check-certificate https://www.ks.uiuc.edu/Research/namd/2.13/download/412487/NAMD_2.13_Source.tar.gz 
source $SOURCEDIR/scripts/run.sh
cd -
#---------------------------------------------

#------------------------- namd + cuda---------------------------#
#---------Edit below as per requirement-------
export APP=namd@2.13
export PAR=" -v -j 8"
export DEPS=" +cuda "
export LOGFILE="namd@2.13+cuda"
### manual download required
cd $SOURCEDIR/archives
#wget --no-check-certificate https://www.ks.uiuc.edu/Research/namd/2.13/download/412487/NAMD_2.13_Source.tar.gz
source $SOURCEDIR/scripts/run.sh
cd -
#---------------------------------------------
















