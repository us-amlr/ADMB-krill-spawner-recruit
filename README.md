# ADMB-krill-spawner-recruit
ADMB and R code used in Kinzey et al., 2019

The 'models' directory in this repository contains the AD Model Builder (ADMB) code (krill.tpl) and data (krill.dat) for two sets of 4 assessment models for Antarctic krill (_Euphausia superba_) in the Commission for the Conservation of Antarctic Marine Living Resources (CCAMLR) Subarea 48.1. These models were described and compared in Kinzey et al., 2019 (see 'KinzeyWattersReiss_2019.pdf' in the main directory of this repository). 'Models/best' contains the code for the best-fitted models (all of which converged to the same 'no stock-recruitment relationship' model). 'Models/forced' contains the code for the models forced to represent either Beverton-Holt, two alternative forms of the Ricker function, or no stock-recruitment relationship assumptions.

The 'krill.tpl' file in the 'models' directory was pre-compiled in ADMB version 11.1 in the original paper. It was recompiled using ADMB version 12.3 to produce the 'krill.rep' files reported in this repository. 'Krill.rep' files contain model outputs in R-readable script. Small differences in the model outputs in the repository from the original paper may be due to differences in the ADMB version, or in the MinGW compilers used. Additional output files to 'krill.rep' are 'krill.par' (all parameter estimates) and 'krill.std' (standard deviations of parameter estimates). 

Three input files are required to run a model: 'krill.dat', 'krill.pin', and 'krill.exe'. The 'krill.exe' executable can be produced by compiling the 'krill.tpl' code. The 'krill.pin' files contain the starting values for parameter estimation. These 'krill.pin' files are identical except for different values for pre-specified steepness. To reproduce or change a model, place the desired input files in the same directory of a local computer with ADMB and MinGW installed and run using the command 'krill -ind krill.dat'. The 'mcmc.bat' example file runs 2000 MCMC samples, saving every 20th. Millions of MCMC samples should be saved for statistically valid results.

The 'Fig...' directories contain the R scripts that produced the corresponding figures from Kinzey et al., 2019. These scripts read the 'krill.rep' files for each model and plot results. To reproduce these figures, download the 'models' directory and the R scriptsin the 'Fig...' directories to a local directory. Use setwd() to identify the location of the 'models' directory before running the R scripts.

Figures 3 and 4 in Kinzey et al., 2019 represent over 100 model runs with different pre-specified values of steepness and recruitment variability and are not reproduced here.
