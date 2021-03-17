activos <- read.csv('ACTIVOS.csv')
altas <- read.csv('ALTAS.csv')
bajas <- read.csv('BAJAS.csv')
library('tidyverse')
summary(activos)
activos <- mutate(activos, alta = as.Date(alta,"%Y-%m-%d"), cumpleanios = as.Date(cumpleanios, "%Y-%m-%d"))
summary(altas)
altas <- mutate(altas, alta = as.Date(alta,"%Y-%m-%d"), cumpleanios = as.Date(cumpleanios, "%Y-%m-%d"))
altas <- rename(altas, contratacion = ï..ingreso )
summary(bajas)
bajas <- mutate(bajas, baja = as.Date(baja, "%Y-%m-%d"),alta = as.Date(alta,"%Y-%m-%d"), cumpleanios = as.Date(cumpleanios, "%Y-%m-%d"))
bajas <- rename(bajas, motivo = ï..motivo)

# Gráfica por mes del total del personal activo
HC <- activos %>% group_by(hc, business_unit) %>%  summarise(conteo=n())

ggplot(HC, aes(x=hc, y=conteo, fill=business_unit))+geom_col()+
  labs(x = "Mes", 
       y = 'Total de personal',
       title = "HC por mes",
       fill='Business Unit')+
  theme(axis.text.x = element_text(face = "bold", color="black" , 
                                   size = 10, angle = 45, 
                                   hjust = 1),
        axis.text.y = element_text(face = "bold", color="black" , 
                                   size = 10, angle = 45, 
                                   hjust = 1))+
  scale_fill_brewer(palette = 'BrBG')

# Gráfica por mes del total del personal activo
ggplot(HC, aes(x=hc, y=conteo, fill=business_unit))+geom_col()+
  labs(x = "Mes", 
       y = 'Total de personal',
       title = "HC por mes",
       fill='Business Unit')+
  theme(axis.text.x = element_text(face = "bold", color="black" , 
                                   size = 8, angle = 45, 
                                   hjust = 1),
        axis.text.y = element_text(face = "bold", color="black" , 
                                   size = 8, angle = 45, 
                                   hjust = 1))+
  facet_wrap('business_unit')+
  scale_fill_brewer(palette = 'BrBG')

# Gráfica por tipo de servicio mensual
tserv <- activos %>% group_by(hc, tipo_servicios) %>% summarise(serv=n())
ggplot(tserv, aes(x=hc, y=serv, fill=tipo_servicios))+geom_col()+
  labs(x = "Mes", 
       y = 'Total de personal por servicios',
       title = "HC por mes",
       fill='Tipo de servicios')+
  theme(axis.text.x = element_text(face = "bold", color="black" , 
                                   size = 10, angle = 45, 
                                   hjust = 1),
        axis.text.y = element_text(face = "bold", color="black" , 
                                   size = 10, angle = 45, 
                                   hjust = 1))+
  scale_fill_brewer(palette = 'PuOr')

# altas por mes
hire <- altas %>% group_by(alta) %>% summarise(ingresos=n())
ggplot(hire, aes(x=alta,y=ingresos)) + geom_line(color="steelblue")+
  geom_point() +  geom_smooth(method = "lm", se = T)  + labs(x='',y='Número de ingresos', title = 'Total de altas')+
  scale_x_date(date_breaks= '1 month' ,date_labels = '%B %Y', limits = c(as.Date('2019-01-01'), as.Date('2020-09-30')))+
  theme(axis.text.x=element_text(angle=60, hjust=1))

# altas por tipo de contratación
ggplot(altas, aes(x=contratacion, fill=tipo_servicios)) + stat_count(width = 0.8) +
  labs(x = 'Tipo de contratación',
       y = 'Número de contrataciones',
       fill='Tipo de servicios')+
  scale_fill_brewer(palette = 'PuOr')+
  facet_wrap('tipo_servicios')+
  ylim(0,1000)

#bajas por mes
exit <- bajas %>% group_by(baja) %>% summarise(salidas=n())
ggplot(exit, aes(x=baja, y=salidas)) + geom_line(color='red')+
  geom_point() + geom_smooth(method = 'lm', se = T) + labs(x='',y='Número de bajas', title = 'Total de bajas')+
  scale_x_date(date_breaks= '1 month' ,date_labels = '%B %Y', limits = c(as.Date('2019-01-01'), as.Date('2020-09-30')))+
  theme(axis.text.x=element_text(angle=60, hjust=1))

# bajas por motivo
ggplot(bajas, aes(x=motivo, fill=tipo_servicios)) + stat_count(width = 0.8) +
  labs(x = 'Motivo de baja',
       y = 'Número de bajas',
       fill='Tipo de servicios')+
  scale_fill_brewer(palette = 'PuOr')+
  facet_wrap('tipo_servicios')+
  ylim(0,1000)+
  theme(axis.text.x=element_text(angle=60, hjust=1))

#boxplot de las bajas de acuerdo a su antiguedad, motivo y tipo de servicios
ggplot(bajas, aes(x=motivo, y=antiguedad, fill=tipo_servicios)) + geom_boxplot() +
  labs(x = 'Motivo de baja',
       y = 'Antiguedad',
       fill='Tipo de servicios')+
  scale_fill_brewer(palette = 'PuOr')
  
######### parte 2, pruebas #####



