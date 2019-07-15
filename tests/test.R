library(data.table)
library(hqreg)
library(glmnet)

rm(list=ls())
x <- fread("U:/code/hqreg/data/x.csv")
y <- fread("U:/code/hqreg/data/y.csv")
w <- fread("U:/code/hqreg/data/w.csv")

x <- as.matrix(x)
y <- y[,ydata]
w <- w[,weights]/w[,max(weights)]

out <- hqreg_raw(x,y,w, method="ls")
out2 <- glmnet(x,y,weights = w)
