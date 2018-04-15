write("", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex",append=FALSE)
resultDirectory<-"GenerationCountExperiment/GenerationCountExperiment/data"
latexHeader <- function() {
  write("\\documentclass{article}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\title{StandardStudy}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\usepackage{amssymb}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\author{A.J.Nebro}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{document}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\maketitle", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\section{Tables}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTableHeader <- function(problem, tabularString, latexTableFirstLine) {
  write("\\begin{table}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\caption{", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\label{Table:", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(problem, "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(".HV.}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)

  write("\\centering", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{scriptsize}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\begin{tabular}{", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(tabularString, "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write(latexTableFirstLine, "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\hline ", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
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
    write("--", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
  else if (i < j) {
    if (is.finite(wilcox.test(data1, data2)$p.value) & wilcox.test(data1, data2)$p.value <= 0.05) {
      if (median(data1) >= median(data2)) {
        write("$\\blacktriangle$", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
      }
      else {
        write("$\\triangledown$", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
      }
    }
    else {
      write("$-$", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE) 
    }
  }
  else {
    write(" ", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  }
}

latexTableTail <- function() { 
  write("\\hline", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{tabular}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{scriptsize}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
  write("\\end{table}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

latexTail <- function() { 
  write("\\end{document}", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
}

### START OF SCRIPT 
# Constants
problemList <-c("DietProblem") 
algorithmList <-c("NSGAIIWithGenerationCount2500", "NSGAIIWithGenerationCount5000", "NSGAIIWithGenerationCount10000", "NSGAIIWithGenerationCount15000") 
tabularString <-c("lccc") 
latexTableFirstLine <-c("\\hline  & NSGAIIWithGenerationCount5000 & NSGAIIWithGenerationCount10000 & NSGAIIWithGenerationCount15000\\\\ ") 
indicator<-"HV"

 # Step 1.  Writes the latex header
latexHeader()
tabularString <-c("| l | p{0.15cm } | p{0.15cm } | p{0.15cm } | ") 

latexTableFirstLine <-c("\\hline \\multicolumn{1}{|c|}{} & \\multicolumn{1}{c|}{NSGAIIWithGenerationCount5000} & \\multicolumn{1}{c|}{NSGAIIWithGenerationCount10000} & \\multicolumn{1}{c|}{NSGAIIWithGenerationCount15000} \\\\") 

# Step 3. Problem loop 
latexTableHeader("DietProblem ", tabularString, latexTableFirstLine)

indx = 0
for (i in algorithmList) {
  if (i != "NSGAIIWithGenerationCount15000") {
    write(i , "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
    write(" & ", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)

    jndx = 0
    for (j in algorithmList) {
      for (problem in problemList) {
        if (jndx != 0) {
          if (i != j) {
            printTableLine(indicator, i, j, indx, jndx, problem)
          }
          else {
            write("  ", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
          } 
          if (problem == "DietProblem") {
            if (j == "NSGAIIWithGenerationCount15000") {
              write(" \\\\ ", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            } 
            else {
              write(" & ", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
            }
          }
     else {
    write("&", "GenerationCountExperiment/GenerationCountExperiment/R/HV.Wilcoxon.tex", append=TRUE)
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

