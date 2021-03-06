## Analisis exploratorio de Datos EDA (Exploratory Data Analisys)
#En un esquema general un EDA se componone de Hacer pregunas -> EDA -> Dar conclusiones
# la parte del EDA se puede dividir en 1.- Transformar y limpiar los datos, 2.- Generar tablas resumen y 3.- Crear gr�ficos explicativos
#
# Algunas T�cnicas de EDA, se puede usar como un 1� checklist para el EDA
# 1.- Resumenes estadisticos - se usan estadisticas resumen como:
#     conteo o n�mero de mediciones
#     Media y mediana
#     error o desviaci�n tipica/estandar
#     m�nimo y m�ximo
#     en R lo podemos hacer con la funci�n summary()
# 2.- Distribuciones de frecuencia - la frecuencia es la cantidad de veces que se repite una cosa
#     un Histograma representa en barras la distribuci�n de la frecuencia
#     en R se puede graficar con hist() del paquete b�sico o con ggplot2 geom_hist() y geom_density()
# 3.- Percentiles y boxplots - se utilizan para medir la distribuci�n acumulada y se agrupan en 3 grupos
#     Mediana.- divide la distribuci�n en 2, mide hasta que n�mero de la distribuci�n se acumula el 50% de los datos
#     Cuartil.- divide la distribuci�n en 4 Q1(25%), Q2(50%), Q3(75%). 
#     Percentil.- divide la distribuci�n en cien. Este junto con el cuartil se representa mediante un boxplot
#     en R podemos hacer un boxplot con boxplot() del paquete b�sico o con ggplot2 con geom_boxplot() y geom_violin()
# 4.- Correlaciones y dispersion
#     La correlaci�n representa asociaci�n o dependencia que puede ser causal o no (la correlaci�n no implica causalidad)
#     lo que significa que si bien hay correlaci�n entre variables no existe causa y efecto o que una afecte la otra 
#     La correlaci�n lineal es la mas sencilla de estudiar y puede ser un indicio de que hay un modelo lineal detras
#     �como identificar una correlaci�n?, con tablas como una matriz de correlaci�n o con gr�ficas como gr�ficas de puntos y pares
#     o una gr�fica de matriz de correlaci�n
#     en R se pueden hacer con pairs(grafica todas las variables continuas vs todas las variables continuas) y corr(c�lcula la correlaci�n estadistica entre cada una de las variables) del paquete b�sico
#     con ggplot2 con geom_point y geom_smooth. Con el paquete corrplot y corrplot() o el paquete PerformanceAnalytics y chart.Correlation()
