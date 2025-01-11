> install.packages("readxl")
> install.packages("ggplot2")
> install.packages("dplyr")

> library(readxl)
> library(ggplot2)
> library(dplyr)

> colnames(data)
[1] "Movie Name"                           
[2] "Gross Worldwide Box Office Collection"
[3] "Budget (Cost+ P&A)"                   
[4] "Box Office Verdict"                   
[5] "Released Year"

> latest_years <- max(data$`Released Year`)
> last_3_years_data <- data %>%
  +     filter(`Released Year` %in% (latest_years - 2):latest_years)
> films_per_year <- last_3_years_data %>%
  +     group_by(`Released Year`) %>%
  +     summarize(num_movies = n())
> ggplot(films_per_year, aes(x = factor(`Released Year`), y = num_movies)) +
  +     geom_bar(stat = "identity", fill = "blue") +
  +     labs(title = "Number of Films Released in Last 3 Years", 
             +          x = "Released Year", 
             +          y = "Number of Films") +
  +     theme_minimal()

> verdict_counts <- data %>%
  +     count(`Box Office Verdict`)
> ggplot(verdict_counts, aes(x = "", y = n, fill = `Box Office Verdict`)) +
  +     geom_bar(stat = "identity", width = 1) +
  +     coord_polar(theta = "y") +
  +     labs(title = "Distribution of Films by Box Office Verdict", 
             +          fill = "Box Office Verdict") +
  +     theme_void()

> ggplot(data, aes(x = factor(`Released Year`), fill = `Box Office Verdict`)) +
  +     geom_bar(stat = "count", position = "dodge") +
  +     labs(title = "Verdict Distribution by Year", 
             +          x = "Released Year", 
             +          y = "Number of Films") +
  +     theme_minimal() +
  +     scale_fill_brewer(palette = "Set3")

> data <- read_excel("cleaned_tboc.xlsx")