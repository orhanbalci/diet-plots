postscript("HV.Boxplot.eps", horizontal=FALSE, onefile=FALSE, height=8, width=12, pointsize=10)
resultDirectory<-"../data"
qIndicator <- function(indicator, problem)
{
fileNSGAIIWithSwapMutationProbabilityNumVariables<-paste(resultDirectory, "NSGAIIWithSwapMutationProbabilityNumVariables", sep="/")
fileNSGAIIWithSwapMutationProbabilityNumVariables<-paste(fileNSGAIIWithSwapMutationProbabilityNumVariables, problem, sep="/")
fileNSGAIIWithSwapMutationProbabilityNumVariables<-paste(fileNSGAIIWithSwapMutationProbabilityNumVariables, indicator, sep="/")
NSGAIIWithSwapMutationProbabilityNumVariables<-scan(fileNSGAIIWithSwapMutationProbabilityNumVariables)

fileNSGAIIWithSwapMutationProbability02<-paste(resultDirectory, "NSGAIIWithSwapMutationProbability02", sep="/")
fileNSGAIIWithSwapMutationProbability02<-paste(fileNSGAIIWithSwapMutationProbability02, problem, sep="/")
fileNSGAIIWithSwapMutationProbability02<-paste(fileNSGAIIWithSwapMutationProbability02, indicator, sep="/")
NSGAIIWithSwapMutationProbability02<-scan(fileNSGAIIWithSwapMutationProbability02)

fileNSGAIIWithSwapMutationProbability04<-paste(resultDirectory, "NSGAIIWithSwapMutationProbability04", sep="/")
fileNSGAIIWithSwapMutationProbability04<-paste(fileNSGAIIWithSwapMutationProbability04, problem, sep="/")
fileNSGAIIWithSwapMutationProbability04<-paste(fileNSGAIIWithSwapMutationProbability04, indicator, sep="/")
NSGAIIWithSwapMutationProbability04<-scan(fileNSGAIIWithSwapMutationProbability04)

fileNSGAIIWithSwapMutationProbability06<-paste(resultDirectory, "NSGAIIWithSwapMutationProbability06", sep="/")
fileNSGAIIWithSwapMutationProbability06<-paste(fileNSGAIIWithSwapMutationProbability06, problem, sep="/")
fileNSGAIIWithSwapMutationProbability06<-paste(fileNSGAIIWithSwapMutationProbability06, indicator, sep="/")
NSGAIIWithSwapMutationProbability06<-scan(fileNSGAIIWithSwapMutationProbability06)

fileNSGAIIWithSwapMutationProbability08<-paste(resultDirectory, "NSGAIIWithSwapMutationProbability08", sep="/")
fileNSGAIIWithSwapMutationProbability08<-paste(fileNSGAIIWithSwapMutationProbability08, problem, sep="/")
fileNSGAIIWithSwapMutationProbability08<-paste(fileNSGAIIWithSwapMutationProbability08, indicator, sep="/")
NSGAIIWithSwapMutationProbability08<-scan(fileNSGAIIWithSwapMutationProbability08)

algs<-c("NSGAIIWithSwapMutationProbabilityNumVariables","NSGAIIWithSwapMutationProbability02","NSGAIIWithSwapMutationProbability04","NSGAIIWithSwapMutationProbability06","NSGAIIWithSwapMutationProbability08")
boxplot(NSGAIIWithSwapMutationProbabilityNumVariables,NSGAIIWithSwapMutationProbability02,NSGAIIWithSwapMutationProbability04,NSGAIIWithSwapMutationProbability06,NSGAIIWithSwapMutationProbability08,names=algs, notch = FALSE)
titulo <-paste(indicator, problem, sep=":")
title(main=titulo)
}
par(mfrow=c(3,3))
indicator<-"HV"
qIndicator(indicator, "DietProblem")
