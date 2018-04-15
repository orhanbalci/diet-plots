plot_preparation_time_preference<- function(){
  
  long_like_file <- paste("PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/data/NSGAII/DietProblemLongPreperationTimeLikePreference/MEDIAN_HV_LONG_LIKE.time")
  long_like_data <- read.csv(long_like_file,sep=" ")
  names(long_like_data)[2] <- paste("Avg. PreparationTime")
  names(long_like_data)[4] <- paste("Avg. Preference")
  
  short_dont_like_file  <- paste("PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/data/NSGAII/DietProblemShortPreperationTimeDontLikePreference/MEDIAN_HV_SHORT_DONT_LIKE.time")
  short_dont_like_data <- read.csv(short_dont_like_file, sep=" ")
  names(short_dont_like_data)[2] <- paste("Avg. PreparationTime")
  names(short_dont_like_data)[4] <- paste("Avg. Preference") 
  
  
  names = c(rep("E14", nrow(long_like_data)), 
            rep("E15", nrow(short_dont_like_data))
  );
  
  common_cols <- intersect(colnames(long_like_data), colnames(short_dont_like_data))
  
  
  values = rbind(long_like_data[,common_cols], 
                 short_dont_like_data[,common_cols]
  );
  
  
  data = data.frame(names, values);
  
  
  
  p <- ggplot(data, aes(names, y=value, color = variable))
  p <- p + geom_jitter(aes(y = Avg..PreparationTime, col = "Avg. PreprationTime")) 
  p <- p + geom_boxplot(aes(y = Avg..PreparationTime, col = "Avg. PreprationTime"))
  p <- p + geom_jitter(aes(y = Avg..Preference, col="Avg. Preference"))
  p <- p + geom_boxplot(aes(y = Avg..Preference, col="Avg. Preference"))
p <- p + labs(x = "Experiments")
p <- p + labs(y = "Average Objective Values")
p <- p + theme(legend.position ="none")
p <- p + scale_y_continuous(trans = "log2")
p
  }