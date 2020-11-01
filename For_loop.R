
## gapminder-analysis.R
## analysis with gapminder data
## J Lowndes lowneds@nceas.ucsb.edu

library(tidyverse)
library(gapminder)
gapminder


## filter the country plot

gap_to_plot <-  gapminder %>% 
  filter(country == "Afghanistan")

## plot

my_plot <-  ggplot(data = gap_to_plot, aes(x = year, y = gdpPercap)) +
  geom_point() +
   labs(title = "Afghanistan")

# use paste ---------------------------------------------------------------


gap_to_plot <-  gapminder %>% 
  filter(country == "Afghanistan")

## plot

my_plot <-  ggplot(data = gap_to_plot, aes(x = year, y = gdpPercap)) +
  
  geom_point() +
  ## add title and save
  
    labs(title = paste("Afghanistan", "GDP per capita", sep = " "))
     # the separater looks space

# And as a last step, let’s save this figure. -----------------------------


ap_to_plot <-  gapminder %>% 
  filter(country == "Afghanistan")

## plot

my_plot <-  ggplot(data = gap_to_plot, aes(x = year, y = gdpPercap)) +
  
  geom_point() +
  ## add title and save
  
  labs(title = paste("Afghanistan", "GDP per capita", sep = " "))

ggsave(filename= "Afghanistan_gdpPercap.png", plot = my_plot)








