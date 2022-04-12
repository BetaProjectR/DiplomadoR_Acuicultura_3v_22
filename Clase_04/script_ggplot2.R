# ----------------------------------------------------------
# Clase 04 - Script ggplot2
# Dr. José Gallardo Matus
# 12 abril 2022
# Diplomado en Análisis de datos con R para la Acuicultura.
# ----------------------------------------------------------

# habilitar paquete ggplot2
library(ggplot2)

# Explore el objeto CO2 con el comando help
help(CO2)

# Intento de gráfica con función ggplot.
# La gráfica queda vacía pues falta indicar el tipo de gráfica que deseamos
ggplot(CO2, aes(uptake))

# Histrograma con ggplot. 
ggplot(CO2, aes(uptake))+
 geom_histogram()

# Agregamos titulo y nombre de los ejes
ggplot(CO2, aes(uptake))+
  geom_histogram()+
  labs(title="Histograma", x="Consumo de CO2", 
       y="Frecuencia")

# Modificamos tamaño de etiquetas
My_Theme = theme(
  axis.title.x = element_text(size = 18),
  axis.text.x = element_text(size = 18),
  axis.title.y = element_text(size = 18),
  axis.text.y = element_text(size = 18))

ggplot(CO2, aes(uptake))+
  geom_histogram()+
  labs(title="Histograma", x="Consumo de CO2", 
       y="Frecuencia") +
  My_Theme

# Gráfica con dos ejes y tratamiento pero incompleta
ggplot(CO2, aes(x=Treatment, y=uptake))

# Gráfica de boxplot
ggplot(CO2, aes(x=Treatment, y=uptake))+
geom_boxplot()

# Selecciones un tema desde https://ggplot2.tidyverse.org/reference/ggtheme.html
# Cambie el tema del boxplot.
