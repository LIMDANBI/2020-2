a <- c(95, 75, 85, 90, 77, 97, 67, 99, 88, 82)
b <- c(100, 65, 70, 70, 80, 60, 88, 99, 75, 90)
scoreA <- matrix(data = a, nrow = 2, byrow = T)
scoreB <- matrix(data = b, nrow = 2, byrow = T)
colnames(scoreA) <- c("KOR", "ENG", "MAT", "SOC", "SCI")
rownames(scoreA) <- c("MID", "FINAL")
colnames(scoreB) <- c("KOR", "ENG", "MAT", "SOC", "SCI")
rownames(scoreB) <- c("MID", "FINAL")

#1번 

scoreA
scoreB

sA<-rowSums(scoreA)
sA[2]
sB<-rowSums(scoreB)
sB[2]
rowSums(scoreB)["FINAL"] < rowSums(scoreA)["FINAL"]
rowSums(scoreA)[2]
rowSums(scoreB)[2]
rowSums(scoreA)[2] > rowSums(scoreB)[2]

#2번 
col(scoreA)
colnames(scoreA)[col (scoreA)[which(scoreA == max(scoreA))]]
colnames(scoreB)[col (scoreB)[which(scoreB == max(scoreB))]]
