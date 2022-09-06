# ----------------------------------------------------------
# Clase 06 - Script Anova y posteriores
# Dr. José Gallardo Matus
# 23 julio 2022
# Introducción al Análisis de datos con R para la Acuicultura.
# ----------------------------------------------------------

# PRUEBA DE HIPÓTESIS DE CORRELACIÓN

# Crea objetos X e Y 
Peso <- c(942,101,313,800)
Parasitos <- c(13,14,18,10)

# Realiza test de correlación
cor.test(Peso, Parasitos, method = "spearman",
alternative = "two.sided")

  
# PRUEBA DE MANN-WHITNEY (W)
# COMPARACIÓN DE MUESTRAS INDEPENDIENTES  

# Crea objetos tratamiento y control
tratamiento <- c(9, 12, 13)
control <- c(0, 4, 6)

# Realiza prueba de Mann-Whitney
wilcox.test(tratamiento, control, alternative = "g", paired = FALSE)


# PRUEBA DE WILCOXON MUESTRAS PAREADAS
# COMPARACIÓN DE MUESTRAS PAREADAS

# Crea objetos pre y post
pre <- c(45, 41, 47, 52)
post <- c(49, 50, 52, 50)

# Realiza prueba de Wilcoxon
wilcox.test(post - pre, alternative = "greater")

# COMPARACIÓN DE MÚLTIPLES MUESTRAS INDEPENDIENTES
# ESTUDIO DE CASO: SCORE CALIDAD CAMARÓN
# PRUEBA DE KRUSKAL - WALLIS CON R
    
d0 <- c(9,8,9,8) # day0
d4 <- c(7,7,6,8) # day4 
d8 <- c(6,5,5,6) # day8

kruskal.test(list(d0, d4, d8))

# PRUEBA DE ASOCIACIÓN VARIABLES CATEGÓRICAS
# ESTUDIO DE CASO: SOBREVIVENCIA MANCHA BLANCA CAMARÓN
  
# Crea matriz de datos
datos <- c(20, 5, 80, 95)
dim(datos) <- c(2,2)

# Test de Chi-squared en R (chisq.test)
test<-chisq.test(datos, correct = FALSE)
test$expected
test$statistic
test