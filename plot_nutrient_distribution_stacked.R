plot_stacked <- function(conn) {
  foodNutrients <-
    dbGetQuery(
      conn,
      "SELECT fn.foodId, fd.name as foodName, fn.nutrientId, fn.quantity, n.name, un.name as unitName
      FROM food_nutrients fn
      INNER JOIN nutrients n ON fn.nutrientId = n.Id
      INNER JOIN foods fd    ON fn.foodId = fd.Id
      INNER JOIN units un    ON  n.unitId = un.Id"
    )
  
  #foodNutrients <- dbReadTable(conn, 'food_nutrients')
  colnames(foodNutrients)
  target <- c(6,7,8, 9, 10, 11)
  foodNutrientsFiltered <- foodNutrients %>%
    filter(foodId %in% target) %>%
    
    select(foodId, nutrientId, quantity, name, foodName, unitName)
  
  pl <-
    ggplot(foodNutrientsFiltered, aes(x = name, y = quantity, fill = foodName)) + 
    geom_bar(stat = 'identity') + 
    xlab(foodNutrientsFiltered$foodName) + 
    facet_grid(unitName ~ ., scales = "free_y") + 
    theme(axis.text.x = element_text(angle = 90))
  pl
}