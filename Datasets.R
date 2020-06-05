
# Lista todos los datasets disponibles en todos los paquetes
#data()
#data(package = .packages(all.available = TRUE))

# Carga una libreria de dataset
library("dplyr", lib.loc="/usr/local/anaconda3/envs/EntornoParaR/lib/R/library")    # LIBRERÍA DE MANIPULACIÓN DE DATAFRAMES
library(readr)
library(titanic)

datos <- titanic_train

# Leer un fichero
fichero <- "/Users/javierzazo/ML/R/Book1.csv"
fichero_data <- data.table::fread(input = fichero,header = T,data.table = F)


apropos("starw")  # Busca objetos

glimpse(starwars) # Vistazo a los datos
nrow(starwars)    # Num de filas
ncol(starwars)    # Num de columnas

# if_else(condition, true, false, missing = NULL)
datos$Survived <- if_else(datos$Survived == 1, "Si", "No")     # Sustituye los 1 por Sí y el resto por 0

# CREAR DATAFRAME
data("starwars")  
data("mtcars")
data("USArrests")
data("PlantGrowth")

# PROPIEDADES DE DATAFRAMES
length(starwars)
dimnames(starwars)
colnames(starwars)
rownames(starwars)
is.matrix(starwars)
is.data.frame(starwars)

###############################
# BÚSQUEDAS
###############################

# Buscar contiene


subset(starwars, name == "Luke Skywalker")
starwars[starwars$name == "Luke Skywalker",]                  # Busca la fila que cumpla un criterio
starwars[starwars$name %in% c("Luke Skywalker","C-3PO"),]     # Busca la fila que cumpla varios criterio
filter(starwars, name == "Luke Skywalker" & skin_color == "fair")
filter(starwars, name == "Luke Skywalker" , skin_color == "fair")


      
# Filtra por una contenido columna
starwars[grep("Luke",starwars$name ,ignore.case = F,perl = T),]   # Filtra por una columna
grep("Luke", starwars$name,value = T)
grep('Luke', starwars$name )


###############################
# VISUALIZAR
###############################

starwars[1:10,]   # Visualiza las 10 primeras filas y todas las columnas
starwars[1:10,4]   # Visualiza las 10 primeras filas y la columna 4



select(starwars, 1, 2)                                   # SELECCIONAR COLUMNAS
select(starwars, new.name = name, new.height = height)   # RENOMBRAR COLUMNAS
arrange(starwars, desc(name), height )                   # ORDENAR
mutate(starwars, nuevacolumna = 15-1)                    # AÑADIR NUEVA COLUMNA

summarise(starwars,
          delay = mean(height, na.rm = TRUE))            # RESUMEN HACIENDO LA MEDIA


grupos <- group_by(starwars, hair_color,eye_color)          # GROUP BY
summarise(grupos,
          num = n())

grupos <- group_by(starwars, hair_color)                    # AGRUPA CONTANDO POR OTRA VARIABLE
summarise(grupos,
          eye_colors = n_distinct(eye_color),
          num = n()
)

##########################################
# UNIÓN DE 2 TABLAS
##########################################

id <- c (1:10)
valor1 <- c("A","B","C","D","E","F","G","H","I","J")
valor2 <- c(rep("spain",3),rep("italy",3),rep("portugal",4))

datos1 <- data.frame(id=id,valor1= valor1)
datos2 <- data.frame(id=id,valor2= valor2)
head(datos1)
head(datos2)

join <- datos1 %>% left_join(datos2, by="id")
head(join)

#############################################
# Reemplazar valores de una columna
#############################################

nombre <- c("A","B","C","D","E","F","G","H","I","J")
valor <- c("X", 2, 3, NA, NA, NA, 3, 2, 1, 0)
datos <- data.frame(nombre,valor)

# Reemplazar NA
datos <- datos %>% mutate(valor = replace(valor, which(is.na(valor)), 0))

# Reemplazar cadenas de caracteres por nunero
datos <- datos %>% mutate(valor = replace(valor, valor == "X", 0))

# Reemplazar cadenas de caracteres por otra
levels(datos$valor) <- c(levels(datos$valor),"Nueva")
datos <- datos %>% mutate(valor = replace(valor, valor == "X", "Nueva"))


############################################################################################################################


# DUPLICADOS

sexo <- c(rep("hombre",5),rep("mujer",5))
pais <- c(rep("francia",3),rep("italia",3),rep("portugal",4))

datos <- data.frame(sexo=sexo,pais=pais)
head(datos, n=10)

datos[!duplicated(datos), ]     # ELIMINAR DUPLICADOS
datos[duplicated(datos), ]      # MOSTRAR DUPLICADOS (es decir, lo que borraría si se eliminan duplicados)
distinct(datos)                 # ELIMINAR DUPLICADOS. Con librería "dplyr" de manipulación de dataframes 
distinct(datos, pais)           # ELIMINAR DUCPLICADOS DE UNA COLUMNA
duplicated(datos)               # OBTENER VECTOR DE DUPLICADOS
nrow(datos[duplicated(datos), ])# CONTAR DUPLICADOS

# NULOS

id <- c(1,4,3,NA,7,6,9,4,0,8)
texto <- c("a", "b", NA, "NA","a","b","b","b","c","d")
valor <- c(2,8,7,5,1,9,4,3,7,2)
datos <- data.frame(id=id,texto=texto,valor=valor)
head(datos, n=10)

sapply(datos, function(x) sum(is.na(x)))   # CONTAR NULOS

datos <- datos[!is.na(datos$id),]       # ELIMINAR LA FILA QUE TENGA NULOS EN LA COLUMNA SEÑALADA
datos <- datos[!is.na(datos$texto),]    # ELIMINAR LA FILA QUE TENGA NULOS EN LA COLUMNA SEÑALADA
na.omit(datos)                        # ELIMINA TODAS LAS FILAS CON ALGÚN VALOR NULO

