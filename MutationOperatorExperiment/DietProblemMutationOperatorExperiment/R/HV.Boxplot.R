postscript("HV.Boxplot.eps", horizontal=FALSE, onefile=FALSE, height=8, width=12, pointsize=10)
resultDirectory<-"MutationOperatorExperiment/DietProblemMutationOperatorExperiment/data"
qIndicator <- function(indicator, problem)
{
fileNSGAIIWithSwapMutation<-paste(resultDirectory, "NSGAIIWithSwapMutation", sep="/")
fileNSGAIIWithSwapMutation<-paste(fileNSGAIIWithSwapMutation, problem, sep="/")
fileNSGAIIWithSwapMutation<-paste(fileNSGAIIWithSwapMutation, indicator, sep="/")
NSGAIIWithSwapMutation<-scan(fileNSGAIIWithSwapMutation)

fileNSGAIIWithScrambleMutation<-paste(resultDirectory, "NSGAIIWithScrambleMutation", sep="/")
fileNSGAIIWithScrambleMutation<-paste(fileNSGAIIWithScrambleMutation, problem, sep="/")
fileNSGAIIWithScrambleMutation<-paste(fileNSGAIIWithScrambleMutation, indicator, sep="/")
NSGAIIWithScrambleMutation<-scan(fileNSGAIIWithScrambleMutation)

algs<-c("NSGAIIWithSwapMutation","NSGAIIWithScrambleMutation")
boxplot(NSGAIIWithSwapMutation,NSGAIIWithScrambleMutation,names=algs, notch = FALSE)
titulo <-paste(indicator, problem, sep=":")
title(main=titulo)
}
par(mfrow=c(3,3))
indicator<-"HV"
qIndicator(indicator, "DietProblem")
