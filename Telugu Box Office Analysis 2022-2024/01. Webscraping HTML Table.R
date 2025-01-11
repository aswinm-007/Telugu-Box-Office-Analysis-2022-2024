install.packages("rvest")
install.packages("openxlsx")
library(rvest)
> library(openxlsx)
> url <- "https://www.bollymoviereviewz.com/2021/12/tollywood-box-office-collection-report-verdict-telugu-movies-collection.html"
> web_page <- read_html(url)
> table <- web_page %>%
  +     html_node("table") %>%
  +     html_table()
> write.csv(table, "tboc.csv", row.names = FALSE)