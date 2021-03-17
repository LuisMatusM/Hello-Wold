# video 07 - factores

# Objetivo: estudiar qué son factores en R.
# ---------------
# En este ejercicio vamos a:
# 1. Crear factores en R
# 2. Recodificar niveles de un factor
# 3. Ordenar niveles de un factor


#####################################
# correr esto antes de empezar.   #
#####################################

# crear vector de ventas
tallas <- c('m', 'g', 'S', 'S','m', 'M')

# intentar graficar
plot(tallas)

###################################
# práctica 1: crear factores en R #
###################################

# crear factor de un vector
tallas_factor <- factor(tallas)

# graficar factor
plot(tallas_factor)

# mirar niveles de factor
levels(tallas_factor)

######################################
# práctica 2: recodificando factores #
######################################

# creando factor recodificado, se tienen que poner en el orden que están actual.
tallas_recodificado <- factor(tallas, levels = c('g', 'm', 'M','S'),
                              labels = c('G', 'M', 'M', 'S'))



# graficando ventas_recodificado
plot(tallas_recodificado)

#############################################
# práctica 3: ordenando niveles de factores #
#############################################

# ordenando niveles (copiar factor anterior) hay que acomodar los datos en levels y labels de acuerdo
# a como los quieras ordenar

tallas_ordenado <- factor(tallas, ordered = T, levels = c('S', 'm', 'M','g'),
                          labels = c('S', 'M', 'M', 'G'))



# viendo el orden en los niveles
levels(tallas_ordenado)
tallas_ordenado

# graficando el factor ordenado
plot(tallas_ordenado)
