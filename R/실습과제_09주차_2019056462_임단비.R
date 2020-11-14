result_data <<- data.frame(alice_point = c(), bob_point = c())

game <- function(game_count){
  for(i in 1:game_count){
    card <- c(1:50) # 전체 카드 
    select <- c(sample(card, 50, replace = F)) # 뽑게 될 카드 순서 (랜덤하게)
    alice <-c(0) # Alice 점수
    bob <-c(0) # Bob 점수 
    for(i in 1 : 50){
      if(i%%2 != 0){ # alice 선택 
        a<-select[i]
        if(a%%2 == 0){ # 짝수를 뽑은 경우 
          alice <- alice+2
        }
        else{ # 홀수를 뽑은 경우 
          alice <- alice-1
        }
      }
      else{ #bob 선택
        b<-select[i]
        if(b%%2 != 0){ # 홀수를 뽑은 경우 +1 점 (짝수인 경우 그대로) 
          bob <- bob+1
        }
      }
    }
    newdata <- data.frame(alice, bob)
    result_data <<- rbind(result_data, newdata)
  }
  print(result_data) 
  print(paste("Alice가", game_count, "번의 게임 동안 얻은 평균 점수는", mean(result_data$alice) , "입니다."))
}
game(10)