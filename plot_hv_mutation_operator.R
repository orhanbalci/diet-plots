plot_hv_mutation_operator <- function() {
  fileScrambleMutation<-paste("MutationOperatorExperiment/DietProblemMutationOperatorExperiment/data", "NSGAIIWithScrambleMutation", sep="/")
  fileScrambleMutation<-paste(fileScrambleMutation, "DietProblem", sep="/")
  fileScrambleMutation<-paste(fileScrambleMutation, "HV", sep="/")
  scrambleMutation<-scan(fileScrambleMutation)
  
 
  fileSwapMutatation<-paste("MutationOperatorExperiment/DietProblemMutationOperatorExperiment/data", "NSGAIIWithSwapMutation", sep="/")
  fileSwapMutatation<-paste(fileSwapMutatation, "DietProblem", sep="/")
  fileSwapMutatation<-paste(fileSwapMutatation, "HV", sep="/")
  swapMutation<-scan(fileSwapMutatation)
  
  names = c(rep("ScrambleMutation", length(scrambleMutation)), rep("SwapMutation", length(swapMutation)));
  values = c(scrambleMutation, swapMutation);
  
  data = data.frame(names, values);
  
  ttest_result <- wilcox.test(scrambleMutation, swapMutation)
  print(ttest_result)
  
  p <- qplot(x = names, y=values, data = data, geom=c("boxplot","jitter"), fill=names, xlab="Mutation Operators", ylab="Hypervolume Indicator");
  p+ guides(fill = FALSE)
  

  
  
}