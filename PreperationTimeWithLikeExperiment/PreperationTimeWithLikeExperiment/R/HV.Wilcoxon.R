write("", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex",append=FALSE)
resultDirectory<-"PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/data"
latexHeader <- function() {
  write("\\documentclass{article}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\title{StandardStudy}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\usepackage{amssymb}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\author{A.J.Nebro}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{document}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\maketitle", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\section{Tables}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTableHeader <- function(problem, tabularString, latexTableFirstLine) {
  write("\\begin{table}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\caption{", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\label{Table:", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\centering", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{scriptsize}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{tabular}{", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(tabularString, "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(latexTableFirstLine, "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\hline ", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
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
    write("--", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
  else if (i < j) {
    if (is.finite(wilcox.test(data1, data2)$p.value) & wilcox.test(data1, data2)$p.value <= 0.05) {
      if (median(data1) >= median(data2)) {
        write("$\\blacktriangle$", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
      }
      else {
        write("$\\triangledown$", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
      }
    }
    else {
      write("$-$", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
    }
  }
  else {
    write(" ", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
}

latexTableTail <- function() { 
  write("\\hline", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{tabular}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{scriptsize}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{table}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTail <- function() { 
  write("\\end{document}", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

### START OF SCRIPT 
# Constants
problemList <-c("DietProblemLongPreperationTimeLikePreference", "DietProblemShortPreperationTimeDontLikePreference") 
algorithmList <-c("NSGAII") 
tabularString <-c("l") 
latexTableFirstLine <-c("\\hline \\\\ ") 
indicator<-"HV"

 # Step 1.  Writes the latex header
latexHeader()
tabularString <-c("| l | ") 

latexTableFirstLine <-c("\\hline \\multicolumn{1}{|c|}{} \\\\") 

# Step 3. Problem loop 
latexTableHeader("DietProblemLongPreperationTimeLikePreference DietProblemShortPreperationTimeDontLikePreference ", tabularString, latexTableFirstLine)

indx = 0
for (i in algorithmList) {
  if (i != "NSGAII") {
    write(i , "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
    write(" & ", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)

    jndx = 0
    for (j in algorithmList) {
      for (problem in problemList) {
        if (jndx != 0) {
          if (i != j) {
            printTableLine(indicator, i, j, indx, jndx, problem)
          }
          else {
            write("  ", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
          } 
          if (problem == "DietProblemShortPreperationTimeDontLikePreference") {
            if (j == "NSGAII") {
              write(" \\\\ ", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            } 
            else {
              write(" & ", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            }
          }
     else {
    write("&", "PreperationTimeWithLikeExperiment/PreperationTimeWithLikeExperiment/R/HV.Wilcoxon.tex", append=TRUE)
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

