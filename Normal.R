
# ejemplo de normal   
a<-c(1,2104,5,1,45)       # El primer vector. c significa concatenar.
b<-c(1,1416,3,2,40)       # El segundo vector.
c<-c(1,1534,3,2,30)
d<-c(1,852,1,1,36)       # El tercer vector.
y<-c(460,232,315,178)
# Añade una fila a una batriz
B<-rbind( a,b,c,d)    # La matriz B.

# El determinante es 0, por lo que no se puede invertir.
det(t(B)%*%B)

#Al tratar de invertir da error
solve(t(B)%*%B) %*% t(B)  %*% y



# Si el determinante es 0 quiere decir que 
  # 1) Hay Features redundantes
  # 2) Hay demasiadas Features para el training set que tenemos --> m (nº de registros) es menor o igual a n (nº de Features)
# SOLUCIÓN: Borrar alguna feature o usar regularización     

a<-c(1,2104,1,45)       # El primer vector. c significa concatenar.
b<-c(1,1416,2,40)       # El segundo vector.
c<-c(1,1534,2,30)
d<-c(1,852,1,36)        
# Añade una fila a una batriz
B<-rbind( a,b,c,d)    # La matriz B.

det(t(B)%*%B)
solve(t(B)%*%B)

solve(t(B)%*%B) %*% t(B)  %*% y
