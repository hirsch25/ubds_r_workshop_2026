#Writing the data frame to a file
write.csv(cats, "data/feline_data.csv")
cats <- read.csv("data/feline_data.csv")
cats
#add new column
age <- c(2,3,5)
cbind(cats, age)
nrow(cats)
length(age)
age <- c(2,3,5)
age
cats <- cbind (cats, age)
cats

# adding new rows
newRow <- list(4,"tortoishell", 3.3, TRUE, 9)
newRow
cats <- rbind(cats, newRow)

#removing the rows
cats[-4,]

cats[,-4]

cats[c(-3,4),]

names(cats)

drop <- names(cats) %in% c("age")

drop

cats[, !drop]
# not (!) makes true turn to false and vis versa

#appending two data frames: combine two data frames with rbind()

cats <- rbind(cats, cats)
cats

#column names have to be the same when you append data frames

df <- data.frame(
  first_name = c("Meghan", "David"),
  last_name = c("Hirsch", "Bullock"),
  lucky_number = c(17, 11)
)
df

download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/main/episodes/data/gapminder_data.csv", destfile = "data/gapminder_data.csv")

str(gapminder)

#print outs of summary dataframe

summary(gapminder)

#Type and structure of columns

typeof(gapminder$country)

typeof(gapminder$year)

str(gapminder$year)

str(gapminder$continent)

nrow(gapminder)

ncol(gapminder)

dim(gapminder)
#gives number of rows and columns in one way

names(gapminder)

colnames(gapminder)

#the most recent two give the same thing

#length for dataframe is number of columns
length(gapminder)

#gives the first # of rows
head(gapminder)
head(gapminder, n = 10)

#gives the last # of rows
tail(gapminder)


#challenge 2 (examine the gapminder data)
#check the last few lines, check some rows in the middle, and try to pull a few random rows
#hint use functions like tail(), subsetting, and sample()

#middle rows 
gapminder[800:810,]

#random rows
gapminder[sample(nrow(gapminder), 5),]
