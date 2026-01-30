#saving table

aust_subset <- gapminder[gapminder$country == "Australia", ]
head(aust_subset)
dim(aust_subset)

write.csv(aust_subset,
          file = "data/gapminder_aust_subset.csv",
          row.names = FALSE,
          quote = FALSE)
write.table(aust_subset,
            file = "data/gapminder_aust_subset_from_write_table.csv",
            sep = ",")

#library(readxl)
#WriteXLS::WriteXLS()

#library(haven)
#write_sas(df, "location")

gapminder_australia_read_dt <- read.csv("data/gapminder_aust_subset_from_write_table.csv")
#can save plots and files and create a report

