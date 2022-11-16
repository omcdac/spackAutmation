#!/bin/bash
#------------ Author : Om Jadhav ------------------------------------------

#------------------ Section -1 : Initial setup -----------------------------
# You need to edit thsese two lines as per cluster 
export SOURCEDIR=/home/om/SPACK/AppSetup
export SPACKBASEDIR=/home/om/SPACK

## Start 
echo "_______________________________________________" |& tee -a $SOURCEDIR/logs/checklist.log
echo "***********************************************" |& tee -a $SOURCEDIR/logs/checklist.log
echo "Welcome to the world of HPC Applications!      " |& tee -a $SOURCEDIR/logs/checklist.log    
echo "_______________________________________________" |& tee -a $SOURCEDIR/logs/checklist.log

#------------------ Section -2 : Spack Installation & setup -----------------
#-----------------! One Time Process !----------------------
#source $SOURCEDIR/scripts/spack-install.sh
#--------- Comment above section when done -----------------

source $SPACKBASEDIR/spack/share/spack/setup-env.sh
echo ""
echo "-----------------------------------------------" 
echo "          Spack setup Done                     " 
echo "-----------------------------------------------" 
echo ""

#------------------ Section -3 : Installation of compilers -------------------
# %%% Installations of GCC compilers %%%
#spack compilers
#spack compiler find
#BaseCompiler=`spack compilers | grep gcc | tail -n1`
#export COMPILER=$BaseCompiler   # first compilers has to be configured with system compilers
#echo "Basic System compiler founde : $COMPILER"
#source $SOURCEDIR/scripts/compilers/gcc.sh

# %%% Installations of other compilers %%%
#echo ""
#export COMPILER=gcc@11.2.0   # This should should be enable for next two scripts 
#source $SOURCEDIR/scripts/compilers/openmpi.sh
#source $SOURCEDIR/scripts/compilers/intel.sh
#source $SOURCEDIR/scripts/compilers/cuda.sh

#------------------ Section -4 : Installation of Applications ----------------
#export COMPILER=intel
export COMPILER=oneapi@2022.1.0
#export COMPILER=gcc@11.2.0
#---------------------------------------------------
#source $SOURCEDIR/scripts/apps/lib.sh # 4
#source $SOURCEDIR/scripts/apps/md.sh # 3
#source $SOURCEDIR/scripts/apps/bio.sh # 4
#source $SOURCEDIR/scripts/apps/cfd.sh # 2
#source $SOURCEDIR/scripts/apps/ms.sh # 4
#source $SOURCEDIR/scripts/apps/weather.sh # 3
#source $SOURCEDIR/scripts/apps/others.sh # 5
#source $SOURCEDIR/scripts/apps/visualization.sh # 4

#source $SOURCEDIR/scripts/apps/fixversion.sh  # 2   # This script should run at last always !
#---------------------------------------------------

#------------------ Section -5 : Check the application status and report generation ----------------
#export COMP=%intel
#export COMP=%oneapi@2022.1.0
#export COMP=%gcc@11.2.0
unset COMP     # uncomment this if you want to check with all compilers
source $SOURCEDIR/scripts/check.sh $COMP
#---------------------- Done --------------------------------




