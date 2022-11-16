#!/bin/bash
#------------ Author : Om Jadhav ------------------------------------------
############ Spack Environment Setup #########################
#-----------------! One Time Process !----------------------
echo "The Spack download and setup will start soon, Please wait !"
sleep 5
echo ""
echo "Started !"
echo ""
cd $SPACKBASEDIR
git clone -c feature.manyFiles=true https://github.com/spack/spack.git
cd spack
#git checkout releases
# Adding system packages to the spack
source $SPACKBASEDIR/spack/share/spack/setup-env.sh
spack external find 
spack external find slurm
#--------------------------------
cd $SOURCEDIR

