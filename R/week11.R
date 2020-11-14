attach(mtcars)
plot(x=wt, y=mpg, main = "Relation between weigth and mpg (maxcars)", xlab = "weight", ylab = "mpg", pch=19, col="gray")
grid(lty = "dashed", lwd = 2)
abline()
detach(mtcars)
head(mtcars)

########### plot

attach(mtcars)
min_combine <- min(c(mpg, disp))
max_combine <- max(c(mpg, disp))
plot(x=wt, y=mpg, main = "Relation between weigth and mpg (maxcars)", 
     xlab = "weight", ylab = "mpg", pch=19, col="gray",
     ylim = c(min_combine, max_combine))
points(x=wt, y=disp, pch="*", col="red")
legend(x="topleft", legend = c("mpg", "disp"), col=c("gray", "red"), pch = c(19,8))
detach(mtcars)

###########

a <- 1:10
x <- 1:100
y <- data.frame(matrix(nrow = length(x), ncol = length(a)))
rownames(y) <-x
colnames(y) <-a
for(i in 1:length(a)){
  y[i]<-a[i]*x
}
head(y)

par(bg="aliceblue")
plot(c(0,0), main = "Lines of 'y=ax'", xlab = "x", ylab = "y=ax", 
     xlim = c(min(x), max(x)), ylim = c(min(y), max(y)), type = "n")
mycolor <- rainbow(length(a))
for (i in 1:length(a)) {
  lines(x, y[[i]], col=mycolor[i])
}
legend(x="topleft", legend = paste("a=",a), col=mycolor, lty=1, bg="white", cex=1.0)

########### boxplot

par(bg="white")
x <- 1:100
stem(x, scale = 2)

x <- runif(100, 1, 10)
y <- runif(100, 1, 10)
z <- runif(100, 1, 10)

x_ax <- as.factor(c(rep("x", 100), rep("y", 100), rep("z", 100)))
y_ax <- c(x, y, z)
boxplot(y~z)
boxplot(y_ax~x_ax)

############ histogram
x <- runif(100, 1, 10)
hist(x, ylim = c(0,1), main="Histogram of Randoms", breaks = 5, labels = T, freq = F)

############ barchart
y <- c(10, 30, 50, 20)
barplot(y, names = c("A", "B", "C", "D"))

attach(mtcars)
m <-table(gear, cyl)
m
barplot(m)
barplot(m, names = c("4cyl", "6cyl", "8cyl"), col = c("green", "yellow", "blue"))
barplot(m, beside = T, names = c("4cyl", "6cyl", "8cyl"), col = c("green", "yellow", "blue"))
detach(mtcars)

############ pie

attach(mtcars)
data <-table(cyl)
total <-sum(data)
pct <-round(data/total*100)
mylabel <- names(data)
mylabel <- paste(mylabel, " cyl (", pct, "%)", sep="")
mylabel
pie(data, init.angle = 90, label = mylabel, col=rainbow(length(data)))
detach(mtcars)

############ 강의 실습 1
library(MASS)
plot(Nile, main="Flow of the Fiver Nile in Time series(1871~1971)", xlab="Time", ylab="Flows")
lines(c(1871,1970), c(1000, 1000), lty = 3, col="red")


############ 강의 실습 2
library(MASS)
attach(survey)
length(table(Age))
m <- table(as.integer(Age), Smoke) #as.integer 소수점 밑을 버림 
m
barplot(m, beside = T, col = rainbow(nrow(m)), main = "How much the student smokes by age?"
        ,xlab="Smoke", ylab = "Number of students")
lines(100, 1000)
detach(survey)
