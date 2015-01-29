# group by age_group
# and desc data1 using age_group
# plot graph
library(psych)

data1 <- read.csv(url("http://taekjoobucket.s3.amazonaws.com/data/nyt1.csv"))
break_point <- c(-Inf,0,18, 24, 34, 44, 54, 64,Inf)
data1$Age_Group <- cut(data1$Age, break_point, labels 
                       = c("ZERO","U18", "U24","U34", "U44", "U54", "U64", "Over64"))

data1.desc <- describe.by(data1,data1$Age_Group)
