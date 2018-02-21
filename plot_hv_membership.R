plot_hv_membership <- function() {
  fileGaussianMembership<-paste("MembershipFunctionExperiment/MembershipFunctionExperiment/data", "NSGAIIWithSwapMutation", sep="/")
  fileGaussianMembership<-paste(fileGaussianMembership, "DietProblemGaussian", sep="/")
  fileGaussianMembership<-paste(fileGaussianMembership, "HV", sep="/")
  gaussianMembership<-scan(fileGaussianMembership)
  
  
  fileTrapezoidMembership<-paste("MembershipFunctionExperiment/MembershipFunctionExperiment/data", "NSGAIIWithSwapMutation", sep="/")
  fileTrapezoidMembership<-paste(fileTrapezoidMembership, "DietProblemTrapezoid", sep="/")
  fileTrapezoidMembership<-paste(fileTrapezoidMembership, "HV", sep="/")
  trapezoidMembership<-scan(fileTrapezoidMembership)
  
  names = c(rep("GaussianMembership", length(gaussianMembership)), rep("TrapezoidMembership", length(trapezoidMembership)));
  values = c(gaussianMembership, trapezoidMembership);
  
  data = data.frame(names, values);
  
  qplot(x = names, y=values, data = data, geom=c("boxplot","jitter"), fill=names, xlab="MembershipFunctions", ylab="Hypervolume Indicator");
  
  
}