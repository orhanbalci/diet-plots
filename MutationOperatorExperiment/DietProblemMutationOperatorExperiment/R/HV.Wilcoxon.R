write("", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex",append=FALSE)
resultDirectory<-"MutationOperatorExperiment/DietProblemMutationOperatorExperiment/data"
latexHeader <- function() {
  write("\\documentclass{article}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\title{StandardStudy}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\usepackage{amssymb}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\author{A.J.Nebro}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{document}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\maketitle", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\section{Tables}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTableHeader <- function(problem, tabularString, latexTableFirstLine) {
  write("\\begin{table}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\caption{", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\label{Table:", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\centering", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{scriptsize}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{tabular}{", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(tabularString, "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(latexTableFirstLine, "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\hline ", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
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
    write("--", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
  else if (i < j) {
    if (is.finite(wilcox.test(data1, data2)$p.value) & wilcox.test(data1, data2)$p.value <= 0.05) {
      if (median(data1) >= median(data2)) {
        write("$\\blacktriangle$", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
      }
      else {
        write("$\\triangledown$", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
      }
    }
    else {
      write("$-$", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
    }
  }
  else {
    write(" ", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
}

latexTableTail <- function() { 
  write("\\hline", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{tabular}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{scriptsize}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{table}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTail <- function() { 
  write("\\end{document}", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

### START OF SCRIPT 
# Constants
problemList <-c("DietProblem") 
algorithmList <-c("NSGAIIWithSwapMutation", "NSGAIIWithScrambleMutation") 
tabularString <-c("lc") 
latexTableFirstLine <-c("\\hline  & NSGAIIWithScrambleMutation\\\\ ") 
indicator<-"HV"

 # Step 1.  Writes the latex header
latexHeader()
tabularString <-c("| l | p{0.15cm } | ") 

latexTableFirstLine <-c("\\hline \\multicolumn{1}{|c|}{} & \\multicolumn{1}{c|}{NSGAIIWithScrambleMutation} \\\\") 

# Step 3. Problem loop 
latexTableHeader("DietProblem ", tabularString, latexTableFirstLine)

indx = 0
for (i in algorithmList) {
  if (i != "NSGAIIWithScrambleMutation") {
    write(i , "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
    write(" & ", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)

    jndx = 0
    for (j in algorithmList) {
      for (problem in problemList) {
        if (jndx != 0) {
          if (i != j) {
            printTableLine(indicator, i, j, indx, jndx, problem)
          }
          else {
            write("  ", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
          } 
          if (problem == "DietProblem") {
            if (j == "NSGAIIWithScrambleMutation") {
              write(" \\\\ ", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            } 
            else {
              write(" & ", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            }
          }
     else {
    write("&", "MutationOperatorExperiment/DietProblemMutationOperatorExperiment/R/HV.Wilcoxon.tex", append=TRUE)
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

