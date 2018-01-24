install.packages('RMySQL', type = 'source')
install.packages('ggplot2', type = 'source')
install.packages("dplyr")
install.packages("magrittr")
install.packages("devtools")
devtools::install_github("cttobin/ggthemr")
ggthemr::ggthemr('grape')

library('magrittr')
library('RMySQL')
library('ggplot2')
library('dplyr')

conn <-
  dbConnect(
    MySQL(),
    
  )
dbGetInfo(conn)
dbListTables(conn)
dbListFields(conn, 'food_nutrients')
source("plot_nutrient_distribution_stacked.R")
plot_stacked(conn)
