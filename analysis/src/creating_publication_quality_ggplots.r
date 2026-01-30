#ggplot and gapminder

library(ggplot2)

#ggplot2 is a widely used R library for plotting data, publication quality figures require customization, R offers multiple plotting systems, it is layered and reproducible

#learn more at: https://ggplot2.tidyverse.org

#initializing a plot: ggplot(data = gapminder) creates a plot object
#data are defined globally
#aes() links data to visuals, x,y, color, group; column names are referenced directly
#geoms control how data appears: geom_point() for scatterplots, geom_line() for trends over time, layers are added with +, order of layers matters

gapminder <- read.csv("data/gapminder_data.csv")

ggplot(data = gapminder)
#this shows you a plot thats blank

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
#this gives you x and y axis and labels but no dots or lines

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + geom_point()
#this gives us some dots and points which is showing us the shape of this data looking at gdpPercap with lifeexp

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) + geom_point()
#this gives you years as x and life expectancy as y

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent)) + geom_line()
#this gives color by each area to continent

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country, color = continent)) + geom_line()
#grouped by country, color coded by continent, with lifeexp compared to year

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, group = country, color = continent)) + geom_line() + geom_point()
#this adds points as well

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     group = country)) +
  geom_line(mapping = aes(color = continent)) +
  geom_point()
#this only maps the color to the continent lines not the points as well
#if geom_point is before geom_line the points will be in the background and the lines in the foreground

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     group = country)) +
  geom_point() +
  geom_line(mapping = aes(color = continent))
#AFTERNOON SESSION
#Transformations and Statistics
#alpha helps with overplotting, and geom_smooth() overlays models
#faceting for multi-panel plots: splits data into panels, one panel per group, reduces clutter in dense plots, useful for comparisons across categories
#Labels, themes, and exporting plots: axis labels should be human-readable, titles and legends clarify intent, labs(), theme(), ggsave()

#Original plot
ggplot(data = gapminder, mapping = aes(x = gdpPercap,
                                       y = lifeExp)) +
  geom_point()

#Scaling and alpha:
#to control for outliers - alpha or scale function to help better visualize distribution

ggplot(data = gapminder, mapping = aes(x = gdpPercap,
                                       y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()
#scale on the x in log base 10

#looking into geom_smooth: fits a relationship in a simple way to our points
#Use lm method with geom_smooth
ggplot(data = gapminder, mapping = aes(x = gdpPercap,
                                       y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method = "lm")
#this adds a line to fit against our data

ggplot(data = gapminder, mapping = aes(x = gdpPercap,
                                       y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method = "lm",
                                                          linewidth = 1.5)

#Creating a multipanel plot
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x = year,
                                      y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))
#angle changes the angle of the x text
#facet_wrap makes this graph for each country in the americas

#Adding labels, legends, etc
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x = year,
                                      y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1")
#labs added the labels as mentioned in the x,y, and title

#adding colors
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x = year,
                                      y = lifeExp,
                                      color = continent)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1",
       color = "Continent")

#theme_minimal
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x = year,
                                      y = lifeExp,
                                      color = continent)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1",
       color = "Continent") +
  theme_minimal()

#exporting this file 
#(setting the above to a variable)
life_exp_plot <- ggplot(data = americas, mapping = aes(x = year,
                                                       y = lifeExp,
                                                       color = continent)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1",
       color = "Continent") +
  theme_minimal()

#exporting as png
ggsave(filename = "results/life_exp.png",
       plot = life_exp_plot,
       width = 12,
       height = 10,
       dpi = 300,
       units = "cm")

#Note: getwd() is the equivalent of pwd in terminal

