# Activity 1: create two vectors, x and y and do x+y, 2*x, and y/3
x=c(3,5,7)
y=c(12,2,8)
x+y
2*x
y/3


#Activity 2: create a data frame to show patient ID, gender, temperature, 
#systolic blood pressure, oxygen level for 5 patients
ID<-c(1,2,3,4,5)
gender<-c("Female","Male","Female","Male","Male")
temp<-c(100.6,99.8,98.7,98.2,98.5)
SBP<-c(120,130,110,109,96)
oxygen<-c(98,96,90,97,95)
patientdata=data.frame(ID,gender,temp,SBP,oxygen)
patientdata


#Activity 3: export the patientdata into a CSV file
patientdata=write.csv(patientdata,file="C:/Users/jx0848tg/Desktop/patientdata.csv")


#Activity 4:  Consider the built-in data frame Formaldehyde.
#Extract the elements of the third row of this data frame.
Formaldehyde[3,]
#Extract the elements of the carb (carbohydrate) column.
Formaldehyde[,1]


#Activity 5:  Consider the built-in USArrests data frame.
#Determine the number of rows and columns for this data frame.
dim(USArrests)
#Calculate the median of each column of this data frame.
summary(USArrests)


#Activity 6:  Create the original data frame.
Name <- c("Alex", "Lilly", "Mark", "Oliver", "Martha", "Lucas", "Caroline")
Age <- c(25, 31, 23, 52, 76, 49, 26)
Height <- c(177, 163, 190, 179, 163, 183, 164)
Weight <- c(57, 69, 83, 75, 70, 83, 53)
Sex <- as.factor(c("F", "F", "M", "M", "F", "M", "F"))
df <- data.frame (row.names = Name, Age, Height, Weight, Sex)
levels(df$Sex) <- c("M", "F")
df
#Create the Working vector.
Working <- c("Yes", "No", "No", "Yes", "Yes", "No", "Yes")
#Create a new data frame adding Working as a column variable to the df data frame.
(df2 <- cbind(df,Working))


#Activity 7:  Consider the built-in data frame chickwts.
#Create a subset of the data frame called chickwts300p which contains all
#observations for which the weight exceeds 300.
chickwts300p <- subset(chickwts, weight > 300)
chickwts300p
#Create another subset called chickwtsLinseed which contains all observations for
#which the chicks were fed linseed.
chickwtsLinseed <- subset(chickwts, feed == "linseed")
chickwtsLinseed
#Calculate the average weight of the chicks which were fed linseed.
mean(chickwtsLinseed$weight)


#Activity 8:  Create the born data frame.
name <- c("Moe", "Larry", "Curly", "Harry")
year.born <- c(1887, 1902, 1903, 1964)
place.born <- c("Bensonhurst", "Philadelphia", "Brooklyn", "Moscow")
born <- data.frame(name, year.born, place.born)
born
#Create a second data frame called died.
name <- c("Curly", "Moe", "Larry")
year.died <- c(1952, 1975, 1975)
died <- data.frame(name, year.died)
died
#Perform an inner merge on the two data frames by using name to combine matched 
#rows.
merge(born, died, by = "name")


#Activity 9:  Using the BOD data frame in base R, create a new data frame
#which includes the square root of the demand variable from the BOD data frame.
head(BOD)
newdata <- transform(BOD, sqrtdemand = sqrt(demand))
head(newdata)


#Activity 10:  Calculate the expression (TRUE + TRUE) * FALSE.
(TRUE + TRUE) * FALSE


#Activity 11:  Calculate the mean of the vector A without the missing value.
A <- c(33, 21, 12, NA, 7, 8)
mean(A, na.rm=TRUE)


#Activity 12:  Create a function that will return the sum of two integers.
sum <- function (x, y) {
  r <- x + y
  r
}
#sum of 5 and 10
sum(5,10)


#Activity 13: use if-else statement to write the function of the decision about stocks
stock<-function (today, day1, day2, day3) {
  pastmean<-mean(c(day1, day2, day3))
  if(today<pastmean){
    decision<-"buy"
  } else if(today>pastmean){
    decision<-"sell"
  }else {
    decision<-"watch"
  }
  return(decision)
}

stock(25,36,41,20)


#Activity 14: find the sum of the first 100 squares using for loop
x=rep(0,100)
for(j in 1:100) {
  x[j]=j^2
}
sum(x)


#Activity 15: use while loop to print x^3 values until x is 10 (not including 10) with x=0 initially
x=0
while (x<10){
  print (x^3)
  x=x+1
}


#Activity 16: print x^3 values until x reaches 10, including 10 using the repeat loop
x=0
repeat{
  print (x^3)
  x=x+1
  if (x>10){
    break
  }
}


#Activity 17:  Conversion of five dates into date objects within the variable,
#Activity17Dates.
Activity17Dates <- as.Date(c("2010-02-07","2010-02-23","2010-02-08",
                           "2010-02-14","2010-02-10"))
Activity17Dates


#Activity 18:  Using the chickwts data frame, compute the 10th, 30th, and 90th
#percentiles of all the chick weights.
quantile(chickwts$weight, probs=c(.1, .3, .9))


#Activity 19:  Construct a 4 x 2 matrix that's filled row-wise.
vector <- c(4.3, 3.1, 8.2, 8.2, 3.2, 0.9, 1.6, 6.5)
M <- matrix(vector,byrow=T,nrow=4)
M


#Activity 20:  Create the four matrices.
M <- matrix(c(1,2,4,1,3,1),nrow=3)
N <- matrix(c(3,1,4,4,3,1),nrow=3)
O <- matrix(c(3,1,4,3,2,2),nrow=2)
P <- matrix(c(3,1,1,4,3,2,2,2,1),nrow=3)
M
N
O
P
#Calculate M + N.
M + N
#Calculate M - N
M - N
#Calculate 3M
3 * M
#Calculate M * O using M %*% O.
M %*% O
#Calculate O * M using O %*% M.
O %*% M
#Calculate transpose of M.
t(M)