write("", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex",append=FALSE)
resultDirectory<-"PreperationTimeExperiment/PreperationTimeExperiment/data"
latexHeader <- function() {
  write("\\documentclass{article}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\title{StandardStudy}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\usepackage{amssymb}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\author{A.J.Nebro}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{document}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\maketitle", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\section{Tables}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTableHeader <- function(problem, tabularString, latexTableFirstLine) {
  write("\\begin{table}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\caption{", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\label{Table:", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\centering", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{scriptsize}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{tabular}{", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(tabularString, "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(latexTableFirstLine, "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\hline ", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
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
    write("--", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
  else if (i < j) {
    if (is.finite(wilcox.test(data1, data2)$p.value) & wilcox.test(data1, data2)$p.value <= 0.05) {
      if (median(data1) >= median(data2)) {
        write("$\\blacktriangle$", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
      }
      else {
        write("$\\triangledown$", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
      }
    }
    else {
      write("$-$", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
    }
  }
  else {
    write(" ", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
}

latexTableTail <- function() { 
  write("\\hline", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{tabular}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{scriptsize}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{table}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTail <- function() { 
  write("\\end{document}", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

### START OF SCRIPT 
# Constants
problemList <-c("DietProblemLongPreperationTime", "DietProblemShortPreperationTime") 
algorithmList <-c("NSGAII") 
tabularString <-c("l") 
latexTableFirstLine <-c("\\hline \\\\ ") 
indicator<-"HV"

 # Step 1.  Writes the latex header
latexHeader()
tabularString <-c("| l | ") 

latexTableFirstLine <-c("\\hline \\multicolumn{1}{|c|}{} \\\\") 

# Step 3. Problem loop 
latexTableHeader("DietProblemLongPreperationTime DietProblemShortPreperationTime ", tabularString, latexTableFirstLine)

indx = 0
for (i in algorithmList) {
  if (i != "NSGAII") {
    write(i , "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
    write(" & ", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)

    jndx = 0
    for (j in algorithmList) {
      for (problem in problemList) {
        if (jndx != 0) {
          if (i != j) {
            printTableLine(indicator, i, j, indx, jndx, problem)
          }
          else {
            write("  ", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
          } 
          if (problem == "DietProblemShortPreperationTime") {
            if (j == "NSGAII") {
              write(" \\\\ ", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            } 
            else {
              write(" & ", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            }
          }
     else {
    write("&", "PreperationTimeExperiment/PreperationTimeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
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

