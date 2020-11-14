medicine <- data.frame(MEDICINE = c("M1", "M1", "M1", "M1", "M1", "M2", "M2", "M2", "M2", "M2", "M3", "M3", "M3", "M3", "M3"),
                       SUBJECT = c("S1", "S2", "S3", "S4", "S5", "S1", "S2", "S3", "S4", "S5", "S1", "S2", "S3", "S4", "S5"),
                       EFFECT = c(0.62, 0.77, 0.33, 0.27, 0.84, 0.15, 0.13, 0.29, 0.18, 0.62, 0.72, 0.13, 0.09, 0.57, 0.44),
                       PROBLEM = c(0.11, 0.05, 0.16, 0.89, 0.77, 0.13, 0.77, 0.22, 0.10, 0.21, 0.33, 0.31, 0.42, 0.55, 0.66))
medicine

# 약물 별 평균 효과 발생률
tapply(medicine$EFFECT, medicine$MEDICINE, mean)
# 약물 별 평균 문제 발생률
tapply(medicine$PROBLEM, medicine$MEDICINE, mean)
# 평균 문제 발생률이 높은 약물부터 순서대로 출력
names(sort(tapply(medicine$PROBLEM, medicine$MEDICINE, mean), decreasing = T))
