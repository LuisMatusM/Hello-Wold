install.packages('gganimate')
install.packages('gifski')
library(tidyverse)
library(gganimate)
library(gifski)
library(gapminder)
data("gapminder")
head(gapminder)
########
## 1.- gráfica básica
gapminder %>% 
  group_by(year, continent) %>% 
  summarise(mean_life_exp = mean(lifeExp)) %>% # hasta esta parte se hace con dplyr
  ggplot(aes(x=year,
             y=mean_life_exp,
             color=continent)) + geom_line(size=1.1) # con ggplot2 hacemos la gráfica. size en geom_linea ajusta el grosor de la linea

## 2.- animando la gráfica
gapminder %>% 
  group_by(year, continent) %>% 
  summarise(mean_life_exp = mean(lifeExp)) %>% 
  ggplot(aes(x=year,
             y=mean_life_exp,
             color=continent)) + geom_line(size=1.1) +
  transition_reveal(year) # esta es la función de gganimate

## 3.-mejorando la gráfica
gapminder %>% 
  group_by(year, continent) %>% 
  summarise(mean_life_exp = mean(lifeExp)) %>% 
  ggplot(aes(x=year,
             y=mean_life_exp,
             color=continent)) + geom_line(size=1.1) + geom_point(size=3) + 
  labs(title = 'Esperanza de vida en {frame_along}',
       x = 'Año',
       y = 'Años de vida') + theme_minimal() +
  transition_reveal(year)
