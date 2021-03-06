install.packages('gganimate')
install.packages('gifski')
library(tidyverse)
library(gganimate)
library(gifski)
library(gapminder)
data("gapminder")
head(gapminder)
########
## 1.- gr�fica b�sica
gapminder %>% 
  group_by(year, continent) %>% 
  summarise(mean_life_exp = mean(lifeExp)) %>% # hasta esta parte se hace con dplyr
  ggplot(aes(x=year,
             y=mean_life_exp,
             color=continent)) + geom_line(size=1.1) # con ggplot2 hacemos la gr�fica. size en geom_linea ajusta el grosor de la linea

## 2.- animando la gr�fica
gapminder %>% 
  group_by(year, continent) %>% 
  summarise(mean_life_exp = mean(lifeExp)) %>% 
  ggplot(aes(x=year,
             y=mean_life_exp,
             color=continent)) + geom_line(size=1.1) +
  transition_reveal(year) # esta es la funci�n de gganimate

## 3.-mejorando la gr�fica
gapminder %>% 
  group_by(year, continent) %>% 
  summarise(mean_life_exp = mean(lifeExp)) %>% 
  ggplot(aes(x=year,
             y=mean_life_exp,
             color=continent)) + geom_line(size=1.1) + geom_point(size=3) + 
  labs(title = 'Esperanza de vida en {frame_along}',
       x = 'A�o',
       y = 'A�os de vida') + theme_minimal() +
  transition_reveal(year)
