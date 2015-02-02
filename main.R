# 1. group by age_group
# 2. CTR at someday
# 3. group by something using CTR at someday
# 4. plot subsets by sex and sign-in at someday
# 5. desc data 1 using age_group at someday
# 6. expand the day

library(psych)
library(ggplot2)
library(doBy)
library(plyr)

data1 <- read.csv(url("http://taekjoobucket.s3.amazonaws.com/data/nyt1.csv"))
break_point <- c(-Inf,0,18, 24, 34, 44, 54, 64,Inf)
data1$Age_Group <- cut(data1$Age, break_point, labels 
                       = c("ZERO","U18", "U24","U34", "U44", "U54", "U64", "Over64"))

data1.desc <- describe.by(data1,data1$Age_Group)

summary(data1)
data1$CTR <- data1$Clicks/data1$Impressions

ctr <- function(data) {
  data$CTR <- data$Clicks/data$Impressions
}

siterange <- function(x){c(length(x), min(x), mean(x), max(x))}


summaryBy(CTR~Age_Group, data=data1, FUN = siterange) # NaN when CTR

ddply(data1, "Age_Group", summarise,
      N = length(CTR),
      min = min(CTR, na.rm = T),
      mean = mean(CTR, na.rm = T),
      max = max(CTR, na.rm = T) ) # use na.rm = T to remove NaN

