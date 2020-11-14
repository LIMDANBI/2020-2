A <- function(threw){  # alice -> rule A
  if(threw == 1 | threw == 2 | threw == 3 | threw == 6 ) return(T)
  else return(F)
}

B <-function(threw, before){ # Bob- > rule B
  if(before == 0) return(F)
  else{
    if((before%%2==0  & threw%%2==0) | (before%%2!=0  & threw%%2!=0)) return(T)
    else return(F)
  }
}

repgame <- function(n){
  dice <- list(A=0, B=0)
  dice$A <- 0
  dice$B <- 0
  for(i in 1:n){
    # 각각 5000원을 가지고 게임을 시작 
    dice$Alice <- 5000
    dice$Bob <- 5000
    before <- 0
    while(dice$Alice>0 & dice$Bob>0){ #한 사람이 돈을 모두 잃으면 게임 종료 
      threw <- sample(1:6, 1)
      threw
      a<-A(threw)
      b<-B(threw, before)
      if(a & b){
        dice$Alice <- dice$Alice-1000
        dice$Bob <- dice$Bob+1000
      }
      else if(a){
        dice$Alice <- dice$Alice+500
        dice$Bob <- dice$Bob-500
      }
      else if(b){
        dice$Alice <- dice$Alice-1000
        dice$Bob <- dice$Bob+1000
      }
      before <- threw
    }
    if(dice$Alice > dice$Bob) dice$A <- dice$A+1
    else dice$B <- dice$B+1
    dice$Alice <-5000
    dice$Bob <-5000 
  }
  print(dice$A/n)
  print(dice$B/n)
}

repgame(100000)