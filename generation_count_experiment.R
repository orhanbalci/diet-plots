plot_hv_generation_count <- function() {
  fileNSGAIIWithGenerationCount2500<-paste("GenerationCountExperiment/GenerationCountExperiment/data", "NSGAIIWithGenerationCount2500", sep="/")
  fileNSGAIIWithGenerationCount2500<-paste(fileNSGAIIWithGenerationCount2500, "DietProblem", sep="/")
  fileNSGAIIWithGenerationCount2500<-paste(fileNSGAIIWithGenerationCount2500, "HV", sep="/")
  NSGAIIWithGenerationCount2500<-scan(fileNSGAIIWithGenerationCount2500)
  
  fileNSGAIIWithGenerationCount5000<-paste("GenerationCountExperiment/GenerationCountExperiment/data", "NSGAIIWithGenerationCount5000", sep="/")
  fileNSGAIIWithGenerationCount5000<-paste(fileNSGAIIWithGenerationCount5000, "DietProblem", sep="/")
  fileNSGAIIWithGenerationCount5000<-paste(fileNSGAIIWithGenerationCount5000, "HV", sep="/")
  NSGAIIWithGenerationCount5000<-scan(fileNSGAIIWithGenerationCount5000)
  
  fileNSGAIIWithGenerationCount10000<-paste("GenerationCountExperiment/GenerationCountExperiment/data", "NSGAIIWithGenerationCount10000", sep="/")
  fileNSGAIIWithGenerationCount10000<-paste(fileNSGAIIWithGenerationCount10000, "DietProblem", sep="/")
  fileNSGAIIWithGenerationCount10000<-paste(fileNSGAIIWithGenerationCount10000, "HV", sep="/")
  NSGAIIWithGenerationCount10000<-scan(fileNSGAIIWithGenerationCount10000)
  
  fileNSGAIIWithGenerationCount15000<-paste("GenerationCountExperiment/GenerationCountExperiment/data", "NSGAIIWithGenerationCount15000", sep="/")
  fileNSGAIIWithGenerationCount15000<-paste(fileNSGAIIWithGenerationCount15000, "DietProblem", sep="/")
  fileNSGAIIWithGenerationCount15000<-paste(fileNSGAIIWithGenerationCount15000, "HV", sep="/")
  NSGAIIWithGenerationCount15000<-scan(fileNSGAIIWithGenerationCount15000)
  
  names = c(rep("02500", length(NSGAIIWithGenerationCount2500)), 
            rep("05000", length(NSGAIIWithGenerationCount5000)),
            rep("10000",length(NSGAIIWithGenerationCount10000)),
            rep("15000", length(NSGAIIWithGenerationCount15000))
            );
  
  values = c(NSGAIIWithGenerationCount2500, 
             NSGAIIWithGenerationCount5000,
             NSGAIIWithGenerationCount10000,
             NSGAIIWithGenerationCount15000
             );
  
  data = data.frame(names, values);
  
  wt1 <- wilcox.test(NSGAIIWithGenerationCount2500, NSGAIIWithGenerationCount5000)
  print(wt1)
  wt2 <- wilcox.test(NSGAIIWithGenerationCount2500, NSGAIIWithGenerationCount10000)
  print(wt2)
  wt3 <- wilcox.test(NSGAIIWithGenerationCount2500, NSGAIIWithGenerationCount15000)
  print(wt3)
  wt4 <- wilcox.test(NSGAIIWithGenerationCount5000, NSGAIIWithGenerationCount10000)
  print(wt4)
  wt5 <- wilcox.test(NSGAIIWithGenerationCount5000, NSGAIIWithGenerationCount15000)
  print(wt5)
  wt6 <- wilcox.test(NSGAIIWithGenerationCount10000, NSGAIIWithGenerationCount15000)
  
  
  p <- qplot(x = names, y=values, data = data, geom=c("boxplot","jitter"), fill=names, xlab="Generation Count", ylab="Hypervolume Indicator");
  
  p + guides(fill = FALSE)
}