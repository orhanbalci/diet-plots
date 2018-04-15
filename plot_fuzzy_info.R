
plot_membership <- function(){
  fis <- newfis("diet_trapezoid")
  fis <- addvar(fis, "input","preference",c(0,10));
  fis <- addvar(fis, "input","rating", c(0,10));
  fis <- addvar(fis, "input","preperation time", c(0,120));
  fis <- addvar(fis, "output", "desirability", c(0,30));
  
  fis <- addmf(fis, "input", 1, "dont_like", "trapmf",c(0, 0, 0, 4));
  fis <- addmf(fis, "input", 1, "neutral", "trapmf", c(2, 4, 6, 8));
  fis <- addmf(fis, "input", 1, "like", "trapmf", c(6, 10, 10, 10));
  
  fis <- addmf(fis, "input", 2, "poor", "trapmf", c(0, 0, 2, 4));
  fis <- addmf(fis, "input", 2, "fair", "trapmf", c(3, 4, 6, 7));
  fis <- addmf(fis, "input", 2, "good", "trapmf", c(6, 8, 10, 10));
  
  fis <- addmf(fis, "input", 3, "short", "trapmf", c(0, 0, 15, 45));
  fis <- addmf(fis, "input", 3, "medium", "trapmf", c(25, 35, 60, 70));
  fis <- addmf(fis, "input", 3, "long", "trapmf", c(50, 60, 85, 95));
  fis <- addmf(fis, "input", 3, "very_long", "trapmf", c(75, 105, 120, 120));
  
  fis <- addmf(fis,"output", 1, "sub optimal", "trapmf", c(0, 0, 5, 15))
  fis <- addmf(fis, "output", 1, "non optimal", "trapmf", c(5, 10, 20, 25))
  fis <- addmf(fis, "output", 1, "optimal", "trapmf", c(15, 25, 30, 30))
  
  

  plotmf(fis, 'input',1)
  plotmf(fis, 'input', 2)
  plotmf(fis, 'input', 3)
  plotmf(fis, 'output', 1)
}