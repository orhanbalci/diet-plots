plot_pareto_front <- function(file_name, title){
  pareto_table <- read.table(file_name, header = FALSE);
  pareto_frame <- as.data.frame(pareto_table);
  pareto_plot <- ggplot(pareto_frame, aes(V1, V2)) + 
    geom_line() + 
    labs(title = title) + 
    xlab('1/Ideal') + 
    ylab('Cost') +
    geom_point()
  pareto_plot
}
