#Example 1 code
y <- c(1,2,3)
y * 4


#Example 2 code
y + 3
y - 2
y / 5


#Example 3 code
# create two vectors of equal length
x <- c(10,20,30)
y <- c(40,50,60)
# add them
x + y
# subtract them
x - y
# multiply them
x * y
# divide them
x / y


# create the data frame for Example 4
employmentID<-c("A","B","C","D","E")
employerName<-c("Jack","Mike","Frank","Kate","Tom")
salary<-c(10.2,32.7,45.6,57.9,35.4)
startDate<-as.Date(c("2012-1-2","2011-3-4","2010-9-7","2010-3-5","2009-8-7"))
mydata<-data.frame(employmentID,employerName,salary,startDate)
mydata


#Example 6
#write data into file patient.csv on Desktop
patientdata<-write.csv(mydata,file="C:/Users/jx0848tg/Desktop/patient.csv")


#Example 7 code
mydata[1:3, 1:3]


#Example 8 code
mydata[c(5,1,3), c(3,2,1)]


#Example 9 code
# print first three rows and all columns
mydata[1:3, ]
# print all rows and first three columns
mydata[ , 1:3]


#Example 10 code
str(mydata)


#Example 11 code
names(mydata)


#Example 12 code
names(mydata[1:3])


#Example 13 code
summary(mydata)


#Example 14 code
summary(mydata[ , c("salary", "startDate")])


#Example 15 code
nrow(mydata)
ncol(mydata)
dim(mydata)
length(mydata$salary)


#Example 16 code
# calculate mean, st dev
mean(mydata$salary)
sd(mydata$salary)
# get specific values from a column
mydata$employerName


#Example 17 code
summary(mydata[, c("employerName","salary")])


#Example 18 code
age <- c(25,32,30,45,39)
ResidencyState <- c("MN", "WI", "MN", "MN", "WI")
(mydata2 <- cbind(mydata,age,ResidencyState))


#Example 19 code
# first make a copy of mydata2 to play with
mydata2_copy = mydata2
# print names() for quick reference
names(mydata2_copy)


#Example 20 code
# rename specific columns
names(mydata2_copy)[1] = "ID"
names(mydata2_copy)[2] = "Name"
names(mydata2_copy)[which(names(mydata2_copy) == "ResidencyState")] = "State"
mydata2_copy


#Example 21 code
which(names(mydata2) == "ResidencyState")


#Example 22 code
mydata2$age = NULL
mydata2


#Example 23 code
# make a copy of mydata2
mydata2_copy <- mydata2
names(mydata2_copy)
# remove employmentID, startDate, ResidencyState.  then check names()
mydata2_copy <- mydata2_copy[, -which(names(mydata2_copy)
                                      %in% c("employmentID","startDate","ResidencyState"))]
names(mydata2_copy)

 
#Example 24 code
-which(names(mydata2) %in% c("employmentID","startDate","ResidencyState"))


#Example 25 code
employmentID <- c("A","B","C","D","E")
employerName <- c("Jack","Mike","Frank","Kate","Tom")
salary <- c(10.2,32.7,45.6,57.9,35.4)
startDate <- as.Date(c("2012-1-2","2011-3-4","2010-9-7","2010-3-5","2009-8-7"))
age <- c(25,32,30,45,39)
ResidencyState <- c("MN","WI","MN","MN","WI")
mydata2 <- data.frame(employmentID,employerName,salary,startDate,age,ResidencyState)
mydata2
mydata2[c(1,3,4), ]


#Example 26 code
# which() individuals reside in Minnesota
which(mydata2$ResidencyState == "MN")


#Example 27 code
# create row index vector with which()
MN <- which(mydata2$ResidencyState == "MN")
# print MN rows
mydata2[MN, ]


#Example 28 code
subset(mydata2, subset=(ResidencyState == "MN"))


#Example 29 code
# pick rows 1, 2 and 3
mydata2[c(1,2,3), ]


#Example 30 code
mydata2[c(1,3,2,5,4), ]


#Example 31 code
order(mydata2$age)


#Example 32 code
mydata2[order(mydata2$age), ]


#Example 33 code
mydata2
mydata3 <- data.frame(employmentID=c("F","G"), employerName=c("Andy","Beth"),
                      salary=c(46.9,51.2), startDate=c("2016-4-1","2017-10-15"),
                      age=c(42,36),ResidencyState=c("MN","MN"))
combined <- rbind(mydata2,mydata3)
combined


#Example 34 code
dfx <- data.frame(id=factor(1:6), var1=11:16,
                  fac1=factor(c("A", "B", "C", "D", "E", "F")))
dfy <- data.frame(id=factor(c(4,5,6,7,8,9)), var2=15:10)
dfx
dfy


#Example 35 code
merge(dfx, dfy, by="id")


#Example 36 code
merge(dfx, dfy, by="id", all=TRUE)


#Example 37 code
merge(dfx, dfy, by="id", all.x=TRUE)


#Example 38 code
merge(dfx, dfy, by="id", all.y=TRUE)


#Example 39 code
df1 <- data.frame(time1=c(1, 2, 3, 4),
                  time2=c(3,5,6,7))
df1
stack(df1)


#Example 40 code
head(airquality)
newdata <- transform(airquality, logOzone = log(Ozone))
head(newdata)


#Example 41 code
# create  two vectors of equal length
x <- 1:10
y <- -5:4
x
y
x <= 5
x > y
x < y


#Example 42 code
# does 2 equal 3?
2 == 3
# does 2 not equal 3?
2 != 3
# is 2 less than 3?
2 < 3
# is 2 less than or equal to 3?
2 <= 3
# is 2 greater than 3?
2 > 3
# is 2 greater than or equal to 3?
2 >= 3


#Example 43 code
x <- 10:1
y <- -4:5
x
y
any(x < y)
all(x < y)


#Example 44 code
TRUE * 5
FALSE * 5


#Example 45 code
TRUE
T
T <- 7
T


#Example 46 code
z <- c(1, 2, NA, 8, 3, NA, 3)
z
is.na(z)


#Example 47 code
mean(z)


#Example 48 code
mean(z, na.rm=TRUE)


#Example 49 code
zchar <- c("Football", NA, "Soccer")
zchar
is.na(zchar)


#Example 50 code
arithmetic.mean <- function(x) base::sum(x)/length(x)
y <- c(3,3,4,5,5)
arithmetic.mean(y)


#Example 51 code
variance <- function(x) base::sum((x - mean(x))^2)/(length(x) - 1)
y <- c(13,7,5,12,9,15,6,11,9,7,12)
variance(y)


#Example 52 code
cv <- function(x) sd(x)/mean(x)
cv(1:10)


#Example 53 code
se <- function(x) sqrt(var(x)/length(x))


#Example 54 code
se <- function(x) sqrt(var(x)/length(x))
ci95 <- function(x) {
  t.value <- qt(0.975,length(x)-1)
  standard.error <- se(x)
  ci <- t.value*standard.error
  cat("95% Confidence Interval = ", mean(x) - ci, "to", mean(x) + ci,"\n") }
x <- rnorm(150,25,3)
ci95(x)


#Example 55 code
# if statement example

x=readline("Please enter a number")

if(x>0) {
  print(x)
}

#if-else statement example
x=0
if(x<0) {
  print ("negative number")
} else if (x>0)
{
  print ("Positive number")
}


#Example 56 code
# Payment calculation (if-else) example
price=function(hours, unitprice){
  netprice=unitprice*hours
  if((hours>100)&(hours<200)) {
    netprice=netprice*0.9
  } else if (hours>200){
    netprice=netprice*0.9*0.9
  }
  return(netprice)
}
price(120,20)


#Example 57 code
# for loop x square
x<-1:10
for (i in 1:10) {
  x[i]=x[i]*x[i]
  print (x[i])
}


#Example 58 code
# while loop example
x=0
y=0
z=0
while(x<10){
  y=x*x
  z=y+z
  x=x+1
}
z


#Example 59 code
#repeat loop example
x=0
y=0
repeat {
  y=x*x+y
  x=x+1
  if(x>=10){
    break
  }
}


#Example 60 code
# debug example using browser()
lsq<-function (X,Y,intercept=TRUE){
  X<-as.matrix(X)
  Y<-as.matrix(Y)
  plot(X,Y)
  nbunits<-nrow(X)
browser()
  if(intercept==TRUE)X<-cbind(rep(1,nbunits),X)
  betahat<-solve(T(X)%*%X)%*%t(X)%*%Y
  return (betahat)
}


#Example 61 code
#debug example using debug ()
debug (var)
var(1:3)
undebug(var)


#Example 62 code
x <- 2
class(x)


#EXample 63 code
is.numeric(x)


#Example 64 code
i <- 5L
i
is.integer(i)


#Example 65 code
is.numeric(i)


#Example 66 code
class(4L)
class(2.8)
4L * 2.8
class(4L * 2.8)
class(5L)
class(2L)
5L / 2L
class(5L / 2L)


#Example 67 code
x <- "data"
x
y <- factor("data")
y


#Example 68 code
nchar(x)
nchar("hello")
nchar(3)
nchar(452)
nchar(y)


#Example 69 code
date1 <- as.Date("2018-06-25")
date1
class(date1)
as.numeric(date1)
date2 <- as.POSIXct("2018-06-25 11:52")
date2
class(date2)
as.numeric(date2)


#Example 70 code
class(date1)
class(as.numeric(date1))


#Example 71 code
k <- TRUE
class(k)
is.logical(k)


#Example 72 and Figure 81 code
x <- sample(x=1:100, size=100, replace=TRUE)
x
mean(x)


#Example 73 and Figures 83-84 code
# copy x
y <- x
# choose a random 20 elements, using sample, to set to NA
y[sample(x=1:100, size=20, replace=FALSE)] <- NA
y
mean(y)
mean(y, na.rm=TRUE)


#Example 74 and Figure 86 code
scores <- c(85, 82, 77, 76)
weights <- c(1/8, 1/8, 1/4, 1/2)
mean(scores)
weighted.mean(x=scores, w=weights)
var(x)


#Example 75 and Figure 88 code
var(x)
sum((x - mean(x))^2) / (length(x) - 1)
sqrt(var(x))
sd(x)
sd(y)
sd(y, na.rm=TRUE)


#Figure 89 code
min(x)
max(x)
median(x)
min(y)
min(y, na.rm=TRUE)


#Figure 90 code
summary(x)
summary(y)


#Figure 91 code
# calculate the 25th and 75th quantile
quantile(x, probs=c(.25, .75))
# try the same on y
quantile(y, probs=c(.25, .75))
# this time use na.rm=TRUE
quantile(y, probs=c(.25, .75), na.rm=TRUE)
# compute other quantiles
quantile(x, probs=c(.1, .25, .5, .75, .99))


#Example 76 and Figures 92-93 code
X <- matrix(c(1,0,0,0,1,0,0,0,1),nrow=3)
X
class(X)
attributes(X)
nrow(X)
ncol(X)
dim(X)


#Example 77 and Figures 95-96 code
vector <- c(1,2,3,4,4,3,2,1)
V <- matrix(vector,byrow=T,nrow=2)
V
dim(vector) <- c(4,2)
vector
is.matrix(vector)
(vector <- t(vector))


#Example 78 and Figures 98-102 code
H3 <- matrix(c(1, 1/2, 1/3, 1/2, 1/3, 1/4, 1/3, 1/4, 1/5), nrow = 3)
H3
det(H3)
diag(H3)
trace <- function(data) base::sum(diag(data))
trace(H3)
diag(diag(H3))
X <- matrix(c(1, 2, 3, 1, 4, 9), ncol = 2)
X
t(X)


#Example 79 and Figures 104-106 code
Y <- 2 * X
Y
Y
X
Y + X
Y
t(Y)
X
t(Y) + X
X
Y
X * Y


#Example 80 and Figure 108 code
Y
t(Y)
X
t(Y) %*% X
Y %*% X


#Example 81 and Figure 110 code
X <- matrix(c(1,1,3,1,0,1,1,0,2,3,0,2,5,1,2,1,3,3,2,0),nrow=4)
X
mean(X[,5])
var(X[4,])
rowSums(X)
colSums(X)
rowMeans(X)
colMeans(X)


#Example 82 and Figures 112-114 code
apply(X,1,base::sum)
apply(X,2,base::sum)
apply(X,1,sqrt)
apply(X,2,sqrt)
X <- rbind(X,apply(X,2,mean))
X <- cbind(X,apply(X,1,var))
X
colnames(X) <- c(1:5,"variance")
rownames(X) <- c(1:4,"mean")
X