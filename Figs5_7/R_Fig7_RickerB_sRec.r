# modified from oct4, in turn from "jul5_R_krill.txt"
# best and "pure" Ricker

# phizero(iarea)        = Bzero(iarea)/Rzero(iarea);
# RecTmp = elem_prod((Stmp / phizero(i_area)) , mfexp( alpha(i_area) *
# ( 1. - Stmp / Bzero(i_area) ))) ;
# //Ricker form from Dorn (RickerB)

rm(list=ls())

path.nm <- "C:/zot/ADMB_github/dec10/"
path.out <- "C:/zot/ADMB_github/dec10/Figs5_6/"
cfg.dirs <- c(
              "models/Fig1/Ricker(b)/",
              "models/Fig2/Ricker(b)/"
              )
plt.titles <- c(
                "Ricker(b)_best_",
                "Ricker(b)_forced_"
               )	     
par.a <- par.b <- vector()
sp.sim <- list()
sp.sim[[1]] <- seq(1,1.5e+7,by=4e+4) # max(Sp_Biom[[1]][1:46])
sp.sim[[2]] <- seq(1,8e+7,by=4e+5)

# for(i.cfg in 1: length(cfg.dirs)){
for(i.cfg in 1: length(cfg.dirs)){
  source(paste(path.nm,cfg.dirs[i.cfg],"krill.rep",sep=""))
  par.a[i.cfg] <- alpha
  par.b[i.cfg] <- beta

 # MODEL & PREDICTED RECRUITS
 plt.nm <- paste(path.out,plt.titles[i.cfg],"_fit.pdf",sep="")
  pdf(file = plt.nm,width=10,height=10)
  par(cex=2)
  recs.sim <- sp.sim[[i.cfg]]/(Bzero/exp(log_Rzero)) *
              exp(alpha[[1]]*(1 - sp.sim[[i.cfg]]/Bzero)) #RickerB
  plot(sp.sim[[i.cfg]],recs.sim,
       ylim=c(0,max(exp(mean_log_rec+rec_dev[,11:46]))),
       type="l",lwd=3,ylab = "model recruits X 1000",
       xlab = "spawning biomass (tonnes)",
       main=paste(plt.titles[i.cfg],"_sigmar_",round(exp(log_sigmar),digits=2),
            "/n","(-LL =",round(obj_val,digits=0),")")
       )
  points(Sp_Biom[[1]][11:46],exp(mean_log_rec+rec_dev[,11:46]),pch=19)  # starts in 1982, not styr_rec
  dev.off()

}

par.a
par.b


