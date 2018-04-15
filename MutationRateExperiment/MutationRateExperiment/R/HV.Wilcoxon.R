write("", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex",append=FALSE)
resultDirectory<-"MutationRateExperiment/MutationRateExperiment/data"
latexHeader <- function() {
  write("\\documentclass{article}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\title{StandardStudy}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\usepackage{amssymb}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\author{A.J.Nebro}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{document}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\maketitle", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\section{Tables}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTableHeader <- function(problem, tabularString, latexTableFirstLine) {
  write("\\begin{table}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\caption{", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\label{Table:", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\centering", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{scriptsize}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{tabular}{", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(tabularString, "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(latexTableFirstLine, "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\hline ", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
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
    write("--", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
  else if (i < j) {
    if (is.finite(wilcox.test(data1, data2)$p.value) & wilcox.test(data1, data2)$p.value <= 0.05) {
      if (median(data1) >= median(data2)) {
        write("$buyuk$", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
      }
      else {
        write("$kucuk$", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
      }
    }
    else {
      write("$-$", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
    }
  }
  else {
    write("bos", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
}

latexTableTail <- function() { 
  write("\\hline", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{tabular}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{scriptsize}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{table}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTail <- function() { 
  write("\\end{document}", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

### START OF SCRIPT 
# Constants
problemList <-c("DietProblem") 
algorithmList <-c("NSGAIIWithSwapMutationProbabilityNumVariables", "NSGAIIWithSwapMutationProbability02", "NSGAIIWithSwapMutationProbability04", "NSGAIIWithSwapMutationProbability06", "NSGAIIWithSwapMutationProbability08") 
tabularString <-c("lcccc") 
latexTableFirstLine <-c("\\hline  & NSGAIIWithSwapMutationProbability02 & NSGAIIWithSwapMutationProbability04 & NSGAIIWithSwapMutationProbability06 & NSGAIIWithSwapMutationProbability08\\\\ ") 
indicator<-"HV"

 # Step 1.  Writes the latex header
latexHeader()
tabularString <-c("| l | p{0.15cm } | p{0.15cm } | p{0.15cm } | p{0.15cm } | ") 

latexTableFirstLine <-c("\\hline \\multicolumn{1}{|c|}{} & \\multicolumn{1}{c|}{NSGAIIWithSwapMutationProbability02} & \\multicolumn{1}{c|}{NSGAIIWithSwapMutationProbability04} & \\multicolumn{1}{c|}{NSGAIIWithSwapMutationProbability06} & \\multicolumn{1}{c|}{NSGAIIWithSwapMutationProbability08} \\\\") 

# Step 3. Problem loop 
latexTableHeader("DietProblem ", tabularString, latexTableFirstLine)

indx = 0
for (i in algorithmList) {
  if (i != "NSGAIIWithSwapMutationProbability08") {
    write(i , "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
    write(" & ", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)

    jndx = 0
    for (j in algorithmList) {
      for (problem in problemList) {
        if (jndx != 0) {
          if (i != j) {
            printTableLine(indicator, i, j, indx, jndx, problem)
          }
          else {
            write("  ", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
          } 
          if (problem == "DietProblem") {
            if (j == "NSGAIIWithSwapMutationProbability08") {
              write(" \\\\ ", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            } 
            else {
              write(" & ", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            }
          }
     else {
    write("&", "MutationRateExperiment/MutationRateExperiment/R/HV.Wilcoxon.tex", append=TRUE)
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

