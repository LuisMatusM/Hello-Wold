# video 08 - dataframes

# Objetivo: estudiar qu� son dataframes en R.
# ---------------
# En este ejercicio vamos a:
# 1. Crear dataframes en R
# 2. Ordenar dataframes por columnas
# 3. Seleccionar elementos de un dataframe

#####################################
# correr esto antes de empezar.   #
#####################################

# vectores sobre peliculas de Shrek
nombre <- c("Shrek", "Shrek 2", "Shrek Tercero", "Shrek: Felices por siempre")
puntuacion <- c(7.9, 7.2, 6.1, 6.3)
posterior_2005 <- c(FALSE, FALSE, TRUE, TRUE)

#######################################
# pr�ctica 1: crear un dataframe en R #
#######################################

# crear dataframe de vectores
peliculas_df <- data.frame(nombre, puntuacion, posterior_2005)



# mostrar dataframe
peliculas_df

# cambiar nombre de dataframe
names(peliculas_df) <- c('NOMBRE', 'PUNTUACI�N', 'POSTERIOR_2005')



# mostrar dataframe (s�, otra vez)
peliculas_df

#####################################################
# pr�ctica 2: Seleccionar elementos de un dataframe #
#####################################################

# seleccionar un elemento del dataframe
peliculas_df[3,2]
peliculas_df[3,'PUNTUACI�N']

# seleccionar m�s de un elemento del dataframe
peliculas_df[c(3,2), c(2,3)]


# seleccionar una fila o rengl�n del dataframe
peliculas_df[2,]

# seleccionar una columna del dataframe

peliculas_df[,2]
peliculas_df[,'PUNTUACI�N']
peliculas_df$PUNTUACI�N
#################################
# pr�ctica 3: ordenar dataframe #
#################################

# mostrar el dataframe

peliculas_df
# mostrar el indice de la columna de puntuacion con order
order(peliculas_df$PUNTUACI�N)

# funcion order (menor a mayor)
order_menor_mayor <- order(peliculas_df$PUNTUACI�N, decreasing=F)


# mostrar el dataframe ordenado
peliculas_df[order_menor_mayor,]

# funcion order (mayor a menor)

order_mayor_menor <- order(peliculas_df$PUNTUACI�N, decreasing=T)

# mostrar el dataframe ordenado
peliculas_df[order_mayor_menor,]

# guardar el dataframe ordenado
df_ordenado <- peliculas_df[order_mayor_menor,]

