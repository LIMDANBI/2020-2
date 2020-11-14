library(MASS)
x<-Cars93$Price

# 문제 1번
length(x)
sum(x)/length(x)
sum(x)
length(x[x>15.0])

# 문제 2번
mvalue <- c(25, 15, 17, 23)
m <- matrix(mvalue, nrow = 2)
rownames(m) <- c("smoke", "non-smoke")
colnames(m) <- c("drink", "non-drink")
m
m <- cbind(m, sum = rowSums(m))
m <- rbind(m, sum = colSums(m))
m