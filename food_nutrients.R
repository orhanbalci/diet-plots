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
    user = 'root',
    password = 'root',
    host = '172.17.0.2',
    dbname = 'DIET'
  )
dbGetInfo(conn)
dbListTables(conn)
dbListFields(conn, 'food_nutrients')
source("plot_nutrient_distribution_stacked.R")
plot_stacked(conn)
source("plot_pareto_front.R")
plot_pareto_front('FUN.tsv')


