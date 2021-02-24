library(micromapST)
veterans<-read.csv(file='ACS07and17Edited.csv',header=TRUE,as.is=TRUE)

veterans$Zero <- rep(0, nrow(veterans))
veterans$change <- veterans$VET2017_PRCNT18PLUS_EST -
  veterans$VET2007_PRCNT18PLUS_EST 
veterans$UBchange <- veterans$change + veterans$CHANGE_MOE
veterans$LBchange <- veterans$change - veterans$CHANGE_MOE 

type=c('maptail','id','arrow','arrow','dotconf')
lab1=c('','','2007 To','0 To','2017 -2007')
lab2=c('','','2017','2017-2007','and 90% CI')
col1 = c(NA,NA,'VET2007_PRCNT18PLUS_EST','Zero','change')
col2 = c(NA,NA,'VET2017_PRCNT18PLUS_EST','change','LBchange')
col3 = c(NA,NA,NA,NA,'UBchange')
refVals=c(NA,NA,NA,0,0)
panelDesc <- data.frame(type,lab1,lab2,col1,col2,col3,refVals)

fName = "VeteransMicroMap5.pdf"
pdf(file=fName,width=7.5,height=10)

micromapST(veterans,panelDesc,
           rowNamesCol='State',
           rowNames='full',
           sortVar=16,ascend=FALSE,
           title=c("Veteran percentages of population 18 years and older: 2007 and 2017",
                   "by Amrita Jose"),
           ignoreNoMatches=TRUE)

dev.off()


