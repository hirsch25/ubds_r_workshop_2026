library(dplyr)
#dplyr is within in the broader family of the tidyverse set of packages, which are designed to work well together
#we are going to review a few different common dpylr functions today

mean(gapminder$gdpPercap[gapminder$continent == "Africa"])
mean(gapminder$gdpPercap[gapminder$continent == "Americas"])
#this is going to take forever doing this for each continent

#first we are going to talk about select function
#keeping (or removing) specific columns from a data frame

year_country_gdp <- dplyr::select(gapminder, year, country, gdpPercap)
head(year_country_gdp)
#head allows you to take a peak at your data without have to open the whole thing

smaller_gapminder_data <- select(gapminder, -continent)
head(smaller_gapminder_data)

#ability to use pipes: %>% is a pipe, passes data through functions from left to right
#Example: output <- df %>% function1() %>% function2() . . .
#reduces code size and keeps from typos

year_country_gdp2 <- gapminder %>% select(year, country, gdpPercap)
head(year_country_gdp2)

#can add and subtract column names at the same time
tidy_gdp <- year_country_gdp2 %>% rename(gdp_per_capita = gdpPercap)
head(tidy_gdp)

#filter function: select pulls columns, filter pulls rows
#filtering for countries just in europe
year_country_gdp_euro <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap)
head(year_country_gdp_euro)
#filter first and then select columns
  
#challenge filter for continent and the year 2007 and select for country and lifeExp
year_continent_country_lifeexp <- gapminder %>%
  filter(continent == "Europe", year == 2007) %>%
  select(country, lifeExp)
head(year_continent_country_lifeexp)

#group_by function: this function is useful with other functions. aggregates the df without breaking into a bunch of objects. It remembers how you want your data split

str(gapminder)

str(gapminder %>% group_by(continent))

#summarize function - can take an output but compress it
gdp_by_continent <- gapminder %>%
  group_by(continent) %>%
  summarise(mean_gdpPercap = mean(gdpPercap))
gdp_by_continent

#group by multiple variables at the same time
gdp_by_continent_year <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap))
head(gdp_by_continent_year)

#Note: this is long format data but there is a way to get long to wide and vis versa)

#calculate multiple summary statistics
gdp_pop_by_continent_by_year <- gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop))
head(gdp_pop_by_continent_by_year, n = 10)

# count and n functions
# count is going to return the count of rows within a df based on a grouping variable
# n works inside other functions (like summarize) to return the number of observations in a specific context

gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)

gapminder %>%
  group_by(continent) %>%
  summarize(se_le = sd(lifeExp)/sqrt(n()))

#can also use min and max to pull the highest or lowest value within a group

#mutate function: will create a new variable within the existing df based on other variables

gdp_pop_by_continent_by_year <- gapminder %>%
  mutate(gdp_billion = gdpPercap * pop / 10^9) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_per_billion = mean(gdp_billion),
            sd_per_billion = sd(gdp_billion))
head(gdp_pop_by_continent_by_year)

#combining this with ifelse

gdp_pop_by_continent_by_year_above25 <- gapminder %>%
  mutate(gdp_billion = ifelse(lifeExp > 25, gdpPercap * pop / 10^9, NA)) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_per_billion = mean(gdp_billion),
            sd_per_billion = sd(gdp_billion))
head(gdp_pop_by_continent_by_year_above25)

#adding what we have learned into ggplot (ggplot + dplyr)

gapminder %>%
  filter(continent == "Americas") %>%
  ggplot(mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))




