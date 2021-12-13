krill -ind krill.dat -nox -mcmc 2000 -mcsave 20 -nosdmcmc >> out1.txt
krill -ind krill.dat -mceval >> out2.txt

DEL out1.txt /S
DEL out2.txt /S
