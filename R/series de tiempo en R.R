#librerias a usar
library(tidyverse)
library(lubridate)

# leer el csv
file.choose()
raw_data <- read_csv("C:\\Users\\luisa\\Downloads\\2020-02.csv")

# procesando datos con dplyer y lubridate
viajes_diarios <- raw_data %>% 
  mutate(fecha_hora = dmy_hms(paste(Fecha_Retiro, Hora_Retiro))) %>%  # se crea nueva variable, dmy_hms convierte a formato fecha es de lubridate
  filter(fecha_hora >= as.Date('2020-02-24'),
         fecha_hora <= as.Date('2020-02-27')) %>% 
    group_by(horas = floor_date(fecha_hora, unit = 'hour')) %>% # agrupamos por horas
    summarise(conteo = n()) # sumamos y agrupamos

# checando el dataset que se creo, hay horas donde no se usó ninguna bici y no aparecen, para poder hacer un mejor analisis 
# hay que ajustarlo, R no lo hace por si solo
horas_completas <- data.frame( horas = seq(floor_date(min(viajes_diarios$horas), unit= 'hour'),
                                           floor_date(max(viajes_diarios$horas), unit = 'hour'),
                                           by= 'hour'))

# para unir los dataframe de las horas completas y el dataframe de viajes diarios usamos un left join de dplyer
viajes_hora <- horas_completas %>% 
  group_by(horas_redondeadas = floor_date(horas, unit = 'hour')) %>% 
  left_join(viajes_diarios) %>% 
  mutate(conteo = ifelse(is.na(conteo),0, conteo))

# hacemos una grafica de lineas inicial
ggplot(viajes_diarios, aes(x=horas, y=conteo)) + geom_line()


# modelo ARIMA 
# AR: "regresión" sobre si mismo, es AUTOREGRESIVO
# I: diferencias, CUANTO CAAMBIA CON LOS OTROS DIAS
# MA: tiene que ver con los "errores", TIENE QUE VER CON LA MEDIA MOVIL Y EL RUIDO BLANCO
# S: fenomenos que se repiten, TIENE QUE VER CON LA ESTACIONALIDAD

# para el modelado de datos se crea una variable ts
conteo_ts <- ts(viajes_hora$conteo, start = 1, frequency = 24)

conteo_ts

# con la variable ts comenzamos con el modelo ARIMA

install.packages('forecast')
library(forecast)

# ajustamos el modelo con la función auto.arima

ajuste <- auto.arima(y = conteo_ts)
summary(ajuste)

predicciones <- forecast(ajuste)

# calculamos estos valores para después
min(predicciones[['lower']])
max(predicciones[['upper']])

# para graficar las predicciones

p_predict <- autoplot(predicciones)
p_predict


## para graficar toda la semana con los datos reales ##

# procesando datos con dplyer y lubridate
viajes_diarios_completos <- raw_data %>% 
  mutate(fecha_hora = dmy_hms(paste(Fecha_Retiro, Hora_Retiro))) %>%  # se crea nueva variable, dmy_hms convierte a formato fecha es de lubridate
  filter(fecha_hora >= as.Date('2020-02-24'),
         fecha_hora <= as.Date('2020-02-29')) %>% 
  group_by(horas = floor_date(fecha_hora, unit = 'hour')) %>% # agrupamos por horas
  summarise(conteo = n()) # sumamos y agrupamos

# checando el dataset que se creo, hay horas donde no se usó ninguna bici y no aparecen, para poder hacer un mejor analisis 
# hay que ajustarlo, R no lo hace por si solo
todas_horas_completas <- data.frame( horas = seq(floor_date(min(viajes_diarios_completos$horas), unit= 'hour'),
                                           floor_date(max(viajes_diarios_completos$horas), unit = 'hour'),
                                           by= 'hour'))

# para unir los dataframe de las horas completas y el dataframe de viajes diarios usamos un left join de dplyer
todos_viajes_hora <- todas_horas_completas %>% 
  group_by(horas_redondeadas = floor_date(horas, unit = 'hour')) %>% 
  left_join(viajes_diarios_completos) %>% 
  mutate(conteo = ifelse(is.na(conteo),0, conteo))

# hacemos una grafica de lineas inicial
ggplot(viajes_diarios_completos, aes(x=horas, y=conteo)) + geom_line() +  ylim(-551.5396, 4103.783) +
  labs(title = 'Realidad')
