library(readr)

# ESTA ES LA BUENA --> PASAR A FUNCION

fichero <- "/Users/javierzazo/Octave/machine-learning-ex1 1/ex1/ex1data2.txt"
fichero_data <- data.table::fread(input = fichero,header = F,data.table = F)

# Parámetros de entrada

# @fichero_data    : DATAFRAME con el dataset (Features y Respuesta)
# @feature_scaling : BOOLEANO indica si se apica feature scaling
# @iterations      : NUMERIC - Indica número de iterarciones
# @alpha           : NUMERIC - Indica parámetro alpha

#  **************************************************
# Creo los DATASET
#  **************************************************


# DATASET -> Creo matriz y con los features del Dataset
for (ii in 1:(ncol(fichero_data) -1)){
  
  print(ii)
  if  (ii==1) # Entra la primera vez
  {
    X <- fichero_data[,ii]
  }else{
    X <- cbind(X,fichero_data[,ii] )
  }
  
}

# DATASET -> Creo matriz y con la solución del dataset
y <- fichero_data[,ncol(fichero_data) ]

#  **************************************************
#  SETTINGS PARA Gradient Descent:
#  **************************************************

#m <- length(X[,1])

m <- length(y)
theta              <- rep(0,ncol(fichero_data))      # Inicializo número de features
iterations         <- 400;                           # Nº DE ITERACIONES
alpha              <- 0.01;

#  **************************************************
# FEATURE SCALING
#  **************************************************

X_NORM <- X

ii <- 1
mu <- c(mean(X[,1]),mean(X[,2]))
sigma <- c(sd(X[,1]),sd(X[,2] ) )

for(ii in 1:length(X[,1])) {  # Recorro las filas
  
  X_NORM[ii,] <-  (X[ii,] - mu  ) / sigma

}

X <- X_NORM


#  **************************************************
#  Gradient Descent:
#  **************************************************

X <- cbind(1,X)    # Añadimos el valor de X0
for(ii in 1:iterations){
  
  # TÉRMINO DE LA DERIVADA
  termino_derivada <-  1/m * colSums(  as.vector( (X %*% theta - y) ) * X  )
  
  # OBTENGO THETA 0 Y THETA 1 PARA ESTA ITERACIÓN
  theta <- theta - (alpha *  termino_derivada)
  
 
}

theta


#  **************************************************
#  VER EL VALOR MÍNIMO DE J (aplicar las Features calculadas)
#  **************************************************

# OBTENGO EL RESULTADO DE LA FUNCIÓN DE COSTE CON THETA 0 Y THETA 1
J <- 1/(2*m) * colSums( (X %*% theta - y) * (X %*% theta - y) )



#  **************************************************
#  PROBAR HIPÓTESIS:
#  **************************************************

# V1 = metros cuadrados
# V2 = Nº dormitorios


Hn_NORM <- c(1,1650,3)

for(ii in 2:length(Hn_NORM)) {  # Recorro las filas
  
  Hn_NORM[ii] <-  (Hn_NORM[ii] - mu[ii-1]  ) / sigma[ii-1]
  
}

t(theta)%*% Hn_NORM


#######################################
#  MUESTRO EL RESULTADO FINAL
#######################################

# resultado <- t(as.matrix(c(iterations_inicial,alpha,theta_ini,J,theta)))
# colnames(resultado)<-c("Iteraciones previstas","alpha","theta_ini_0","theta_ini_1","J","theta1","theta2")
# resultado_acumulado <- rbind(resultado_acumulado,resultado)
# View (t(resultado_acumulado))
