# Obtención y limpieza de datos semana 4 asignación

Este repositorio contiene los archivos correspondientes al proyecto del curso. 

Antes de Ejecutar el código es necesario descargar y ordenar los datos.

## Explicación del código
El código combina el conjunto de datos de entrenamiento y el conjunto de datos de prueba, extrae las  variables parciales para crear otro conjunto de datos con los promedios de cada variable para cada actividad.

## Nuevo conjunto de datos
El nuevo conjunto de datos generado contenía variables calculadas en función de la media y la desviación estándar. Cada fila del conjunto de datos es un promedio de cada tipo de actividad para todos los sujetos.

## El Script run_analysis.R Hace lo siguiente


1. Fusiona los conjuntos de entrenamiento y prueba para crear un conjunto de datos. Use el comando rbind para combinar entrenamiento y conjunto de pruebas
2. Extrae solo las mediciones de la media y la desviación estándar para cada medición. Utilice el comando grep para obtener índices de columna para el nombre de la variable que contiene "mean ()" o "std ()"
3. Utiliza nombres descriptivos de actividades para nombrar las actividades en el conjunto de datos Convierta etiquetas de actividad en caracteres y agregue una nueva columna como factor
4. Etiqueta adecuadamente el conjunto de datos con nombres de variables descriptivas. Dar los nombres descriptivos seleccionados a columnas variables
5. A partir del conjunto de datos en el paso 4, crea un segundo conjunto de datos ordenado independiente con el promedio de cada variable para cada actividad y cada sujeto. Utilice el comando de canalización para crear un nuevo conjunto de datos ordenado con el comando group_by y summaryize_each en el paquete dplyr