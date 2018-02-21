postscript("HV.Boxplot.eps", horizontal=FALSE, onefile=FALSE, height=8, width=12, pointsize=10)
resultDirectory<-"../data"
qIndicator <- function(indicator, problem)
{
fileNSGAIIWithSwapMutation<-paste(resultDirectory, "NSGAIIWithSwapMutation", sep="/")
fileNSGAIIWithSwapMutation<-paste(fileNSGAIIWithSwapMutation, problem, sep="/")
fileNSGAIIWithSwapMutation<-paste(fileNSGAIIWithSwapMutation, indicator, sep="/")
NSGAIIWithSwapMutation<-scan(fileNSGAIIWithSwapMutation)

algs<-c("NSGAIIWithSwapMutation")
boxplot(NSGAIIWithSwapMutation,names=algs, notch = FALSE)
titulo <-paste(indicator, problem, sep=":")
title(main=titulo)
}
par(mfrow=c(3,3))
indicator<-"HV"
qIndicator(indicator, "DietProblemTrapezoid")
qIndicator(indicator, "DietProblemGaussian")
