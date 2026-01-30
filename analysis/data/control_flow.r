# if statement

x <- 8

if (x >= 10) {
  print("x is greater than or equal to 10")
}

# if else statements

if (x >= 10) {
  print ("x is greater than or equal to 10")
} else {
  print ("x is less than 10")
}

#multiple testing conditions

if (x >= 10) {
  print ("x is greater than or equal to 10")
} else if (x > 5) {
  print ("x is greater than 5, but less than 10")
} else {
  print ("x is 5 or less")
}
#these are in order, else is only run if the first statement is not correct

#use logical values directly

x <- 4 == 3

if (x) {
  print ("4 equals 3")
} else {
  print ("4 does not equal 3")
}

# ifelse functio

y <- -3
y

ifelse(y < 0, "y is a negative number", "y is either positive or zero")

# multiple logcials

x <- c(TRUE, TRUE, FALSE)
if (x) {
  print("x is TRUE")
}
#this doesn't work bc it has multiple values

if (any(x)) {
  print("At least one value of x is TRUE")
}
if (all(x)) {
  print("All the values of x are TRUE")
}

#for loop
for (i in 1:10) {
  print(i)
}

#nested for loops
for (i in 1:5) {
  for (j in c("a", "b", "c", "d", "e")) {
    print(paste(i,j))
  }
}

output_vector <- c()
for (i in 1:5) {
  for (j in c("a", "b", "c", "d", "e")) {
    temp_output <- paste(i,j)
    output_vector <- c(output_vector, temp_output)
  }
}
output_vector

#with bigger data it is not recommended to change your data in this fashion

#better to predefine the output size saves computational resources

output_matrix <- matrix(nrow = 5, ncol = 5)

j_vector <- c("a", "b", "c", "d", "e")

for (i in 1:5) {
  for (j in 1:5) {
    temp_j_value <- j_vector[j]
    temp_output <- paste(i, temp_j_value)
    output_matrix[i,j] <- temp_output
  }
}
output_matrix

#make it a vector again
output_vector2 <- as.vector(output_matrix)
output_vector2

#while loops
#you can get stuck in a while loop
#\n forces a line break

z <- 1

while (z > 0.1) {
  z <- runif(1)
  cat(z, "\n")
}

