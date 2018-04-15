plot_preparation_time<- function(){
  long_time_file <- paste("PreperationTimeExperiment/PreperationTimeExperiment/data/NSGAII/DietProblemLongPreperationTime/MEDIAN_HV_LONG.time")
  long_time_data <- read.csv(long_time_file)
  names(long_time_data)[1] <- paste("Avg. PreparationTime")
 
  
  short_time_file <- paste("PreperationTimeExperiment/PreperationTimeExperiment/data/NSGAII/DietProblemShortPreperationTime/MEDIAN_HV_SHORT.time")
  short_time_data <- read.csv(short_time_file)
  names(short_time_data)[1] <- paste("Avg. PreparationTime")
  
  names = c(rep("E13", nrow(long_time_data)), 
            rep("E12", nrow(short_time_data))
  );

values = rbind(long_time_data, 
           short_time_data
);

  data = data.frame(names, values);
  
  p <- qplot(x = names, y=values, data = data, geom=c("boxplot","jitter"), fill=names, xlab="Experiments", ylab="Average Preperation Time");
  p + guides(fill = FALSE)
}