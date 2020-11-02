
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







