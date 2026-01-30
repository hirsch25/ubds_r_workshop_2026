#Saving Plots

library(ggplot2)

ggplot(gapminder,
       aes(x = year, y = lifeExp,
           color = country)) +
  geom_line() +
  theme(legend.position = "none")


#now to save the most recent data plot
ggsave("most_recent_gapminder_plot.pdf")
#this is only going to save the most recent plot

#can also go into the plot and export as . . .and where you want to save it to

#save PDF

pdf("plot_from_function_pdf_gapminder.pdf",
    width = 12, height = 4)
#this initializes the pdf but you have to add the data into this

pdf("plot_from_function_pdf_gapminder.pdf",
    width = 12, height = 4)
ggplot(gapminder, aes(x=year,
                      y=lifeExp,
                      color = country)) +
  geom_line() +
  theme(legend.position = "none")

dev.off()
#dev.off adds the graph to the pdf, very helpful for publication

pdf("plot_from_func_pdf_gapminder_2.pdf",
    width = 12,
    height = 4,
    pointsize = 12,
    family = "sans")

ggplot(gapminder, aes(x=year,
                      y=lifeExp,
                      color = country)) +
  geom_line() +
  theme(legend.position = "none")

dev.off()
#added pointsize and family

#creating multiple plots in one pdf

pdf("multi_page.pdf", width = 10, height = 6)

#plot 1
plot(x = 1:10, y = 1:10)

#plot 2
plot(x = 1:10, y = (1:10)^2)

#plot 3
plot(x = 1:10, y = sqrt(1:10))

dev.off()

#svg, jpeg, png

svg()

jpeg()

png()

#do the same thing but save in a different file format


