
# 02 Installation

#### Machine Requirements:

GNU/Linux/MacOS Requirements:
  * GCC/Clang C++11 compiler (GCC > 4.8.4, or Clang > 3.5.1)
  * Memory (> 8 GB)
  * Processor (64bit x86)
  * Disk (> 30GB)

#### Setup:

We first need to install Miniconda:

Linux:

    curl -L -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh bash Miniconda3 latest-Linux-x86_64.sh -b -p ~/miniconda3

MacOS:

    curl -L -O https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh bash Miniconda3-latest-MacOSX-x86_64.sh -b -p ~/miniconda3


Append the following line to the PATH parameters:

    export PATH=$HOME/miniconda3/bin:$PATH


Add the MOOSE library channel to Miniconda:

    conda config --add channels conda-forge
    conda config --add channels https://mooseframework.org/conda/moose


Let create a isolate environment which contains all MOOSE configs, and activate it

    conda create --name moose moose-libmesh moose-tools
    conda activate moose


#### Installation:

MOOSE can be installed on both personal machines and HPC.

To start, let clone MOOSE from Github by making a directory named `projects` and put MOOSE inside it

    mkdir ~/projects
    cd ~/projects
    git clone https://github.com/idaholab/moose.git
    cd moose
    git checkout master

After that, we need to also clone other requirements such as libmesh and PETSc. This all can be done with a bash script inside moose folder.

    ./script/update_and_rebuild_libmesh.sh


Afterward, we can compile and test MOOSE

    cd ~/projects/moose/test
    make -j 4
    ./run_tests -j 4
