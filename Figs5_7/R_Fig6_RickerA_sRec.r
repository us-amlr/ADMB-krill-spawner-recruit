# setwd()
if(!dir.exists('Figs5_7')){
  dir.create('Figs5_7')
  }
path.in <- getwd()
path.out <- paste(getwd(),'/Figs5_7/',sep='')

cfg.dirs <- c(
              '/models/best/Ricker(a)/',
              '/models/forced/Ricker(a)/'
              )
plt.titles <- c(
                'Fig6_Ricker(a)_best_',
                'Fig6_Ricker(a)_forced_'
               )	     
par.a <- par.b <- vector()
sp.sim <- list()
sp.sim[[1]] <- seq(1,1.5e+7,by=4e+4) # max(Sp_Biom[[1]][1:46])
sp.sim[[2]] <- seq(1,1e+10,by=4e+6)

for(i.cfg in 1: length(cfg.dirs)){
  source(paste(path.in,cfg.dirs[i.cfg],'krill.rep',sep=''))
  par.a[i.cfg] <- alpha
  par.b[i.cfg] <- beta

 # MODEL & PREDICTED RECRUITS
 plt.nm <- paste(path.out,plt.titles[i.cfg],'_fit.pdf',sep='')
  pdf(file = plt.nm,width=10,height=10)
  par(cex=2)
  recs.sim <- sp.sim[[i.cfg]] * exp(alpha[[1]] - sp.sim[[i.cfg]] * beta[[1]]) #RickerA
  plot(sp.sim[[i.cfg]],recs.sim,
       type='l',lwd=3,ylab = 'model recruits X 1000',
       if(i.cfg==1) {
         ylim=c(0,2.0e+10)
         xlim=c(0,1.5e+07)
         },
       xlab = 'spawning biomass (tonnes)',
       main=paste(plt.titles[i.cfg],'sigmar_',round(exp(log_sigmar),digits=2),
            '/n','(-LL =',round(obj_val,digits=0),')')
       )
  points(Sp_Biom[[1]][11:46],exp(mean_log_rec+rec_dev[,11:46]),pch=19)  # starts in 1982, not styr_rec
  dev.off()

}

par.a
par.b


