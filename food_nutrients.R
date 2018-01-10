install.packages('RMySQL', type = 'source')
install.packages('ggplot2', type = 'source')
install.packages("dplyr")
install.packages("magrittr")

library('magrittr')
library('RMySQL')
library('ggplot2')
library('dplyr')

conn <-
  dbConnect(
    MySQL()
  )
dbGetInfo(conn)
dbListTables(conn)
dbListFields(conn, 'food_nutrients')
foodNutrients <-
  dbGetQuery(
    conn,
    "SELECT fn.foodId, fn.nutrientId, fn.quantity, n.name FROM food_nutrients fn INNER JOIN nutrients n
    ON fn.nutrientId = n.Id"
  )

#foodNutrients <- dbReadTable(conn, 'food_nutrients')
colnames(foodNutrients)
foodNutrientsFiltered <- foodNutrients %>%
  filter(foodId == 1) %>%
  select(foodId, nutrientId, quantity, name)
pl <-
  ggplot(foodNutrientsFiltered, aes(x = name, y = quantity)) + geom_bar(stat =
                                                                          'identity')
pl + theme(axis.text.x = element_text(angle = 90, hjust = 1))
