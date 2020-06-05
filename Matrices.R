
# Crear una matriz
A<-matrix(1:9, nrow = 3, byrow = TRUE)

# Crea matriz identidad
I<- diag(3)

# Crer un vector de número aleatorios
vecA <- sample( 1:20, 20, replace = TRUE)
# Crea una matriz convirtiendo el vector de 20 elementos en una mtriz de 4x4 (fxc)
C <- matrix(vecA, nrow = 4, ncol = 5, byrow = FALSE)

# Crear vectores
a<-c(4,5,4)       # El primer vector. c significa concatenar.
b<-c(3,4,4)       # El segundo vector.
d<-c(8,7,7)       # El tercer vector.

# Añade una fila a una batriz
B<-rbind( a,b,d)    # La matriz B.

D<-A
rbind(D, 0)       # Añade una fila de 0
rbind(D,c(0,1,2)) # Añade una fila
cbind(D,c(0,1,2)) # Añade una columna


# Concatenar
x<-c(1,3,5) 
y<-c(2,4,6) 
c(x,y)

# media
mean(x)
mean(c(x,y))


# Pregunta si en el vector x hay algún número > 2
x>2

# Formas de crear un vector
1:5 
seq(1,6) 
seq(1,6,by=0.5) 
seq(1,6,length=10) 
rep(1,5) 
rep(c(1,2),5) 
rep(1:4,2) 

# Not Available
x1<-c(1,2,3,NA,4,5) 
is.na(x1) 

SUMA_MATRIZ <- A+B                # Sumar matrices
A-B                               # Restar matrices

c<-3 # Creo un escalar
MULTIPLICAR_MATRIZ_ESCALAR <- A*c # Multiplica matrices por escalar

MULTIPLICAR_MATRIZ1 <- A%*%B      # Multiplicar matrices


t(A)          # Traspuesta
diag(A)       # Diagonal	
sum(diag(A))  # Traza
det(A)        # Determinante
solve(B)      # Inversa
qr(A)         # Descomposición
qr(A)$rank    # Rango	
var(A)        # Varianza


# Asignar nombres a filas y columnas

A
colnames(A)<-c("col1","col2","col3")
rownames(A)<-c("row1","row2","row3")

# Crear listas

familia<-list(padre="juan",madre="maria",numero.hijos=3, 
              nombre.hijos=c("luis","carlos","eva"),edades.hijos=c(7,5,3),ciudad="lugo")

