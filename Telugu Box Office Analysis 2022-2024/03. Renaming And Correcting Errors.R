install.packages("readxl")
library(readxl)
> 
> data <- read_excel("~/tboc.xlsx")

> install.packages("openxlsx")
> install.packages("readxl")

> library(openxlsx)
> library(readxl)

data <- read_excel("tboc.xlsx", sheet = 1)

> colnames(data)
[1] "Movie Name"                           
[2] "Gross Worldwide Box Office Collection"
[3] "Budget (Cost+ P&A)"                   
[4] "Box Office Verdict (Hit Ya Flop)"     
[5] "Released Year" 

> install.packages("dplyr")
> library(dplyr)

> data <- data %>%
  +     rename(`Box Office Verdict` = `Box Office Verdict (Hit Ya Flop)`)

> data$`Box Office Verdict`[data$`Box Office Verdict` == "Super Hit"] <- "Superhit"
> data$`Box Office Verdict`[data$`Box Office Verdict` == "Super hit"] <- "Superhit"
> data$`Box Office Verdict`[data$`Box Office Verdict` == "Block buster"] <- "Blockbuster"
> data$`Box Office Verdict`[data$`Box Office Verdict` == "Block Buster"] <- "Blockbuster"
> install.packages("writexl")

> library(writexl)
> write_xlsx(data, "cleaned_tboc.xlsx")