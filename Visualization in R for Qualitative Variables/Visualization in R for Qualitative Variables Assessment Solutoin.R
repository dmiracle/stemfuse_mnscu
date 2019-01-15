#Learning Objective One Assessment one
Hair=c("Brown","Black","Black","Blond","Blond","Brown", "Blond", "Blond", "Blond","Red")
x=as.numeric(table(Hair))
dotchart(x,labels=c("Black","Blond","Brown","Red"),main="Hair Color Frequencies")

#Learning Objective One Assessment two
Eye=c("Green","Brown","Brown","Yellow","Yellow","Brown","Brown")
y=as.numeric(table(Eye))
dotchart(y,labels=c("Green","Brown","Yellow"),main="Eye Color Frequencies",pch=21)

#Learning Objective Two Assessment
Immunization<-c(77,32,94,99,89,13,91,47,76)
Mortality<-c(118,184,43,12,55,208,33,145,87)
barplot(Immunization,main="Immunization Rate of Nine Countries")
axis(1,at=1:9,labels=c("Bolivia","Cambodia","China","CzechRepublic","Egypt","Ethiopia","Mexico","Senegal","Turkey"))

#Learning Objective Three Assessment
Immunization<-c(77,32,94,99,89,13,91,47,76)
Mortality<-c(118,184,43,12,55,208,33,145,87)
country<-c("Bolivia","Cambodia","China","Czech Republic","Egypt","Ethiopia","Mexico","Senegal","Turkey")
v<-rbind(Immunization, Mortality)
barplot(v,besides=FALSE,names.arg=country,main="Immunization and Mortality Rate of Nine Countries",xlab="Country")

#Learning Objective Four Assessment

color<-c("blue","black","red","red","grey","red","blue","green","black","black","red","red","black")
x=table(color)
categories<-c("black","blue","green","grey","red")
pie(x,labels=categories,col=categories,main="paint color")

#Learning Objective Five Assessment

require(vcd)
Titanicdata=matrix(data=c(197,122,94,167,151,476),nrow=3,byrow=TRUE,dimnames=list(ClassTravel=c("First","Second","Third"), Survival=c("Survived","Died")))
mosaic(Titanicdata)
