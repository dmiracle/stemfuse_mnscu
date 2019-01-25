#Activity 1
candy=c("red","red","yellow","yellow","yellow","red","black","blue","blue","red","orange","black","yellow","blue","black","orange","yellow","black","red","orange")
table(candy)
x=as.numeric(table(candy))
dotchart(x,label=c("black","blue","orange","red","yellow"),main="Candy Color Distribution")

#Activity 2
candy=c("red","red","yellow","yellow","yellow","red","black","blue","blue","red","orange","black","yellow","blue","black","orange","yellow","black","red","orange")
y=table(candy)
barplot(y,names.arg=c("Black","Blue","Orange","Red","Yellow"), main="Candy Color Distribution", xlab="Color", ylab="Counts")

#Activity 3
sample=c("A","B","C","D","E")
value1=c(3,2,6,7,3)
value2=c(1,0,5,2,2)
sampledata=data.frame(sample,value1,value2)
sampledata
values=rbind(value1,value2)
barplot(values,beside=FALSE,names.arg=sample,legend=TRUE)

#Activity 4
affiliation=c("Republican","Democrat","Others")
number=c(101,129,70)
pie(number,labels=affiliation, main="Political Affiliation Distribution")

#Activity 5
M=matrix(data=c(21,16,145,2,6,14,4,175,13,4),nrow=2,byrow=TRUE,dimnames=list(Gender=c("Male","Female"), College=c("Business","Engineering","Liberal Arts","Nursing","Pharmacy")))
mosaic(M)