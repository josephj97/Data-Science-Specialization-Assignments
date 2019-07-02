fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
destFile<-"E:/Courses/Data Science/Assignments/03.01/getdata%2Fdata%2Fss06hid.csv"
if(!file.exists(destFile)){
    download.file(fileUrl,destfile = destFile)
}
data<-read.csv("E:/Courses/Data Science/Assignments/03.01/getdata%2Fdata%2Fss06hid.csv")
worth1M<-length(data$VAL[!is.na(data$VAL) & data$VAL == 24])
worth1M

#-------------------------------------------------------------------------------------------------------

library(xlsx)
fileUrl2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
destFile2<-"E:/Courses/Data Science/Assignments/03.01/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
if(!file.exists(destFile2)){
    download.file(fileUrl2,destfile = destFile2, mode = "wb")
}
colInd<-7:15
rowInd<-18:23
#named dat because the the question in the quiz wanted so..
dat<-read.xlsx("E:/Courses/Data Science/Assignments/03.01/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",sheetIndex = 1,colIndex = colInd,rowIndex = rowInd)
sum(dat$Zip*dat$Ext,na.rm=T)

#-------------------------------------------------------------------------------------------------------

library(XML)
fileUrl3<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
data3<-xmlTreeParse(sub("s", "", fileUrl3),useInternal = TRUE)
rootNode<-xmlRoot(data3)
xmlName(rootNode)
names(rootNode)
result3<-sum(xpathSApply(rootNode,"//zipcode",xmlValue) == 21231)
result3

#-------------------------------------------------------------------------------------------------------

library(microbenchmark)
fileUrl4<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
destFile4<-"E:/Courses/Data Science/Assignments/03.01/getdata%2Fdata%2Fss06pid.csv"
if(!file.exists(destFile4)){
    download.file(fileUrl4,destfile = destFile4)
}
DT<-fread("E:/Courses/Data Science/Assignments/03.01/getdata%2Fdata%2Fss06pid.csv")

mbm = microbenchmark(
    v3 = sapply(split(DT$pwgtp15,DT$SEX),mean),
    v6 = DT[,mean(pwgtp15),by=SEX],
    v7 = tapply(DT$pwgtp15,DT$SEX,mean),
    v8 = mean(DT$pwgtp15,by=DT$SEX),
    times=100
)
mbm
