## Analisis exploratorio de Datos EDA (Exploratory Data Analisys)
#En un esquema general un EDA se componone de Hacer pregunas -> EDA -> Dar conclusiones
# la parte del EDA se puede dividir en 1.- Transformar y limpiar los datos, 2.- Generar tablas resumen y 3.- Crear gráficos explicativos
#
# Algunas Técnicas de EDA, se puede usar como un 1° checklist para el EDA
# 1.- Resumenes estadisticos - se usan estadisticas resumen como:
#     conteo o número de mediciones
#     Media y mediana
#     error o desviación tipica/estandar
#     mínimo y máximo
#     en R lo podemos hacer con la función summary()
# 2.- Distribuciones de frecuencia - la frecuencia es la cantidad de veces que se repite una cosa
#     un Histograma representa en barras la distribución de la frecuencia
#     en R se puede graficar con hist() del paquete básico o con ggplot2 geom_hist() y geom_density()
# 3.- Percentiles y boxplots - se utilizan para medir la distribución acumulada y se agrupan en 3 grupos
#     Mediana.- divide la distribución en 2, mide hasta que número de la distribución se acumula el 50% de los datos
#     Cuartil.- divide la distribución en 4 Q1(25%), Q2(50%), Q3(75%). 
#     Percentil.- divide la distribución en cien. Este junto con el cuartil se representa mediante un boxplot
#     en R podemos hacer un boxplot con boxplot() del paquete básico o con ggplot2 con geom_boxplot() y geom_violin()
# 4.- Correlaciones y dispersion
#     La correlación representa asociación o dependencia que puede ser causal o no (la correlación no implica causalidad)
#     lo que significa que si bien hay correlación entre variables no existe causa y efecto o que una afecte la otra 
#     La correlación lineal es la mas sencilla de estudiar y puede ser un indicio de que hay un modelo lineal detras
#     ¿como identificar una correlación?, con tablas como una matriz de correlación o con gráficas como gráficas de puntos y pares
#     o una gráfica de matriz de correlación
#     en R se pueden hacer con pairs(grafica todas las variables continuas vs todas las variables continuas) y corr(cálcula la correlación estadistica entre cada una de las variables) del paquete básico
#     con ggplot2 con geom_point y geom_smooth. Con el paquete corrplot y corrplot() o el paquete PerformanceAnalytics y chart.Correlation()
