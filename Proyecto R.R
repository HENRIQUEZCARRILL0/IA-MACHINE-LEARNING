
#Actividad 1: Proyecto de r

#Elección del conjunto de datos

#El conjunto de datos seleccionado hace referencia al rendimiento estudiantil, el cual incluye diferentes variables que se consideran en la investigación educativa, las cuales pueden influir en el éxito académico de un estudiante.

#El dataset fue descargado de:
  
#https://www.kaggle.com/datasets/lainguyn123/student-performance-factors/data

# Importar librerías
library(ggplot2)
library(dplyr)
library(readr)
library(plotly)

# Cargar un archivo.csv
StudentPerformanceFactors <- read.csv("~/Downloads/Proyecto de R/StudentPerformanceFactors.csv")
View(StudentPerformanceFactors)

## Analisis Exploratorio

#Cantidad de filas y Columnas
dim(StudentPerformanceFactors)

#Ver Primeras Filas
head(StudentPerformanceFactors)

#Ver Ultimas Filas
tail(StudentPerformanceFactors)

#Informacion General
str(StudentPerformanceFactors)

#  Resumen Estadistico 
summary(StudentPerformanceFactors)

#Limpieza y transformación de los datos

# Conteo de valores nulos
colSums(is.na(StudentPerformanceFactors))

# Eliminar registros con valores NULL
ds <- na.omit(StudentPerformanceFactors)

# Mostrar los valores mayores a 100 en la columna Exam_Score
StudentPerformanceFactors[StudentPerformanceFactors$Exam_Score > 100, "Exam_Score"]

# Eliminar los valores mayores a 100
StudentPerformanceFactors <- StudentPerformanceFactors[StudentPerformanceFactors$Exam_Score <= 100, ]

## Visualización de resultados


# Función para crear histogramas para columnas numéricas
create_histograms <- function(data) {
  # Obtenemos los nombres de las columnas numéricas
  numeric_cols <- names(data)[sapply(data, is.numeric)]
  
  # Creamos un histograma para cada columna numérica
  for (col in numeric_cols) {
    ggplot(data, aes(x = !!sym(col))) +  # Use sym() to convert column name to symbol
      geom_histogram(bins = 20, aes(y = after_stat(density))) +  # Use after_stat(density) for density
      labs(title = paste0("Histogram of ", col), x = col, y = "Density") +
      theme_bw()
    print(ggplot2::last_plot())
  }
}

# Llamamos a la función para crear los histogramas
create_histograms(StudentPerformanceFactors)


#Conclusiones
#Se realizo un análisis de tipo Exploratorio del dataset para conocer a detalle las distintas variables y como estas pueden afectar el rendimiento estudiantil, las cuales pueden estar en función de distintos factores (Horas Promedio de sueño, Motivación, Nivel Estudio de los padres, Acceso a Internet, Ingresos Mensuales, etc), como futuro pasos la idea sería construir un modelo el cual pueda pronosticar el desempeño de un estudiante, en base a estas variables de investigación educativa.

#Al validar la relación entre las diferentes variables, en este dateset podemos ver una correlación positiva perfecta, lo cual significa que cada variable está perfectamente correlacionada consigo misma, esto es lo normal y esperado, es interesante ver como la nota final de examen esta más correlacionado la asistencia a la clase, horas de estudio y menos correlacionada con el desempeño de una actividad física o las horas de sueño.

