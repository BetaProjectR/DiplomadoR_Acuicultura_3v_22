# ----------------------------------------------------------
# Clase 03 - Variables Aleatorias discretas y cualitativas
# Dr. José Gallardo y Dra. María Angélica Rueda Calderón
# 09 abril 2022
# Diplomado en Análisis de datos con R para la Acuicultura.
# ----------------------------------------------------------

# Habilita paquetes para importar/exportar datos
library(xlsx)
library(readr)
library(readxl)

# Habilita paquetes para simular algunas variables aletaorias
library(Rlab)
library(MASS)

# ¿Qué tipos de distribuciones hay en R?

help(Distributions)

# ¿Cómo simular variables discretas?

# Simular variable tipo Bernoulli

# Simular un ensayo Bernoulli por ejemplo seleccionar un camarón con síndrome de mancha blanca
set.seed(1) #semilla para fijar resultados cada vez que se corre la simulación
rbern(1, 0.65)

# Simular 100 ensayos Bernoulli (muestras independientes)
set.seed(1)
rbern(100, 0.65)

# Simular variable que se distribuye Binomial
set.seed(1)
rbinom(100,8,0.5)

# Como gráficar la distribución de variable aleatoria discreta con distribución binomial (probabilidad de éxito p=0.5)
set.seed(1)
x <- 0:12
prob <- dbinom(x,12,0.5)
barplot(prob,col = "coral",ylim = c(0,0.3),names.arg=x, main="Distribución Binomial")

# Como gráficar la distribución de variable aleatoria discreta con distribución binomial (probabilidad de éxito p=0.8)
set.seed(1)
x <- 0:12
prob <- dbinom(x,12,0.8)
barplot(prob,col = "deepskyblue4",ylim = c(0,0.3),names.arg=x, main="Distribución Binomial")

# Como gráficar la distribución de variable aleatoria discreta con distribución binomial(probabilidad de éxito p=0.2)
set.seed(1)
x <- 0:12
prob <- dbinom(x,12,0.2)
barplot(prob,col = "darkolivegreen3",ylim = c(0,0.3),names.arg=x, main="Distribución Binomial")


# Simular base de datos con variable aleatoria discretas y variables categóricas paso a paso
set.seed(1)
Animal <- seq(1:100)
Madurez <- rbern(100, 0.65)
inf_caligus <- rbinom(100,8,0.6) 
Sexo <- sample(c("Hembra","Macho"), size = 100, replace = TRUE)
Nivel_cataratas <- sample(c("Alto","Medio","Bajo"), size = 100, replace = TRUE)

datos_all <- data.frame(Animal,Madurez, inf_caligus, Sexo, Nivel_cataratas)

# Exportar objeto datos_all en formato .txt, .csv y .xlsx

write.table(x = datos_all, file = "datos_all.txt", sep = "\t", row.names = FALSE, col.names = TRUE)

write.csv(x = datos_all, file = "datos_all.csv", row.names = FALSE)

write.xlsx(datos_all, "datos_all.xlsx", sheetName = "Base_datos", col.names = TRUE, row.names = FALSE)


## Ejercicio: En grupos
## Explore y grafique las variables del objeto datos_all.
# Use as.factor(), summary().
# Use table() para dos variables categóricas a la vez (ej. madurez y Sexo).
# Use barplot(), debe crear objeto con tabla resumen de la variable antes de graficar.




















# SOLUCION EJERCICIOS
datos_all$Madurez <- as.factor(datos_all$Madurez)
datos_all$inf_caligus <- as.factor(datos_all$inf_caligus)
datos_all$Sexo <- as.factor(datos_all$Sexo)
datos_all$Nivel_cataratas <- as.factor(datos_all$Nivel_cataratas)
summary(datos_all)

table(datos_all$Madurez, datos_all$Sexo)
table(datos_all$inf_caligus, datos_all$Sexo)
table(datos_all$Nivel_cataratas, datos_all$Sexo)

madurez_resumen <- table(datos_all$Madurez)
barplot(madurez_resumen)

caligus_resumen <- table(datos_all$inf_caligus)
barplot(caligus_resumen)

cataratas_resumen <- table(datos_all$Nivel_cataratas)
barplot(cataratas_resumen)
