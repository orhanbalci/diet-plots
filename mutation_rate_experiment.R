plot_hv_mutation_rate <- function() {
  fileNSGAIIWithSwapMutationProbabilityNumVariables<-paste("MutationRateExperiment/MutationRateExperiment/data", "NSGAIIWithSwapMutationProbabilityNumVariables", sep="/")
  fileNSGAIIWithSwapMutationProbabilityNumVariables<-paste(fileNSGAIIWithSwapMutationProbabilityNumVariables, "DietProblem", sep="/")
  fileNSGAIIWithSwapMutationProbabilityNumVariables<-paste(fileNSGAIIWithSwapMutationProbabilityNumVariables, "HV", sep="/")
  NSGAIIWithSwapMutationProbabilityNumVariables<-scan(fileNSGAIIWithSwapMutationProbabilityNumVariables)
  
  fileNSGAIIWithSwapMutationProbability02<-paste("MutationRateExperiment/MutationRateExperiment/data", "NSGAIIWithSwapMutationProbability02", sep="/")
  fileNSGAIIWithSwapMutationProbability02<-paste(fileNSGAIIWithSwapMutationProbability02, "DietProblem", sep="/")
  fileNSGAIIWithSwapMutationProbability02<-paste(fileNSGAIIWithSwapMutationProbability02, "HV", sep="/")
  NSGAIIWithSwapMutationProbability02<-scan(fileNSGAIIWithSwapMutationProbability02)
  
  fileNSGAIIWithSwapMutationProbability04<-paste("MutationRateExperiment/MutationRateExperiment/data", "NSGAIIWithSwapMutationProbability04", sep="/")
  fileNSGAIIWithSwapMutationProbability04<-paste(fileNSGAIIWithSwapMutationProbability04, "DietProblem", sep="/")
  fileNSGAIIWithSwapMutationProbability04<-paste(fileNSGAIIWithSwapMutationProbability04, "HV", sep="/")
  NSGAIIWithSwapMutationProbability04<-scan(fileNSGAIIWithSwapMutationProbability04)
  
  fileNSGAIIWithSwapMutationProbability06<-paste("MutationRateExperiment/MutationRateExperiment/data", "NSGAIIWithSwapMutationProbability06", sep="/")
  fileNSGAIIWithSwapMutationProbability06<-paste(fileNSGAIIWithSwapMutationProbability06, "DietProblem", sep="/")
  fileNSGAIIWithSwapMutationProbability06<-paste(fileNSGAIIWithSwapMutationProbability06, "HV", sep="/")
  NSGAIIWithSwapMutationProbability06<-scan(fileNSGAIIWithSwapMutationProbability06)
  
  fileNSGAIIWithSwapMutationProbability08<-paste("MutationRateExperiment/MutationRateExperiment/data", "NSGAIIWithSwapMutationProbability08", sep="/")
  fileNSGAIIWithSwapMutationProbability08<-paste(fileNSGAIIWithSwapMutationProbability08, "DietProblem", sep="/")
  fileNSGAIIWithSwapMutationProbability08<-paste(fileNSGAIIWithSwapMutationProbability08, "HV", sep="/")
  NSGAIIWithSwapMutationProbability08<-scan(fileNSGAIIWithSwapMutationProbability08)
  
  
  names = c(rep("1/L", length(NSGAIIWithSwapMutationProbabilityNumVariables)), 
            rep("0.2", length(NSGAIIWithSwapMutationProbability02)),
            rep("0.4", length(NSGAIIWithSwapMutationProbability04)),
            rep("0.6", length(NSGAIIWithSwapMutationProbability06)),
            rep("0.8", length(NSGAIIWithSwapMutationProbability08)));
  
  values = c(NSGAIIWithSwapMutationProbabilityNumVariables, 
             NSGAIIWithSwapMutationProbability02,
             NSGAIIWithSwapMutationProbability04,
             NSGAIIWithSwapMutationProbability06,
             NSGAIIWithSwapMutationProbability08);
  
  wt1 <- wilcox.test(NSGAIIWithSwapMutationProbabilityNumVariables, NSGAIIWithSwapMutationProbability02)
  print(wt1)
  wt2 <- wilcox.test(NSGAIIWithSwapMutationProbabilityNumVariables, NSGAIIWithSwapMutationProbability04)
  print(wt2)
  wt3 <- wilcox.test(NSGAIIWithSwapMutationProbabilityNumVariables, NSGAIIWithSwapMutationProbability06)
  print(wt3)
  wt4 <- wilcox.test(NSGAIIWithSwapMutationProbabilityNumVariables, NSGAIIWithSwapMutationProbability08)
  print(wt4)
  wt5 <- wilcox.test(NSGAIIWithSwapMutationProbability02, NSGAIIWithSwapMutationProbability04)
  print(wt5)
  wt6 <- wilcox.test(NSGAIIWithSwapMutationProbability02, NSGAIIWithSwapMutationProbability06)
  print(wt6)
  wt7 <- wilcox.test(NSGAIIWithSwapMutationProbability02, NSGAIIWithSwapMutationProbability08)
  print(wt7)
  wt8 <- wilcox.test(NSGAIIWithSwapMutationProbability04, NSGAIIWithSwapMutationProbability06)
  print(wt8)
  wt9 <- wilcox.test(NSGAIIWithSwapMutationProbability04, NSGAIIWithSwapMutationProbability08)
  print(wt9)
  wt10 <- wilcox.test(NSGAIIWithSwapMutationProbability06, NSGAIIWithSwapMutationProbability08)
  print(wt10)
  
  data = data.frame(names, values);
  
  p <- qplot(x = names, y=values, data = data, geom=c("boxplot","jitter"), fill=names, xlab="Mutation Rate", ylab="Hypervolume Indicator");
  
  p + guides(fill=FALSE)
}