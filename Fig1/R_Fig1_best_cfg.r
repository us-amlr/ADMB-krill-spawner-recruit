
# setwd("C:/zot/ADMB_github/dec10")
library(Hmisc)

if(!dir.exists('Fig1')){
  dir.create('Fig1')
  }
path.name <- getwd()
path.out <- getwd()

yrs.sp <- c(1966:2036)
yrs.rec <- c(1967:2036)
config.dir <-c(
	       "/models/Fig1/Beverton_Holt/",
               "/models/Fig1/Ricker(a)/",
               "/models/Fig1/Ricker(b)/", 
	       "/models/Fig1/no stock-recruit function/"
               )
config.nms <- c("Beverton_Holt","Ricker(a)","Ricker(b)","no stock-recruit function")	      
id.cols <- c(1:6)
nareas <- 1   # 4 for disaggregated, 1 for aggregated
Sp.Biom.mods <- array(dim=c(length(config.dir),length(yrs.sp)))
rec.mods <- array(dim=c(length(config.dir),length(yrs.rec)))
pred.mods <- array(dim=c(length(config.dir),length(yrs.rec)))
F.age <- list()
q.fsh <- vector()
catch.vector <- vector()
for(i.conf in 1:length(config.dir)){
     full.path <- paste(path.name,config.dir[i.conf],sep="")
     source(file=paste(full.path,"krill.rep",sep=""))
     Sp.Biom.mods[i.conf,] <- Sp_Biom[[1]][match(1966:2036,styr_sp:endyr)]
     rec.mods[i.conf,] <- mod_rec[[1]][match(1967:2036,styr_rec:endyr)]
     pred.mods[i.conf,] <- pred_rec[[1]][match(1967:2036,styr_rec:endyr)]
     #catch.vector[i.conf] = c.gamma * Btot
     F.age[[i.conf]] <- F[[1]]
     q.fsh[i.conf] <- q_fsh
     }

Sp.Biom.mods <- Sp.Biom.mods[,1:50]
yrs.dat<-yrs.sp[1:(length(yrs.sp)-21)]
plt.name <- paste(path.out,"/Fig1/PLOT_Fig1_Sp_Biom.pdf",sep="")
pdf(file = plt.name,width=7,height=7)
par(mfrow=c(1,1),cex=1.2,oma=c(2,2,2,0))
y.lim=c(min(log(Sp.Biom.mods),na.rm=T),max(log(Sp.Biom.mods)+1,na.rm=T))
plot(yrs.dat,log(Sp.Biom.mods[1,]),type="l",
     ylim=y.lim,lwd=2,
     ylab="Spawning biomass (log tonnes)",xlab="Year",
     main = "Spawning biomass")
minor.tick(nx=5)
#abline(v=c(end_datyrs),col="gray",lty=2,lwd=4)
for(i.conf in 2:length(config.dir)){
  lines(yrs.dat,log(Sp.Biom.mods[i.conf,]),lty=i.conf,lwd=2)
  }
legend(1966,17.8,cex=0.7,
       c(config.nms),
       lty=c(1:4),lwd=2
       ) 
dev.off()

rec.mods <- rec.mods[,1:50]
yrs.dat <- yrs.rec[1:(length(yrs.rec)-20)]
plt.name <- paste(path.out,"/Fig1/PLOT_Fig1_mod_rec.pdf",sep="")
pdf(file = plt.name,width=7,height=7)
par(mfrow=c(1,1),cex=1.2,oma=c(2,2,2,0))
y.lim=c(min(log(rec.mods) ,na.rm=T),max(log(rec.mods)+1 ,na.rm=T))
plot(yrs.dat,log(rec.mods[1,]),type="l",
     ylim=y.lim,lwd=3,
     ylab="Recruits (log (N x 1e+3))",xlab="Year",
     main = "Recruits")
minor.tick(nx=5)
#abline(v=c(end_datyrs),col="gray",lty=2,lwd=4)
for(i.conf in 2:length(config.dir)){
  lines(yrs.dat,log(rec.mods[i.conf,]),lty=i.conf,lwd=2)
  }
legend(1966,22.4,cex=0.7,
       c(config.nms),
       lty=c(1:4),lwd=2
       )
 dev.off()

# scatterplots

plt.name <- paste(path.out,"/Fig1/PLOT_Fig1_scatter.pdf",sep="")
pdf(file = plt.name,width=7,height=7)
par(mfrow=c(1,1),cex=1.2,oma=c(2,2,2,0))

plot(log(Sp.Biom.mods[1,]),log(rec.mods[1,]),pch=19,
     lwd=3,
     ylab="Recruits (log (N x 1e+3))",xlab="Spawning biomass (tonnes)",
     main = "")
 dev.off()

