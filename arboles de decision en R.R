# el probelma a resolver en los arboles de decisión es, que queremos asignar una clase o categoria a observciones basados en variables independientes
install.packages('titanic')
library(tidyverse) #libreria de analisis de datos
library(titanic) #libreria de base de datos
data("titanic_train")
head(titanic_train)
# librerias para clasificacion
install.packages('rpart')
install.packages('rattle')
install.packages('rpart.plot')
library(rpart)
library(rattle)
library(rpart.plot)

#modelando con arboles de decisión
arbol <- rpart(
  formula = Survived ~ Sex + Age,
  data = titanic_train,
  method = 'class') #para que calcule con la clase

#graficando el arbol
fancyRpartPlot(arbol)

#prediciendo con el arbol
pred_arbol <- predict(arbol, type = 'class') #predict se utiliza para predecir o clasificar
titanic_pred <- cbind(titanic_train, pred_arbol) #juntamos la predicción a la data original

#un niño de 4 años sobreviviria?
predict(object = arbol,
        newdata = data.frame(Age=4, Sex='male'),
        type = 'class')

validar<-titanic_train$Survived==titanic_pred$pred_arbol
summary(validar)
titanic_validar <- cbind(titanic_pred, validar)
filter(titanic_validar,validar=='FALSE')
