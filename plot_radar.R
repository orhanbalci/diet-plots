plot_radar <- function(conn) {
  foods  <-
    dbGetQuery(
      conn,
      "SELECT id, name, cost, preference, preparation_time, rating FROM foods"
    )
  
  #foodNutrients <- dbReadTable(conn, 'food_nutrients')
  #colnames(foods)
  target <- c(6,7,8, 9, 10, 11)
  foodsFiltered  <- foods %>%
    filter(id %in% target) %>%
    select(name, cost, preference, preparation_time, rating)
  
  chartJSRadar(foodsFiltered)
}