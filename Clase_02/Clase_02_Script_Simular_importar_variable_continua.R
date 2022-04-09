# ----------------------------------------------------------
# Clase 02 - Importar y simular variables Aleatorias Continua
# Dr. José Gallardo y Dra. María Angélica Rueda Calderón
# 09 abril 2022
# Diplomado en Análisis de datos con R para la Acuicultura.
# ----------------------------------------------------------

# ¿Cómo habilitar librerías?

library(xlsx)
library(readr)
library(readxl)

# ¿Qué tipos de distribuciones hay en R?

help(Distributions)

# ¿Cómo importar datos datos a R? (Formatos .txt, .csv, .xlsx)

# Importa base de datos en formato .txt

datos_txt <- read.delim("/cloud/project/Clase_02/datos.txt")

# Importa base de datos en formato .csv

datos_csv <- read_csv("/cloud/project/Clase_02/datos.csv")

# Importa base de datos en formato .xlsx

datos_xlsx <- read_excel("/cloud/project/Clase_02/datos.xlsx")

# Simular base de datos con variable aleatoria continua con distribución normal paso a paso
set.seed(1) #semilla para fijar resultados cada vez que se corre la simulación
Animal <- seq(1:100)
Talla <- rnorm(100, 77, 5)
Peso <- rnorm(100, 6078, 1190)
Sexo <- sample(c("Hembra","Macho"), size = 100, replace = TRUE)
datos <- data.frame(Animal, Talla, Peso, Sexo)

# Explore y grafique el objeto "datos" con summary(), hist(), boxplot()
# plot(), density() y ecdf() 




























# Respuesta a ejercicios
summary(datos)
hist(datos$Peso)
boxplot(datos$Peso ~ datos$Sexo)
plot(density(datos$Talla))
plot(ecdf(datos$Peso))
