library(PolynomF)
#   1 2 3 4 5 6 7  8  9  10 1  2   3  4  5  6     7  8   9 20 1   2   3    4   5   6    7  8  9    30    1      2     3   4    5   6
x=c(1,2,5,6,7,8,10,13,17,17,20,23,24,25,27,27.7,27.7,28,29,30,1,5.39,8.62,7.9,8.1,8.62,7.9,9,11.5,13.76,16.95,20.22,23.5,26.83,28, 30)
y=c(3,3.7,3.9,4.2,5.7,6.6,7.1,6.7,4.5,4.5,7,6.1,5.6,5.8,5.2,4.1,4.1,4.3,4.1,3,3,2.8,3.16,2.03,2.6,3.16,2.03,1.9,2.15,1.85,1.85,1.8,1.55,2,2.4,3)
n=9
plot(x,y, pch=20, main = paste("Interpolacion del perrito"),xlim=c(0,31),ylim=c(0,9),asp=1)
intervaloX1=x[1:5]
intervaloY1=y[1:5]
  lagrange = poly_from_values(intervaloX1,intervaloY1)
  curve(lagrange,from=1,to=7,add=T, lwd=1)

intervaloX1=x[5:9]
intervaloY1=y[5:9]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=7,to=17,add=T, lwd=1)

intervaloX1=x[9:13]
intervaloY1=y[9:13]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=17,to=24,add=T, lwd=1)

intervaloX1=x[13:16]
intervaloY1=y[13:16]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=24,to=27.7,add=T, lwd=1)

intervaloX1=x[16:20]
intervaloY1=y[16:20]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=27.7,to=30,add=T, lwd=1)

intervaloX1=x[21:23]
intervaloY1=y[21:23]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=1,to=8.62,add=T, lwd=1)

intervaloX1=x[23:25]
intervaloY1=y[23:25]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=8.62,to=7.9,add=T, lwd=1)

intervaloX1=x[25:27]
intervaloY1=y[25:27]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=8.1,to=8.62,add=T, lwd=1)

intervaloX1=x[27:30]
intervaloY1=y[27:30]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=8.1,to=13.76,add=T, lwd=1)

intervaloX1=x[30:33]
intervaloY1=y[30:33]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=13.76,to=23.5,add=T, lwd=1)

intervaloX1=x[33:36]
intervaloY1=y[33:36]
lagrange = poly_from_values(intervaloX1,intervaloY1)
curve(lagrange,from=23.5,to=30,add=T, lwd=1)