library(MASS)
attach(cats)
#고양이의 성별에 따른 개체 수 
summary(Sex)
barplot(summary(Sex), main = "The number of sex-based individuals in cats", names = c("female","male"))

# 고양이의 몸무게에 따른 심장무게 
xm <- summary(Bwt)["Min."]
xM <- summary(Bwt)["Max."]
ym <- summary(Hwt)["Min."]
yM <- summary(Hwt)["Max."]
plot(x=Bwt, y=Hwt, main = "Heart Weight (g) by Body Weight (kg) of Cats",
     xlab = "Body Weight (kg)", ylab = "Heart Weight (g)", 
     xlim=c(floor(xm), ceiling(xM)), ylim= c(floor(ym), ceiling(yM)), pch="#", col="red")
detach(cats)