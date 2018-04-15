postscript("HV.Boxplot.eps", horizontal=FALSE, onefile=FALSE, height=8, width=12, pointsize=10)
resultDirectory<-"../data"
qIndicator <- function(indicator, problem)
{
fileNSGAIIWithGenerationCount2500<-paste(resultDirectory, "NSGAIIWithGenerationCount2500", sep="/")
fileNSGAIIWithGenerationCount2500<-paste(fileNSGAIIWithGenerationCount2500, problem, sep="/")
fileNSGAIIWithGenerationCount2500<-paste(fileNSGAIIWithGenerationCount2500, indicator, sep="/")
NSGAIIWithGenerationCount2500<-scan(fileNSGAIIWithGenerationCount2500)

fileNSGAIIWithGenerationCount5000<-paste(resultDirectory, "NSGAIIWithGenerationCount5000", sep="/")
fileNSGAIIWithGenerationCount5000<-paste(fileNSGAIIWithGenerationCount5000, problem, sep="/")
fileNSGAIIWithGenerationCount5000<-paste(fileNSGAIIWithGenerationCount5000, indicator, sep="/")
NSGAIIWithGenerationCount5000<-scan(fileNSGAIIWithGenerationCount5000)

fileNSGAIIWithGenerationCount10000<-paste(resultDirectory, "NSGAIIWithGenerationCount10000", sep="/")
fileNSGAIIWithGenerationCount10000<-paste(fileNSGAIIWithGenerationCount10000, problem, sep="/")
fileNSGAIIWithGenerationCount10000<-paste(fileNSGAIIWithGenerationCount10000, indicator, sep="/")
NSGAIIWithGenerationCount10000<-scan(fileNSGAIIWithGenerationCount10000)

fileNSGAIIWithGenerationCount15000<-paste(resultDirectory, "NSGAIIWithGenerationCount15000", sep="/")
fileNSGAIIWithGenerationCount15000<-paste(fileNSGAIIWithGenerationCount15000, problem, sep="/")
fileNSGAIIWithGenerationCount15000<-paste(fileNSGAIIWithGenerationCount15000, indicator, sep="/")
NSGAIIWithGenerationCount15000<-scan(fileNSGAIIWithGenerationCount15000)

algs<-c("NSGAIIWithGenerationCount2500","NSGAIIWithGenerationCount5000","NSGAIIWithGenerationCount10000","NSGAIIWithGenerationCount15000")
boxplot(NSGAIIWithGenerationCount2500,NSGAIIWithGenerationCount5000,NSGAIIWithGenerationCount10000,NSGAIIWithGenerationCount15000,names=algs, notch = FALSE)
titulo <-paste(indicator, problem, sep=":")
title(main=titulo)
}
par(mfrow=c(3,3))
indicator<-"HV"
qIndicator(indicator, "DietProblem")
