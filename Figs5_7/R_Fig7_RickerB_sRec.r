# setwd()
path.in <- getwd()
path.out <- paste(path.in,'/Figs5_7/',sep='')
cfg.dirs <- c(
              "/models/best/Ricker(b)/",
              "/models/forced/Ricker(b)/"
              )
plt.titles <- c(
                "Fig7_Ricker(b)_best_",
                "Fig7_Ricker(b)_forced_"
               )	     
par.a <- par.b <- vector()
sp.sim <- list()
sp.sim[[1]] <- seq(1,1.5e+7,by=4e+4) # max(Sp_Biom[[1]][1:46])
sp.sim[[2]] <- seq(1,8e+7,by=4e+5)

# for(i.cfg in 1: length(cfg.dirs)){
for(i.cfg in 1: length(cfg.dirs)){
  source(paste(path.in,cfg.dirs[i.cfg],"krill.rep",sep=""))
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


