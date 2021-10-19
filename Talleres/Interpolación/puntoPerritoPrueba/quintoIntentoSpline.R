x=c(1,2,5,6,7,8,10,13,17,17,20,23,24,25,27,27.7,27.7,28,29,30,1,5.39,8.62,7.9,8.1,8.62,7.9,9,11.5,13.76,16.95,20.22,23.5,26.83,28, 30)
y=c(3,3.7,3.9,4.2,5.7,6.6,7.1,6.7,4.5,4.5,7,6.1,5.6,5.8,5.2,4.1,4.1,4.3,4.1,3,3,2.8,3.16,2.03,2.6,3.16,2.03,1.9,2.15,1.85,1.85,1.8,1.55,2,2.4,3)
n=9
plot(x,y, pch=20, main = paste("Interpolacion del perrito"),xlim=c(0,31),ylim=c(0,9),asp=1)


segmentoX1 = c(x[1:4])
segmentoY1 = c(y[1:4])
splines = splinefun(segmentoX1,segmentoY1, method = "fmm")
splines2 =spline(segmentoX1, segmentoY1)
curve(splines(x), add = TRUE, col = 1, from = segmentoX1[1], to = segmentoX1[length(segmentoX1)])



segmentoX2 = c(x[4:7])
segmentoY2 = c(y[4:7])
splines = splinefun(segmentoX2,segmentoY2, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX2[1], to = segmentoX2[length(segmentoX2)])

segmentoX3 = c(x[7:10])
segmentoY3 = c(y[7:10])
splines = splinefun(segmentoX3,segmentoY3, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX3[1], to = segmentoX3[length(segmentoX3)])

segmentoX4 = c(x[10:13])
segmentoY4 = c(y[10:13])
splines = splinefun(segmentoX4,segmentoY4, method = "fmm")
print(splines(x))
curve(splines(x), add = TRUE, col = 1, from = segmentoX4[1], to = segmentoX4[length(segmentoX4)])

segmentoX5 = c(x[13:16])
segmentoY5 = c(y[13:16])
splines = splinefun(segmentoX5,segmentoY5, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX5[1], to = segmentoX5[length(segmentoX5)])

segmentoX6 = c(x[16:19])
segmentoY6 = c(y[16:19])
splines = splinefun(segmentoX6,segmentoY6, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX6[1], to = segmentoX6[length(segmentoX6)])

segmentoX7 = c(x[19:20])
segmentoY7 = c(y[19:20])
splines = splinefun(segmentoX7,segmentoY7, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX7[1], to = segmentoX7[length(segmentoX7)])

segmentoX8 = c(x[21:23])
segmentoY8 = c(y[21:23])
splines = splinefun(segmentoX8,segmentoY8, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX8[1], to = segmentoX8[length(segmentoX8)])

segmentoX9 = c(x[23:25])
segmentoY9 = c(y[23:25])
splines = splinefun(segmentoX9,segmentoY9, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX9[1], to = segmentoX9[length(segmentoX9)])

segmentoX10 = c(x[25:27])
segmentoY10 = c(y[25:27])
splines = splinefun(segmentoX10,segmentoY10, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX10[1], to = segmentoX10[length(segmentoX10)])

segmentoX11 = c(x[27:29])
segmentoY11 = c(y[27:29])
splines = splinefun(segmentoX11,segmentoY11, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX11[1], to = segmentoX11[length(segmentoX11)])

segmentoX12 = c(x[29:31])
segmentoY12 = c(y[29:31])
splines = splinefun(segmentoX12,segmentoY12, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX12[1], to = segmentoX12[length(segmentoX12)])

segmentoX13 = c(x[31:34])
segmentoY13 = c(y[31:34])
splines = splinefun(segmentoX13,segmentoY13, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX13[1], to = segmentoX13[length(segmentoX13)])

segmentoX14 = c(x[34:35])
segmentoY14 = c(y[34:35])
splines = splinefun(segmentoX14,segmentoY14, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX14[1], to = segmentoX14[length(segmentoX14)])


segmentoX15 = c(x[34:36])
segmentoY15 = c(y[34:36])
splines = splinefun(segmentoX15,segmentoY15, method = "fmm")
curve(splines(x), add = TRUE, col = 1, from = segmentoX15[1], to = segmentoX15[length(segmentoX15)])

