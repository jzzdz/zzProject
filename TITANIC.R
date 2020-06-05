library(readr)
library(caret)
library(tidyverse)
library(titanic)

datos <- titanic_train

glimpse(datos)                                                   # Resumen del set de datos

datos$Survived <- if_else(datos$Survived == 1, "Si", "No")       # Actualiza el 1 por Sí y el 0 por No

# Cambio el tipo de dato de la columna indicada

datos$Survived <- as.factor(datos$Survived) 
datos$Pclass <- as.factor(datos$Pclass)                      
datos$SibSp <- as.factor(datos$SibSp)
datos$Parch <- as.factor(datos$Parch)
datos$Sex      <- as.factor(datos$Sex)
datos$Embarked <- as.factor(datos$Embarked)
datos_long <- datos %>% gather(key = "variable", value = "valor", -PassengerId)
head(datos_long)

any(!complete.cases(datos))                            # Detección si hay alguna fila incompleta
map_dbl(datos, .f = function(x){sum(is.na(x))})        # Número de datos ausentes por variable
datos %>% map_lgl(.f = function(x){any(!is.na(x) & x == "")}) 
datos$Cabin[datos$Cabin == ""] <- NA
levels(datos$Embarked)

datos$Embarked <- as.character(datos$Embarked)
datos$Embarked[datos$Embarked == ""] <- NA
datos$Embarked <- as.factor(datos$Embarked)
levels(datos$Embarked)
datos_long$valor[datos_long$valor == ""] <- NA
map_dbl(datos, .f = function(x){sum(is.na(x))})


# Representación gráfica de los datos ausentes
datos_long <- datos_long %>%  mutate(ausente = is.na(valor))
ggplot(data = datos_long, aes(x = variable, y = PassengerId, fill = ausente)) +
  geom_raster() +
  scale_fill_manual(values = c("gray60", "orangered2")) +
  theme_bw() +
  labs(title = "Valores ausentes por variable") +
  theme(legend.position = "bottom")

datos_long %>%
  group_by(variable) %>% 
  summarize(porcentaje_NA = 100 * sum(is.na(valor)) / length(valor)) %>%
  ggplot(aes(x = reorder(variable, desc(porcentaje_NA)), y = porcentaje_NA)) +
  geom_col() +
  labs(title = "Porcentaje valores ausentes por variable",
       x = "Variable", y = "Porcentaje NAs") +
  theme_bw()


##############################


View(titanic_test)

View(titanic_test[grep("Fermina",titanic_test$Name ,ignore.case = F,perl = T),])   # Filtra por una columna


fichero <- "/Users/javierzazo/ML/R/Titanic/train.csv"
datos <- data.table::fread(input = fichero,header = T,data.table = F)

View(datos[grep("Fermina",datos$Name ,ignore.case = F,perl = T),])   # Filtra por una columna
glimpse(datos)

any(!complete.cases(datos))
map_dbl(datos, .f = function(x){sum(is.na(x))})
library(tidyverse)