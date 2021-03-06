
## �ques es un modelo? es una representaci�n simple de la realidad, considerando a la realidad como algo muy complerjo de entender
## usamos un modelo para acotar la realidad y as� poderlo entender
## los modelos de machine learning sirven para resolver problemas del tipo: 
## 1.- prediccion, estimar un valor numerico con informaci�n previa | Los modelos que se pueden usar son todos los modelos de regresion linea, no lineal y multiple por ejemplo.
## 2.- clasificaci�n, clasificar o etiquetar en diferentes categorias a las observaciones, de acuerdo a informaci�n previa. Puede ser similar al de predicci�n | Los modelos que se pueden usar son arboles de decisi�n, KNN y regresi�n logistica
## 3.- clustering o analisis de clongomerado, tambi�n busca clasificar o etiquetar a las observaciones pero sin contar con informaci�n previa | Los modelos que se pueden usar son K-mean o clusteriring jerarquico

# ejemplo de predicci�n en R
# medida = a*dias + b. donde a=pendiente y b=intercepto
library(tidyverse)
data('Orange')

# cuanto medira la circunferencia en promedio de un arbol de naranjas a los 800 d�as de plantado?
Orange %>% 
  ggplot(aes(x= age, y= circumference)) +
  geom_point() + geom_abline(intercept = 10, slope = 0.1, color= 'blue') ## geom_abline dibuja la recta

# ajustar los parametros de la regresi�n lineal, el intercepto (b) y slope (a)
lm(circumference ~ age, data = Orange) # metodo de optimizaci�n de minimos cuadrados #

# graficando con los nuevos valores de a y b
Orange %>% 
  ggplot(aes(x= age, y= circumference)) +
  geom_point() + geom_abline(intercept = 17.3997, slope = 0.1068, color= 'blue') + ## geom_abline dibuja la recta
  geom_vline(xintercept= 800, color='red') # con geom_vline se dibuja la linea roja, y donde intercepta con la azul es la circinferencia que buscamos

# el dato exacto se puede calcular as�:
dias <- 800
medida <- 0.1068*dias + 17.3997 #asignamos los valores a la formula de medida y tenemos el valor exacto buscado
print(medida)
