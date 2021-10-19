x=c(1,2,5,6,7,8,10,13,17,17,20,23,24,25,27,27.7,27.7,28,29,30)
y=c(3,3.7,3.9,4.2,5.7,6.6,7.1,6.7,4.5,4.5,7,6.1,5.6,5.8,5.2,4.1,4.1,4.3,4.1,3)
n=9
interpolacionSpline = spline(x, y)
plot(x,y, pch=20, main = paste("Interpolacion del perrito"),xlim=c(0,31),ylim=c(0,9),asp=1)

lines(interpolacionSpline, col = "red")

x1=c(1,5.39,8.62,7.9,8.1,8.62,7.9,9,11.5,13.76,16.95,20.22,23.5,26.83,28.45,29.1)
y1=c(3,2.5,3.16,2.03,2.6,3.16,2.03,1.9,2.15,1.85,1.85,1.8,1.55,1.54,2.35,3.71)
interpolacionSpline2 = spline(x1, y1)
lines(interpolacionSpline2, col = "red")
