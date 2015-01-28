data1 <- read.csv("datasets/dds_ch2_nyt/nyt1.csv")
b <- c(-Inf,0,18, 24, 34, 44, 54, 64,Inf)
data1$Age_Group <- cut(data1$Age, b)
