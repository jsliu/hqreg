library(data.table)
library(hqreg)
library(rqPen)

rm(list=ls())
x <- fread("U:/code/hqreg/data/x.csv")
y <- fread("U:/code/hqreg/data/y.csv")
w <- fread("U:/code/hqreg/data/w.csv")

x <- as.matrix(x)
y <- y[,ydata]
w <- w[,weights]/w[,max(weights)]

out <- hqreg(x,y,w, method="quantile")
out2 <- cv.rq.pen(x,y,w,criteria = "BIC")
