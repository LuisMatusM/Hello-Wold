# T2V7 - importar datos csv a R

# Objetivo: aprender a importar archivos csv a R
# ------------------------------------------------
# En este ejercicio vamos a aprender:
# 1. Que necesitas antes de empezar
# 2. Cómo importar datos utilizando código de R
# 3. Cómo importar datos con la interfaz de RStudio


#####################################
# 1. Que necesitas antes de empezar #
#####################################

# instalar paquete readr
install.packages("readr")

# cargar paquete readr
library(readr)

# buscar la ruta del archivo de csv
file.choose()

# Copiar ruta de la consola y guardar en variable
ruta_csv <- "C:\\Users\\luisa\\Downloads\\casos_csv\\gapminder.csv"


#####################################
# 2. importar csv con código de R #
#####################################

# importar datos gapminder
gapminder <- read_csv(ruta_csv)

# mirar datos
gapminder

# caso no titulo
file.choose()
ruta_sin_titulo <- "C:\\Users\\luisa\\Downloads\\casos_csv\\gapminder_col_names.csv"
gapminder_sin_titulo <- read_csv(ruta_sin_titulo, col_names = F)

# para agregar nombre
gapminder_sin_titulo <- read_csv(ruta_sin_titulo, col_names = c('pais', 'anio', 'vida', 'población'))

# caso punto y coma
file.choose()
ruta_puntoycoma <- "C:\\Users\\luisa\\Downloads\\casos_csv\\gapminder_puntoycoma.csv"

gapminder_puntoycoma <- read_csv2(ruta_puntoycoma)

gapminder_puntoycoma

########################################
# 3. importar csv con interfaz RStudio #
########################################

# ir a File > Import Dataset > From Text (readr)

# código que genera y ejecuta R automáticamente



# fin