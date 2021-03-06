install.packages('RMySQL', type = 'source')
install.packages('ggplot2', type = 'source')
install.packages("dplyr")
install.packages("magrittr")
install.packages("devtools")
install.packages("radarchart")
install.packages("desire")
devtools::install_github("cttobin/ggthemr")
ggthemr::ggthemr('grape')
install.packages("FuzzyR")
devtools::install_github("kassambara/ggpubr")

library('magrittr')
library('RMySQL')
library('ggplot2')
library('dplyr')
library('radarchart')
library("FuzzyR")
library('ggpubr')

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
plot_pareto_front('MutationOperatorExperiment/ReferenceFront/DietProblem.rf','Reference Pareto Front')
plot_pareto_front('MembershipFunctionExperiment/ReferenceFront/DietProblemGaussian.rf', "Reference PF with Gaussian MSF")

source("plot_radar.R")
plot_radar(conn)

source("plot_hv_membership.R")
plot_hv_membership()

source("plot_pareto_front_membership.R")
plot_pareto_front_membership()

source("plot_hv_mutation_operator.R")
plot_hv_mutation_operator()

source("mutation_rate_experiment.R")
plot_hv_mutation_rate()

source("generation_count_experiment.R")
plot_hv_generation_count()

source("preparation_time_experiment.R")
plot_preparation_time()

source("preperation_time_preference_experiment.R")
plot_preparation_time_preference()

source("plot_fuzzy_info.R")
plot_membership()


