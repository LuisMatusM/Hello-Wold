library(ggplot2)
data('iris')
head(iris)

#ejemplo 1 con puntos y lineas
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + #color = Species para que los puntos cambien de colo dependiendo de la especie
  geom_point() + geom_smooth(method = lm) #geom_smoth agrega una linea de tendencia para cada especie, 
#si se cambia el method a method=lm hace una linea de tendencia de tipo regresión lineal

#ejemplo 2 varias lineas
#con una linea
ggplot(iris[iris$Species=='setosa',], aes(x=1:50, y= Petal.Width)) + #con la seleccíión de iris$Species=='setosa' solo tomamos la información de esa especie
  geom_line() #geom_line es la geometria de línea

#con todas la lineas de especies
ggplot(iris, aes(x=rep(1:50,3), y= Petal.Width, color=Species)) + #ajustando el aes con X=rep(1:50,3) repetimos el vector 3 veces, una para cada especie. 
                                                                  # con color=Species lo separamos en 3 lineas distintas
  geom_line()

#ejemplo 3 boxplot con puntos. Sirve para estudiat la distribución de una variable con respecto a distintas categorias
ggplot(iris, aes(x= Species, y=Petal.Width, fill= Species)) + # con fill separamos las cajas por especie
  geom_boxplot() + geom_jitter() #en el boxplot vemos la distribución por especia, muesta la mediana de cada caja con una linea y los puntos fuera de los rangos son los outliners
#con jitter nos agrega los puntos sobre cada caja para ver mejor la distribución