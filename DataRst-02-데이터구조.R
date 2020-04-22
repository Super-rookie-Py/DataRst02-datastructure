### 2020/04/22 Keonwoo Park

### 데이터 구조론


# sum (1:n)
Sum = 0
n=100
for(i in 1:n){
  Sum = Sum + i
}
print(Sum)

# sum(1:n)

Sum = 0
n = 100
for(i in 1:n){
  for(j in i:n){
    Sum = Sum + j
  }
}
print(Sum)

# sum (1:n) (i:n) onlt odd number
# n: even number O(n), n: odd number O(n^2)

Sum = 0
n=100
for(i in 1:n){
  if(n %% 2)
  for(j in i:n){
    Sum=Sum + j
  }
}
print(Sum)


# sum (1:sample(1:n, 1)) 1에서 n사이 숫자 하나 랜덤추출
# k = 1 O(1), K=n(무수히 큰수) O(n)
 
Sum=0
n=100
k= sample(1:n,1)

for(i in 1:k){
  Sum=Sum + i
}
print(c(k,Sum))
  
  

### pie

Pie <- function(n){
  y = runif(n,-1,1)
  x = runif(n,-1,1)    #n개의 무작위 값
  r = (x^2+y^2)^(1/2)  #0,0으로부터의 거리
  n1 = length(r[r<=1]) #거리가 1이하의 개수를 찾는다.
  return(4*n1/n)       # 1이하의 개수를 전체 개수로 나누고, 
                       #사각형의 면적을 곱하면 원넓이 =파이 근사치를 구할 수 있다.
}

runif(10,min=0,max=10)
rnorm(10,mean=0,sd=10)
rt(10,10)

Pie(10)
Pie(100)
Pie(1000)
Pie(10000)
Pie(100000)
Pie(1000000)
Pie(10000000)
Pie(100000000)



###### Distance Table(그래프 데이터 구조)
data_distance<-matrix(nrow=5, ncol=5)
data_distance[,] = Inf
data_distance[1,2]=1
data_distance[1,3]=3
data_distance[1,5]=2
data_distance[2,1]=1
data_distance[2,3]=1
data_distance[3,2]=1
data_distance[3,1]=3
data_distance[3,4]=2
data_distance[4,3]=2
data_distance[4,5]=2
data_distance[5,1]=2
data_distance[5,4]=2
data_distance[3,2]=1
data_distance[3,1]=3
data_distance[3,4]=2
data_distance[4,3]=2
data_distance[4,5]=2
data_distance[5,1]=2
data_distance[5,4]=2
# 그래프 방식인경우 길이없는 경우 필요없는 데이터를 차지한다.

### 해결방법.
data_distance_1<-NULL

temp_distance<-data.frame(Origin=0,Destination=0,Distance=0)

## index table
index_distance<-data.frame(Origin=1:5,Index=rep(0,time=5))

i1=0
pre_i=0
for(i in 1:5){
  for(j in 1:5){
    if(is.finite(data_distance[i,j])){
      temp_distance$Origin=i
      temp_distance$Destination=j
      temp_distance$Distance<-data_distance[i,j]
      data_distance_1<-rbind(data_distance_1,temp_distance)
      ## index table
      i1=i1+1
      if(pre_i!=i){
        index_distance$Index[i]=i1
        pre_i=i
      }
    }
  }
}
data_distance_1 ### 대신 데이터를  찾는데 시간이 걸린다.

index_distance # for문을 돌릴때 찾을 위치를 정할 수 있음.

