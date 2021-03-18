# T2V4 - graficar en R

# Objetivo: diferenciar formas de graficar en r
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. graficar con base graphics
# 2. graficar con ggplot2

# datos de la primera parte
year <- c('2010', '2011', '2012', '2013', '2014', '2015', '2016', '2017', '2018')
disney <- c(11, 13, 11, 8, 12, 11, 12, 8, 10)

# graficando con codigo
plot(x=year, y=disney) #la forma mas básica para hacer una gráfica, se designan las variables x & y

# editando la grafica
plot(x=year, y=disney,
     main = 'Disney', #agregar título
     xlab = '', #agregar nombre del eje x
     ylab = '', #agregar nombre del eje y
     col = 'cornflowerblue', #cambiar color de la gráfica 
     pch = 16, #ajustar el tamaño de los puntos
     panel.first = grid()) #agregar el grid 

barplot(disney, names.arg = year)
hist(disney)
pie(disney, labels = names(year))





# Graficas con ggplot2
# install.package(ggplot2) # para instalar ggplot2
library(ggplot2)

# hacer dataframe
peliculas <- data.frame(year, 
                        disney)

# graficar utilizando ggplot
ggplot(peliculas, aes(x=year, y=disney)) +
  geom_point() + labs(title = 'Disney')
# geom_point es la geometria e grafica de puntos en ggplot2
#labs es la función para modificar los titulos de la grafica, hay que buscar como se llaman todos.



# fin