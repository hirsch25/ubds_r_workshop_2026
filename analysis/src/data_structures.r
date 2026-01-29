# Data structures and types

# There are five data types in R

# This is a double (decimals and whole numbers) - also called numberics
double_var <- 3.14
typeof(double_var)

double_var_2 <- 1
typeof(double_var_2)

# this is an integar (whole numbers)
int_var <- 4L
typeof(int_var)

#this is a complex number
complex_var <- 1 + 1i
typeof(complex_var)

#this is a logical (T/F)
logical_var <- TRUE
typeof(logical_var)

#this is a character (letters, symbols, words): another word is string
char_var <- "This is a character"
typeof(char_var)

#these don't work because the data types are too different
45 + "word"
5 * A

# Collections (Groups of Data)
# Vectors: all data has to be the same type

my_vector <- vector(length = 3)
my_vector

another_vector <- vector(mode = 'character', length = 3)
another_vector

str(another_vector)
#short hands chr = character; logi = logical; int = integar; etc

another_vector[1]

double_vector <- c(5, 7, 9)
double_vector[3]
#this gives you the number 9 as the third column

#We can change values in a vector by index (in R that start at 1)

double_vector[1] <- 13
double_vector
#Way to change values as needed

#What about if we define vectors with multiple data types?
multi_vector <- c(2, 6, '3')
multi_vector
#this is a process called type conversion, this forces the data types to all be the same

coercion_vector <- c('a', TRUE)
coercion_vector
str(coersion_vector)
str(coercion_vector)
str(multi_vector)
#This is coersing these vectors into character vectors

#Type coersion flow
# logical > integer > double > complex > character
# can't go backward only forward

another_coercion_vector <- c(4, TRUE)
another_coercion_vector
#True = 1 and False = 0 (makes logicals into integer with the to the left)

#We can go against the coercion flow
character_vector <- c('0', '2', '4')
character_vector
converted_vector <- as.double(character_vector)
converted_vector

#Lists
list_example <- list(1, "a", TRUE, 1+4i)
list_example
#they are a single colection of data but they don't have the requirement they have to be the same type. It is a bit different to access them

list_example
str(list_example)
#lists can hold multiple types, can be accessed by index
list_example[[2]]

#We can add metadata to lists
another_list <- list(
  title = "Numbers",
  numbers = 1:10,
  data = TRUE
)
another_list
another_list$title
another_list$numbers
another_list$data
# dollar sign allows you to work within a vector "column"
#list can be a collection of vectors

#Matrix 
matrix_example <- matrix(0, nrow=6, ncol=3)
matrix_example
#the zero shows you what the rows and columns have in them
# nrow = number of rows and ncol = number of columns

dim(matrix_example)
typeof(matrix_example)
#much like vectors matrices can only be the same data type
#we can check the number of rows and columns
nrow(matrix_example)
ncol(matrix_example)
#access an item in the matrix
matrix_example[1,1]
#single item needs both the row and column number respectively

matrix_example_2 <- matrix_example + 2
matrix_example_2
matrix_example_2 * matrix_example_2

#Dataframes
cats <- data.frame(
  coat = c("calico", "black", "tabby"),
  weight = c(2.1, 5.0, 3.2),
  likes_catnip = c(1, 0, 1)
)
cats
#they are a special collection of data as you can mix data types, however each column has to be the same data type and each row has to have the same number of columns

typeof(cats)
#under the hood a data frame is a list of vectors
class(cats)
str(cats)
#class is more for the human user
#str gives you typeof or class but more in depth

#We can access columns by name
cats
cats$weight
cats$coat
cats$likes_catnip

cats$weight + 2
#this adds 2 to each number in that column

cats$weight + cats$likes_catnip

#This combines strings and you can add variables
paste("My cat is", cats$coat)

#Let's add a new row to our dataframe
additional_cats <- data.frame(
  coat = "tabby",
  weight = "2.3 or 2.4",
  likes_catnip = 1
)
additional_cats

#adding two dataframes together
combined_cats <- rbind(cats, additional_cats)

cats[,1]
cats[1,]
