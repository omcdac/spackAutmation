# spackAutomate

### How to execute the script ?

once the initial setup on the respective cluster is completed, fire the following command

source ./setup.sh


## Structure of the setup.sh script

The script contains following sections 

### Section -1 : Initial Setup

You need to edit following environment variables as per your requirement in the [setup.sh](http://setup.sh) script

```bash
export SOURCEDIR=<path to the automation package e.g /home/om/SPACK/AppSetup >
export SPACKBASEDIR=<path of the spack basedir e.g /home/om/SPACK>
```

### Section -2 : spack Installation & setup

This is one time process on any cluster. The spack will get install in the specified SPACKBASEDIR set by the user. You need to uncomment the following line of code 

```bash
source $SOURCEDIR/scripts/spack-install.sh
```

### Section -3 : Installation of compilers

This section, firstly will try to detect the native system compilers, packages and will add in the spack.

then with the native compiler, it will install following compilers on the system

 

```bash
gcc@11.2.0
gcc@10.3.0
gcc ## this will install the latest gcc compiler available in the spack
```

Along with above base compilers, this section will also install following compilers

```bash
OpenMPI - openmpi (latest)
Intel - intel-oneapi-compilers, intel-oneapi-mpi, intel-oneapi-mkl, 
CUDA - cuda, nvhpc
```

Note : User can add more compiler packages, also he can comment/uncomment respective lines of codes as per requirement. 

 

### Section -4 : Installation of Applications

This section contains two sub-section, one for setting compiler option and other for application installations. User can set the respective compiler option (by uncommenting) with which he wants to install the applications. e.g

```bash
#export COMPILER=intel
export COMPILER=oneapi@2022.1.0
#export COMPILER=gcc@11.2.0
```

The applications has been categorized as per the domains. User can call the respective domain script to install the list of applications which falls into that category. user can call the script as follows, by uncommenting the respective line of the domain.

```bash
#source $SOURCEDIR/scripts/apps/lib.sh # 4
#source $SOURCEDIR/scripts/apps/md.sh # 3
#source $SOURCEDIR/scripts/apps/bio.sh # 4
#source $SOURCEDIR/scripts/apps/cfd.sh # 2
#source $SOURCEDIR/scripts/apps/ms.sh # 4
#source $SOURCEDIR/scripts/apps/weather.sh # 3
#source $SOURCEDIR/scripts/apps/others.sh # 5
#source $SOURCEDIR/scripts/apps/visualization.sh
```

### Section -5 : Check the application status and generate the report

This is one of the important section, by which user can check the status of installed applications, whether the stated applications with respective compilers has been installed successfully or not. This script will also generate short summary report of the applications installation status. The user can check the status by setting proper compilers and calling the script as follows

```bash
#export COMP=%intel
#export COMP=%oneapi@2022.1.0
#export COMP=%gcc@11.2.0
unset COMP     # uncomment this if you want to check with all compilers
source $SOURCEDIR/scripts/check.sh $COMP
```
