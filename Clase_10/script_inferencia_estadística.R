# ----------------------------------------------------------
# Clase 10 - Script inferencia estadística
# Dr. José Gallardo matus
# 10 mayo 2022
# Diplomado en Análisis de datos con R para la Acuicultura.
# ----------------------------------------------------------

# LIBRERÍAS
library(UsingR)
library(ggplot2)
library(dplyr)
library(knitr)

# ESTUDIO DE CASO: RELACIÓN ESTATURA PADRES - HIJOS

head(father.son)
plot(father.son$fheight, father.son$sheight, xlab = "ESTATURA PADRES", ylab = "ESTATURA HIJOS")


#  **Pearson's product-moment correlation**
help("cor.test")
cor.test(father.son$fheight, father.son$sheight,
         alternative = "two.side",
         method = c("pearson"))

#  Ejercicio 1: Compare con H1: r > 0 usando alternative ="g".

#  Ejercicio 2: Compare con H1: r < 0 usando alternative ="l".


# ESTUDIO DE CASO: COMPARACIÓN TAMAÑO ENTRE SEXOS
animal <- data.frame(Sexo=rep(c("Male", "Female"), each=10), Peso=c(rnorm(10, 180, 10),rnorm(10, 140, 10)))
boxplot(animal$Peso ~ animal$Sexo, xlab = "Sexo", ylab = "Peso")

# **Two Sample t-test**
t.test(Peso ~ Sexo, animal, alternative = c("two.sided"), var.equal=TRUE)

#  Ejercicio 1: Compare con H1: female > male usando alternative ="g".

#  Ejercicio 2: Compare con H1: female < male usando alternative ="l".

# ESTUDIO DE CASO: FILETE EN PORCIONES
# Se desea evaluar si las porciones de filete de salmón que produce una máquina
# son en promedio los 800 gramos qu dice el empaque final.
# Producir más significaría una perdida y menos un engaño para el cliente.

# Este ejemplo corresponde a una prueba t de una muestra. 
# Se utiliza para determinar si la media de una población es diferente 
# de un valor específico.

set.seed(10)
filete <- rnorm(30,810) # Creación de una muestra aleatoria de 30 porciones con media superior a la deseada 810
Media <- 800 # media deseada.
test <- t.test(filete, mu=Media) # Comparación de la media muestral con la media deseada
print(test)
