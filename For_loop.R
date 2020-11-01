
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
  
  
 #  for (each item in set of items) {
  #  do a thing
  #  }
  
  
 ##Filter the country to plot
  
 ## create country variable 
  
cntry <- "Afghanistan" ##?

for (each cntry in a list of countries) {
  
  ## filter the country to plot
  
  gap_to_plot <-  gapminder %>% 
    
    filter(country == cntry) ## here is the key
  
  ## plot
  my_plot <-  ggplot(data = gap_to_plot, aes(x = year, y = gdpPercap)) +
    geom_point()+
    
    ## add title and save
    labs(title = paste(cntry,"GDP per capita", sep = " "))
  
  ggsave(filename = paste ("figures/", cntry, "_gdpPercap.png", sep = ""), plot = my_plot)
  
}

### how do we know if the contry variable is list??

## creat a list of countries

country_list <- c("Albania", "Fiji", "Spain")

for( cntry in country_list) {
  
  ## filter the country to plot
  
  gap_to_plot <- gapminder %>% 
    
    filter(country == cntry) # it looks only Afganistan is assigned to cntry vector
  
  ## plot
  
  my_plot <-  ggplot(data = gap_to_plot, aes(x = year, y = gdbPercap)) +
    
    geom_point() +
    
    labs(title = paste(cntry, "GDP per capita", sep = " "))
  
  ggsave(filename = paste()
  
  
}


# Working loop ------------------------------------------------------------

dir.create("figures")

## create a list of countries

country_list <-  unique(gapminder$country) #?unique() returns th eunique values.

##country has a repeated value(name) when we use unique, but with duplicate elements
#rows removed


for (cntry in country_list) {
  
  ## filter the country to plot
  
  gap_to_plot <- gapminder %>% 
    filter (country == cntry)
  
  #plot
  
  my_plot <-  ggplot(data = gap_to_plot, aes(x= year, y = gdpPercap)) +
    
    geom_point()+
    
    labs(title = paste(cntry, "GDP per capita", sep = " "))

  ggsave(filename = paste("figures/", cntry, "_gdpPercap.png", sep = ""), plot= my_plot)
  
}


dir.create("figures_Europe")

gap_europe<-gapminder %>% 
  
  filter(continent == "Europe") %>% 
  
  mutate(gdpPercap_mean = dplyr::cummean(gdpPercap))

country_list <- unique(gap_europe$country)

for(cntry in country_list) {
  
  gap_to_plot <- gap_europe %>% 
  
  filter(country == cntry)
  
  ## add a print message to see what's plotting
  
  print(paste("Plotting", cntry))
  
  ## plot
  
  my_plot <-  ggplot(data = gap_to_plot, aes(x = year, y = gdpPercap_mean)) +
    
    geom_point()+
    
    ## add title and save
    
    labs(title = paste(cntry, "GDP per capita", sep = " "))
  
  ggsave(filename  = paste ("figures_Europe/", cntry,  "_gdpPercap_mean.png" , sep = " " ))
  
  plot = my_plot

}
## this code is not working and couldn't figure out the error  
  

est <- readr::read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/countries_estimated.csv')


gapminder_est<-left_join(gapminder, est)






