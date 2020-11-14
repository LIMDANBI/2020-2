# 실습 1 
calender <- list( day = c("MON", "TUE", "WEN", "THU", "FRI", "SAT", "SUN"), month = 1:12, year = seq(1900, 2000, 20))
calender$day
calender$month
calender$year

calender2 <- calender
calender2$year <- c(seq(1900,2000,10))
calender2

year1900 <- calender2$year-1900
year1900

# 실습 2 
library(MASS)
data2 <- data.frame(District = Insurance$District, Holders = Insurance$Holders, Group =Insurance$Group)
newcol <- data.frame(Check = sapply(Insurance$Holders,  function(x) {x<500}))
data2 <-cbind(data2,newcol)
data2
data1<-Insurance
data1
result <- merge(data1, data2)
result
tail(result, 10)
tapply(result$Claims,result$District, sum)
tapply(result$Check, result$District, function(x){table(x)["TRUE"]}) # 이해 잘 안됨 ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ
