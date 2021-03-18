install.packages('tidyverse')
library(tidyverse)
# T3V2 - manipulación de datos

# Objetivo: diferenciar formas de graficar en r
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. cargar datos de gapminder
# 2. filtrar datos
# 3. hacer resumenes de datos

################################
# 1. cargar datos de gapminder #
################################

# instalando paquete con los datos
install.packages("gapminder")

# cargando paquete con los datos
library(gapminder)

# cargando datos a entorno
data("gapminder")

# cargando datos a entorno
head(gapminder)

##############################
# 2. filtrar datos con dplyr #
##############################

# install.packages("tidyverse")
library(tidyverse)

# filtrar datos por pais sin %>% 
filter(gapminder, country== 'Mexico')

# filtrar datos por pais
# para hacer %>% en RStudio (cntrl + shift + M)
gapminder %>% 
  filter(country== 'Mexico')

# filtrar datos por año
gapminder %>% 
  filter(year == 2002)

# filtrar paises con esperanza de vida 
# menor o igual a 40 y el año en 2002
gapminder %>% 
  filter(lifeExp <=40,
         year== 2002)

###############################
# 3. hacer resumenes de datos #
###############################

# cantidad de paises en Asia
gapminder %>% 
  filter(continent== 'Asia', year== 2007) %>% # se agrega un segundo %>%  para agregar funciones
  summarise(conteo=n()) # se crea la varible conteo con la funación n() que sirve para contar

# maxima esparanza de vida
gapminder %>% 
  summarise(max_lifeExp = max(lifeExp)) #sin filtrar datos para tomar el max, se crea la variable y se usa la funció mac()

# agrupando esperanza de vida promedio por año
gapminder %>% 
  group_by(year) %>%  summarise(avg_lifeExp = mean(lifeExp)) #va primero la funcíon group_by
