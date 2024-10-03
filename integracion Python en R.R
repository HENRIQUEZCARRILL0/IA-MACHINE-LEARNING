# Usar reticulate para ejecutar código Python

library(reticulate)

# Crear un entorno virtual de Python
virtualenv_create("r-reticulate")

# Instalar paquetes de Python necesarios
py_install(c("pandas", "matplotlib"), envname = "r-reticulate")

# Usar el entorno virtual
use_virtualenv("r-reticulate")

# Código Python para análisis adicional
py_run_string("
import pandas as pd
import matplotlib.pyplot as plt

# Cargar el dataset en Python
df = pd.read_csv('~/Downloads/Proyecto de R/StudentPerformanceFactors.csv')

# Mostrar las primeras filas
print(df.head())

# Crear un histograma en Python
df['Exam_Score'].hist(bins=20)
plt.title('Histogram of Exam_Score')
plt.xlabel('Exam_Score')
plt.ylabel('Frequency')
plt.show()
")
