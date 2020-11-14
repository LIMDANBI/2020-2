rcp_data <<- data.frame(name = c(), total = c(), win = c(), tie = c(), lose = c(), cwin_rate = c()) 
game <- function(game_count) {
  print("가위바위보 게임입니다. ")
  print("전체 전적은 다음과 같습니다. ")
  print(rcp_data)
  
  username <- readline("당신의 이름을 입력해주세요 :  ")
  newdata <- data.frame(name = username)
  userdata <- c(0,0,0)
  
  for(i in 1:game_count){
    print(paste(as.numeric(i), "번째 게임입니다. "))
    computer <- sample(1:3, 1, replace = T)
    user <- as.numeric(readline())
    print(paste("가위(1), 바위(2), 보(3) 중에 하나를 내세요 ", computer, user))
    if(computer == user  ){
      print("비겼습니다.")
      userdata[2] <- userdata[2] + 1
    }
    else{
      if((computer == 1 & user == 2) | (computer == 2 & user == 3) | (computer == 3 & user == 1) ){
        print("이겼습니다.")
        userdata[1] <- userdata[1] + 1
      }
      else{
        print("졌습니다.")
        userdata[3] <- userdata[3]+1
      }
    }
  }
  print(paste("전적 : ", userdata[1], "승 ", userdata[2], "무 ", userdata[3], "패 "))
  
  newdata$total <- game_count
  newdata$win <- userdata[1]
  newdata$tie <- userdata[2]
  newdata$lose <- userdata[3]
  
  if(as.character(username) %in% rcp_data$name){
    past_total <- tapply(rcp_data$total, rcp_data$name, sum)[username]
    past_win <- tapply(rcp_data$win, rcp_data$name, sum) [username]
    newdata$cwin_rate <- (past_win+userdata[1])/(past_total+game_count)
  }
  else{
    newdata$cwin_rate <- userdata[1] / game_count
  }
  rcp_data <<- rbind(rcp_data, newdata)
  print(rcp_data)
}

game(5)