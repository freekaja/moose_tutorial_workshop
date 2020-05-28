# 06 Modules

MOOSE contains a variety of preexists module which contains different physics. We will explore some of these modules in each of the following:


  * Heat Conduction
  * Navier Stokes
  * Tensor Mechanics
  *


## Compiling modules

All the pre-exiting MOOSE modules is host inside `MOOSE_DIR/moose/modules/*` and the source files are contain within their separate directory. This means that we must call the different executable inside each modules if we are using any of it. Later we will show a example using `combined` module to call all the modules together. 
