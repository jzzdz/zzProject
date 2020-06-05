library(readr)


# ESTA ES LA BUENA --> PASAR A FUNCION

fichero <- "/Users/javierzazo/Octave/machine-learning-ex1 1/ex1/ex1data2.txt"
fichero_data <- data.table::fread(input = fichero,header = F,data.table = F)

#  **************************************************
# Creo los DATASET
#  **************************************************

# DATASET -> Creo matriz y con los features del Dataset
for (ii in 1:(ncol(fichero_data) -1)){
  
  print(ii)
  if  (ii==1) { # Entra la primera vez
    X <- fichero_data[,ii]
  }else{
    X <- cbind(X,fichero_data[,ii] )
  }
}

# DATASET -> Creo matriz y con la solución del dataset
y <- fichero_data[,ncol(fichero_data) ]

#  **************************************************
#  SETTINGS PARA Mínimos cuadrados:
#  **************************************************

m                  <- length(y)                      # Longitud del dataset
theta              <- rep(0,ncol(fichero_data))      # Inicializo número de features
iterations         <- 400;                           # Nº DE ITERACIONES
alpha              <- 0.01;                          # Alpha


X <- cbind(1,X)    # Añadimos el valor de X0


#  **************************************************
#  Mínimos cuadrados
#  **************************************************

theta <- solve(t(X)%*%X)%*%(t(X)%*%y)

theta
#  **************************************************
#  PROBAR HIPÓTESIS:
#  **************************************************

Hx <- c(1,1650,3)
t(theta)%*% Hx
