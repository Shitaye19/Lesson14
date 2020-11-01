
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


##Create country variable 

cntry<- "Afghanistan"


##Create country variable 

cntry<- "Afghanistan"

##filter the country to plot 

gap_to_plot <-  gapminder %>% 
  
  filter(country == cntry)
#plot

my_plot <- ggplot(data = gap_to_plot, aes(x = year, y = gdpPercap))+
  geom_point()+
  
## add title and save 
  
  labs(title = paste(cntry, "GDP per capita", sep = " "))

## note: there are many ways to create filenames with paste() or file.path(); we are doing this way for a reason.
  
  ggsave(filename = paste(cntry, "_gdpPercap.png", sep = " "), plot = my_plot)
  
  
  
  
  
  












