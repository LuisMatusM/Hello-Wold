# T2V5 - histogramas en R

# Objetivo: graficar histogramas en r
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. histogramas con base graphics
# 2. histogramas con ggplot2

# cargando los datos
data("mtcars")

# haciendo histograma básico
hist(mtcars$hp)

# editando histograma
hist(mtcars$hp, breaks = seq(50,350,50), ## con breaks se ajustan los bin, seq ayuda a hacerlo ordenadamente
     col = 'darkgray', # cambia el color de la barra
     border = 'gray10', #cambia el color del borde de la barra
     main = 'carros x HP', #agrega el titulo a la gráfica
     ylab = 'cantidad', #agrega la etiqueta al eje y
     xlab = 'HP') #agrega la etiqueta al eje x

# cargar ggplot2
# install.packages("ggplot2")
library(ggplot2)

# hacer un histograma en ggplot2, en el aes solo se necesita 1 variable y se usa la geometria geom_histogram
ggplot(mtcars, aes(hp)) + geom_histogram(bins = 9)
ggplot(mtcars, aes(hp)) + geom_histogram(binwidth = 50) # investigar cual es la diferencia entre bins y binwidth
View(mtcars)
# haciendo más cosas interesantes
ggplot(mtcars, aes(hp, fill= factor(vs))) + #fill agrega otra varibles en el histograma y la usa para separar los datos
  geom_histogram(bins = 9, position = 'identity', alpha=0.8) + 
  labs(title = 'HP vs tipo de motor',
       fill ='por tipo de motor',
       x= 'caballos de fuerza',
       y='conteo',
       subtitle = 'gráfica comparativa',
       caption = 'datos de R')






# fin