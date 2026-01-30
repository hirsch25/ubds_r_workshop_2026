x <- c(3,4,6,7,8)

#naming a vector
names(x) <- c("a", "b", "c", "d", "e")

#accessing value by index
x[1]

#accessing areas in a vector
x[3:5]

x[c(3,4,5)]

#index out of value length

x[7]

x[0]

#Negative Data Index

x[-2]
#this will give you everything but the second index

x[c(-1, -5)]
#this will do the same thing

x[-1:5]
#this throws an error bc this vector includes zero and zero doesn't exist

c(-1,-5)

x <- x[-4]
x

#slice this vector to remove value at 3rd and 4th places
x <- c(1.1, 2.5, 6.4, 8.7)
names(x) <- c("a", "b", "c", "d")
x

x[c(-2,-4)]

#access values from x using names

x[c("a","c")]

#access the value from x using LOGICAL values (T/F)

#character is green which is in the parentheses
x[c("TRUE", "FALSE", "TRUE", "FALSE")]
x

#this is orange as logical
x[c(TRUE, FALSE, TRUE, FALSE)]

#Functions using logical operators
#<, >, ==

x
x >5
#this gives a logical statement
x[x>5]
#this gives you the columns where this is true in the data

x[x < 2]
x[x == 2]
x[x == 2.5]

x[names(x) == "c"]
#this prints out the number associated with c

#logical operators & and |

# using &  (AND) operator
x > 2 & x < 8
#this prints out a logical vector
x[x > 2 & x < 8]
# this gives you the data within these parameters

# using ! (NOT) operator
x > 2
!x > 2
#this reverses everything after the !
x[x > 2]
#this gives three values
x[!x > 2]
#this gives you one value

#all() and any() functions
all(x > 2)
#are all of the vectors greater than x or not and it gives yes or no
any(x > 2)
#this asks if there are any values greater than 2 as a yes or no

#Non-unique names 
x <- 1:8
x
names(x) <- c("a", "a", "a", "d", "c", "e", "d", "e")
x[names(x) == "a"]

#using - (negative operator for names)

x
x[-7]
x[-"a"]
#this throws an error
x["a"]
#this gives you the first column with that name

x[!names(x) == "a"]
#this gives you everything but "a"

x[names(x) == c("a", "d")]
x[!names(x) == c("a", "d")]
x
x[names(x) != c("a", "d")]
#!= is not equal to

#recycling vectors
names(x) == c("a", "d")
length(names(x))
length(c("a", "d"))

c("a", "c", "a", "c", "a", "c", "a", "c")
names(x) == c("a", "c")
names(x)

#%in% operator

names(x) %in% c("a", "c")
#%in% looks for all of the values in the left hand side and asks are there any values in the right side and then print the logical vector equal to the length of x

x[names(x) %in% c("a" , "c")]


#Data type: factors

f <- factor(c("a", "a", "b", "c", "c", "d"))
f
#gives levels which are unquie values of how many factors we have

f[f %in% c("b", "c")]
#vector vs factor: after you subset the vector the levels remain the same

f[-3]

#Matrix 

set.seed(1)

m <- matrix(rnorm(6*4), ncol = 4, nrow=6)
m

#rows then columns
m[3:4, c(1,2)]
m[3,]
m[3, ,drop = FALSE]
#empty in either row or columns means you want all of them

m[6]
#this is the 6th value, filled by columns then by rows

m2 <- matrix(1:24, ncol = 4, nrow = 6)
m2
m2 [8]

m3 <- matrix(1:24, ncol = 4, nrow = 6, byrow = TRUE)
m3
m3[8]

#List 

head(mtcars)
xlist <- list(a = "Software Carpentry",
              b = 1:10,
              data = head(mtcars))
xlist
#beneficial if you have different data types you want to store together in one object

xlist[1:2]
#accessing element one and two in the list

xlist[[1:2]]
xlist[[2]][1]
#double brackets tells it which aspect in the list and then the single brackets tell you which row

xlist[["a"]]
xlist[["b"]]

#$ in this context will open up the different elements in the data sets for you to pick from
xlist$data

#Subsetting a dataframe

gapminder <- read.csv("data/gapminder_data.csv")
head(gapminder)

#dataframe is also a list

head(gapminder [["pop"]])
#this prints out the vector column pop

head(gapminder[["pop"]], drop = FALSE)

gapminder
gapminder[,1:3]

gapminder[gapminder$lifeExp > 80,]
#gave an explanation of the rows but the comma is to show that you want all the columns


