#Writing functions and data in R

#functions are a sequence of operations
#any code 2x > make it a function
#three key parts to a function: name, parameters, and body

#my first function
fahr_to_kelvin <- function(temp){
  kelvin <- ((temp - 32) * (5/9)) + 273.15
  return(kelvin)
}

#testing the function
fahr_to_kelvin(32)
fahr_to_kelvin(212)

#combining different functions
kelvin_to_celsius <- function(temp){
  celsius <- temp - 273.15
  return(celsius)
}

#testing the new function
kelvin_to_celsius(300)

#testing fahr to celsius through kelvin
fahr_to_celsius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  temp_c <- kelvin_to_celsius(temp_k)
  return(temp_c)
}
fahr_to_celsius(96.8)

#if you put in a character instead of a number it will throw an error
fahr_to_kelvin("100")

#defensive programming

fahr_to_kelvin2 <- function(temp){
  if(!is.numeric(temp)){
    stop("temp must be a numeric vector.")
  }
  kelvin <- ((temp-32) * (5/9)) + 273.15
  return(kelvin)
}

fahr_to_kelvin2("100")
#this gives an error with the message you included
#this stops the code at this stage if you have a long list of things you are running

#Using stopifnot function

fahr_to_kelvin3 <- function(temp){
  stopifnot(is.numeric(temp))
  kelvin <- ((temp - 32) * (5/9)) + 273.15
  return(kelvin)
}

fahr_to_kelvin3("100")
#this step saves code typing as 3 lines in the above is one line here

# Complex functions

calcGDP <- function(dat) {
  gdp <- dat$pop * dat$gdpPercap
  return(gdp)
}

head(gapminder)

calcGDP(head(gapminder))

#adding more arguments

calcGDP <- function(dat, year = NULL, country = NULL) {
  if(!is.null(year)){
    dat <- dat[dat$year %in% year, ]
  }
  if(!is.null(country)){
    dat <- dat[dat$country %in% country, ]
  }
  gdp <- dat$pop * dat$gdpPercap
  
  new <- cbind(dat, gdp=gdp)
  return(new)
}

head(calcGDP(gapminder, country = "Australia"))

head(calcGDP(gapminder, country = "Australia", year = 2007))
#order matters if you are defining your input meaning if you put 2007 but not year = 2007 you will come back with 0. order is defined in the functions as seen with year and then country

unique(gapminder$country)
#this picks out all of the unique countries in the gapminder

