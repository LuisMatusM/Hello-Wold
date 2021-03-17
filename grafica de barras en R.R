# T2V5 - graficas de barras en R

# Objetivo: hacer graficas de barras en r
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. graficas de barras con base graphics
# 2. graficas de barras con ggplot2

# cargando los datos
data("mtcars")

# viendo los datos
head(mtcars)
# generando tabla agrupada
table(mtcars$cyl)

# grafica de barras basica
barplot(table(mtcars$cyl))

# editando grafica de barras
barplot(table(mtcars$cyl),
        horiz = 'T',  # para hacer las barras horizontales
        col = 'green', #color
      border = 'red', #borde
      main = 'grafica de barras por cilindros', #titulo
      sub = 'prueba 1', #subtitulo
      xlab = 'cilindros', #leyenda eje x
      ylab = 'cantidad') #leyenda eje y



# cargar ggplot2
# install.packages("ggplot2")
library(ggplot2)

# grafica de barras

ggplot(mtcars, aes(cyl)) + geom_bar()
ggplot(mtcars, aes(factor(cyl))) + geom_bar() #usando factor ajusta el eje x a solo los cyl que hay
ggplot(mtcars, aes(factor(cyl))) + geom_bar() + coord_flip() #coord_flip cambia coordenadas entre x & y

# guardando grafica en variable, la parte más básica de la gráfica el dataframe y los aesthetics

p <- ggplot(mtcars, aes(factor(cyl), fill = factor(gear)))

# stacked bar chart
p + geom_bar(position = 'stack', stat = 'count')

# dogde bar chart
p + geom_bar(position = 'dodge', stat = 'count')

# stacked + percent barchart
p + geom_bar(position = 'fill', stat = 'count')
