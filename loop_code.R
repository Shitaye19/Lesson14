
#install.packages("gapminder")

library(gapminder)
library(tidyverse)


View(gapminder)


##write some code which works for a single variable and then you can authomate for others

cntry<- "Afghanistan"
#Then replace every place that satys Afghanistan

gap_to_plot <-  gapminder %>% 
  filter(country== cntry)

my_plot <- ggplot(data = gap_to_plot, aes(x = year, y = gdpPercap))+

geom_point()+
  
  labs(title = paste(cntry, "GDP per capita", sep = " "))

ggsave(filename = paste(cntry, "_gdpPercap.png",  sep = ""), plot = my_plot)

##we are writing Afghanistan 3 times a lot of typing.


for(each item in set of items){
  
  do a thing with that item
  
}

#country_list <-  c("Albania", "Fiji", "Spain")

for(cntry in country_list){
  print(cntry)
}
#######

for(cntry in country_list){
  
  
  gap_to_plot <-  gapminder %>% 
    
    filter(country== cntry)
  
  my_plot <- ggplot(data = gap_to_plot, aes(x = year, y = gdpPercap))+
    
    geom_point()+
    
    labs(title = paste(cntry, "GDP per capita", sep = " "))
  
  ggsave(filename = paste(cntry, "_gdpPercap.png",  sep = ""), plot = my_plot) 
  
}

##you can click code and Reindent lines

##to create a figures folder

dir.create("figures")


country_list <-  unique(gapminder$country)

for(cntry in country_list){
  
  
  gap_to_plot <-  gapminder %>% 
    
    filter(country== cntry)
  
  my_plot <- ggplot(data = gap_to_plot, aes(x = year, y = gdpPercap))+
    
    geom_point()+
    
    labs(title = paste(cntry, "GDP per capita", sep = " "))
  
  ggsave(filename = paste("figures/", cntry, "_gdpPercap.png",  sep = ""), plot = my_plot) 
  
}


dir.create("figures/") # create this directory first
dir.create("figures/Europe/") # I can not do this 

gap_to_europe<-gapminder %>% 
  
  filter(continent=="Europe") %>% 
  
  mutate(gdp_Tot = (gdpPercap*pop)) 

country_list <- unique(gap_to_europe$country)

for (cntry in country_list){
  
  #gap_to_plot <- gap_to_europe %>% 
  
  #filter(country ==cntry)
  
  my_plotEu<- ggplot(data = gap_to_europe, aes(x = year, y = gdp_Tot))+
    
    geom_point()+
    
    labs(title = (paste(cntry, "Total GDP", sep = " ")))
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = "" ), 
         plot = my_plotEu)
  
}



# Lesson 15 ---------------------------------------------------------------

# you can run source("yoursource")

est <- readr::read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/countries_estimated.csv')
gapminder_est <- left_join(gapminder, est)


dir.create("figures/") # create this directory first
dir.create("figures/Europe/") # I can not do this 

gap_to_europe<-gapminder_est %>% 
  
  filter(continent=="Europe") %>% 
  
  mutate(gdp_Tot = (gdpPercap*pop)) 

country_list <- unique(gap_to_europe$country)

for (cntry in country_list){ #cntry = country_list
  #gap_to_plot <- gap_to_europe %>% 
  
  #filter(country ==cntry)
  
  my_plot<- ggplot(data = gap_to_europe, aes(x = year, y = gdp_Tot))+
    
    geom_point()+
    
    labs(title = (paste(cntry, "Total GDP", sep = " ")))
  
  if (any(gap_to_plot$estimated == "yes")){ # I will not get the 
    
    print(paste(cntry, "data are estimated"))
    
    my_plot<- my_plot +
      
      labs(subtitle = "Estimated data")
    
  } else if (any(gap_to_plot$estimated == "no")){
    
    print(paste(cntry, "data are reported"))
    
    my_plot <-  my_plot +
      
      labs(subtitle = "Reported data")
    
  }
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = "" ), 
         plot = my_plot)
  
}


## we know that the estimated is yes or No.
#we use else if a lot of typing here 



gap_to_europe<-gapminder_est %>% 
  
  filter(continent=="Europe") %>% 
  
  mutate(gdp_Tot = (gdpPercap*pop)) 

country_list <- unique(gap_to_europe$country)

for (cntry in country_list){ #cntry = country_list
  
  gap_to_plot <- gap_to_europe %>% 
  
  #filter(country ==cntry)
  
    print(paste(cntry, "data are estimated"))
    
  my_plot<- ggplot(data = gap_to_europe, aes(x = year, y = gdp_Tot))+
    
    geom_point()+
    
      labs(title = paste(cntry, "GDP per capita", sep = " "))
    
  
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = "" ), 
         plot = my_plot)
  
}




# Index for loops ---------------------------------------------------------


for (i in 1:10) {
  
  print(paste("Part_", i, sep = ""))
  
}


gapminder$gdpTotal <-  vector(length = nrow(gapminder))

for (i in 1:nrow(gapminder)) {
  
  gapminder$gdpTotal[i] <- gapminder$gdpPercap[i] * gapminder$pop[i]
}

##length works for a vector and nrow that works for dataframe.



gap_to_europe<-gapminder_est %>% 
  
  filter(continent=="Europe") %>% 
  
  mutate(gdp_Tot = (gdpPercap*pop)) 

save_plot <- function(cntry) {
  
  # the only thing that changes in our four loop is cntry

  
  gap_to_plot <- gap_to_europe %>% 
    
    #filter(country ==cntry)
    
    print(paste(cntry, "data are estimated"))
  
  my_plot<- ggplot(data = gap_to_europe, aes(x = year, y = gdp_Tot))+
    
    geom_point()+
    
    labs(title = paste(cntry, "GDP per capita", sep = " "))
  
  
  
  ggsave(filename = paste("figures/Europe/", cntry, "_gdpTot.png", sep = "" ), 
         plot = my_plot)
  
}

save_plot("Belgium")

## now change it what it statistics it adds



gap_to_europe<-gapminder_est %>% 
  
  filter(continent=="Europe") %>% 
  
  mutate(gdp_Tot = (gdpPercap*pop)) 

#cntry = "Albania"

save_plot <- function(cntry, stat) { #add stat if you want addtional value changing
  
  # the only thing that changes in our four loop is cntry
  
  
  gap_to_plot <- gap_to_europe %>% 
    
    filter(country ==cntry)
    
    print(paste("Plotting", cntry))
  
  my_plot<- ggplot(data = gap_to_plot, aes(x = year, y = get(stat)))+ # the get function pop is not anobject you get error
    
    geom_point()+
    
    labs(title = paste(cntry, "GDP per capita", sep = " "), subtitle = ifelse(any(gap_to_plot$estimated == "yes"),
                                                                              "Estimated data", "Reported data"),
                                                                           y = stat )
  
  
  
  ggsave(filename = paste("figures/Europe/", cntry, "_", stat, ".png", sep = "" ), 
         plot = my_plot)
  
}

save_plot("Belgium","pop")

#stat <- "pop


gap_to_europe<-gapminder_est %>% 
  
  filter(continent=="Europe") %>% 
  
  mutate(gdp_Tot = (gdpPercap * pop)) 

save_plot <- function(cntry, stat = "gdpPercap") {  
  
  
  gap_to_plot <- gap_to_europe %>% 
    
    filter(country ==cntry)
  
  print(paste("Plotting", cntry))
  
  my_plot<- ggplot(data = gap_to_plot, aes(x = year, y = get(stat)))+ # the get function pop is not anobject you get error
    
    geom_point()+
    
    labs(title = paste(cntry, "GDP per capita", sep = " "), subtitle = ifelse(any(gap_to_plot$estimated == "yes"),
                                                                              "Estimated data", "Reported data"),
         y = stat )
  
  
  
  ggsave(filename = paste("figures/Europe/", cntry, "_", stat, ".png", sep = "" ), 
         plot = my_plot)
  
}

save_plot("Belgium","pop")



###
gap_to_europe<-gapminder_est %>% 
  
  filter(continent=="Europe") %>% 
  
  mutate(gdp_Tot = (gdpPercap * pop)) 

save_plot <- function(cntry, stat = "gdpPercap", filetype = "pdf") {  
  
  
  gap_to_plot <- gap_to_europe %>% 
    
    filter(country ==cntry)
  
  print(paste("Plotting", cntry))
  
  my_plot<- ggplot(data = gap_to_plot, aes(x = year, y = get(stat)))+ # the get function pop is not anobject you get error
    
    geom_point()+
    
    labs(title = paste(cntry, "GDP per capita", sep = " "), subtitle = ifelse(any(gap_to_plot$estimated == "yes"),
                                                                              "Estimated data", "Reported data"),
         y = stat )
  
  
  
  ggsave(filename = paste("figures/Europe/", cntry, "_", stat, ".",  filetype, sep = "" ), 
         plot = my_plot)
  
} # the dote must be there for the file name

save_plot("Belgium", "lifeExp","pdf")




