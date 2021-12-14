# ADMB-krill-spawner-recruit
ADMB and R code used in Kinzey et al., 2019

The 'models' directory in this repository contains the AD Model Builder (ADMB) code (krill.tpl) and data (krill.dat) for 4 assessment models for Antarctic krill (_Euphausia superba_) in CCAMLR Subarea 48.1. These models were described and compared in Kinzey et al., 2019 ('KinzeyWattersReiss_2019.pdf' in the main directory). 'Models/best' contains the code for the best-fitted models (all converged to the same 'no stock recruitment relationship' model). 'Models/forced' contains the code for the models forced to represent either Beverton-Holt, two alternative forms of the Ricker function, or no relationship assumptions.

The 'krill.tpl' files were pre-compiled in ADMB version 11.1 for the original paper. These were recompiled using ADMB version 12.3 to produce the R-readable model outputs ('krill.rep' files) reported in this repository.  Small differences in the model outputs in the repository from the original paper may be due to differences in the ADMB version, or in the MinGW compilers used. Additional output files to 'krill.rep' are 'krill.par' (all parameter estimates) and 'krill.std' (standard deviations of parameter estimates). 

Model input files are the 'krill.exe' executable produced by compiling the 'krill.tpl' code and 'krill.pin', the starting values for parameter estimation. The 'krill.pin' files are identical except for different values for pre-specified steepness. To reproduce a model, place the desired 'krill.dat', 'krill.pin', and 'krill.exe' in the same directory and run using the command 'krill -ind krill.dat'.

The 'Fig...' directories contain the R scripts that produced the corresponding pdfs from Kinzey et al., 2019. These scripts read the 'krill.rep' files for each model and plot results. To reproduce these Figures, download the 'models' directory and the R scripts to a local directory. Use setwd() to identify the location of the 'models' directory before running the R scripts.

Figures 3 and 4 in Kinzey et al., 2019 represent over 100 model runs with different pre-specified values of steepness and recruitment variability and are not reproduced here.
