write("", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex",append=FALSE)
resultDirectory<-"MembershipFunctionExperiment/MembershipFunctionExperiment/data"
latexHeader <- function() {
  write("\\documentclass{article}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\title{StandardStudy}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\usepackage{amssymb}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\author{A.J.Nebro}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{document}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\maketitle", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\section{Tables}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTableHeader <- function(problem, tabularString, latexTableFirstLine) {
  write("\\begin{table}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\caption{", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\label{Table:", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\centering", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{scriptsize}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{tabular}{", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(tabularString, "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(latexTableFirstLine, "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\hline ", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

printTableLine <- function(indicator, algorithm1, algorithm2, i, j, problem) { 
  file1<-paste(resultDirectory, algorithm1, sep="/")
  file1<-paste(file1, problem, sep="/")
  file1<-paste(file1, indicator, sep="/")
  data1<-scan(file1)
  file2<-paste(resultDirectory, algorithm2, sep="/")
  file2<-paste(file2, problem, sep="/")
  file2<-paste(file2, indicator, sep="/")
  data2<-scan(file2)
  if (i == j) {
    write("--", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
  else if (i < j) {
    if (is.finite(wilcox.test(data1, data2)$p.value) & wilcox.test(data1, data2)$p.value <= 0.05) {
      if (median(data1) >= median(data2)) {
        write("$\\blacktriangle$", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
      }
      else {
        write("$\\triangledown$", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
      }
    }
    else {
      write("$-$", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
    }
  }
  else {
    write(" ", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
}

latexTableTail <- function() { 
  write("\\hline", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{tabular}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{scriptsize}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{table}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTail <- function() { 
  write("\\end{document}", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

### START OF SCRIPT 
# Constants
problemList <-c("DietProblemTrapezoid", "DietProblemGaussian") 
algorithmList <-c("NSGAIIWithSwapMutation") 
tabularString <-c("l") 
latexTableFirstLine <-c("\\hline \\\\ ") 
indicator<-"HV"

 # Step 1.  Writes the latex header
latexHeader()
tabularString <-c("| l | ") 

latexTableFirstLine <-c("\\hline \\multicolumn{1}{|c|}{} \\\\") 

# Step 3. Problem loop 
latexTableHeader("DietProblemTrapezoid DietProblemGaussian ", tabularString, latexTableFirstLine)

indx = 0
for (i in algorithmList) {
  if (i != "NSGAIIWithSwapMutation") {
    write(i , "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
    write(" & ", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)

    jndx = 0
    for (j in algorithmList) {
      for (problem in problemList) {
        if (jndx != 0) {
          if (i != j) {
            printTableLine(indicator, i, j, indx, jndx, problem)
          }
          else {
            write("  ", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
          } 
          if (problem == "DietProblemGaussian") {
            if (j == "NSGAIIWithSwapMutation") {
              write(" \\\\ ", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            } 
            else {
              write(" & ", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            }
          }
     else {
    write("&", "MembershipFunctionExperiment/MembershipFunctionExperiment/R/HV.Wilcoxon.tex", append=TRUE)
     }
        }
      }
      jndx = jndx + 1
    }
    indx = indx + 1
  }
} # for algorithm

  latexTableTail()

#Step 3. Writes the end of latex file 
latexTail()

