plot_pareto_front_membership <- function() {
  referenceDirectory <- "MembershipFunctionExperiment/ReferenceFront"
  fileGaussianReference<-paste(referenceDirectory, "DietProblemGaussian.rf", sep="/")
  gaussianReference <- read.table(fileGaussianReference, header = FALSE);
  gaussianReference <- as.data.frame(gaussianReference);
  
  fileTrapezoidReference<-paste(referenceDirectory, "DietProblemTrapezoid.rf", sep="/")
  trapezoidReference <- read.table(fileTrapezoidReference, header = FALSE);
  trapezoidReference <- as.data.frame(trapezoidReference);
  
  
  names = c(rep("GaussianReference", nrow(gaussianReference)), rep("TrapezoidReference", nrow(trapezoidReference)));
  values = rbind(gaussianReference, trapezoidReference);
  
  print(head(values, 10))
  data = data.frame(names, values);
  
  print(head(data, 10))
  
    pareto_plot <- ggplot(data, aes(x=V1, y=V2, group=names)) + 
      geom_line(aes(linetype=names, color=names)) + 
      xlab('1/Ideal') + 
      ylab('Cost') +
      geom_point(aes(shape=names,color=names))
    pareto_plot
  
  
}