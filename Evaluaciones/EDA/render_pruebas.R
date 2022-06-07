# ----------------------------------------------------------
# R script: Imprime reportes de evaluación académica de forma automática
# José Gallardo y Rodrigo Badilla
# 29 octubre 2021
# ----------------------------------------------------------

# Remueve objetos del ambiente de trabajo
rm(list=ls()) 

###################################
#Librerias a instalar
###################################

# Es necesario instalar:

# install.packages('tinytex')
# tinytex::install_tinytex()
# install.packages('mailR')
# install.packages('rmarkdown')

# comprobar la instalacion
tinytex:::is_tinytex()

##################################

library(rmarkdown)
library(readxl)
library(tidyr)

# Importa excel
prueba <- read_excel("EVALUACION_EDA.xlsx")
Alumnos <-(prueba[,-2:-10])

numero <-0
nume <-0

#Loop para cada alumno
for (nom in unique(Alumnos$Nombre)){
  
        name = gsub(" ","_", nom)
        numero=length(nom)
        nume=numero+ nume
        
        #Comando de rmarkdown, permite crear pdf a partir de archivo .Rmd 
        render("Evaluacion_EDA.Rmd", output_file =name)   
}

