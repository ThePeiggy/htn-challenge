#Code is in R, you need the latest version from CRAN to run it

data <- read.csv("C:/Users/Tony Deng/Desktop/WSchallenge/htn-challenge/test.csv") #change to the directory of the csv
#colnames(data) <- c("Date", "Cashflow", "Mktvalue")
data[[2]] = c(0, diff(data[[3]], lag = 1))
output <- matrix(0, nrow = nrow(data), ncol = 1)

temp <- 1

output[1] <- 0
for(i in 2:nrow(data)){
  temp <- temp * (1 - (data[i, 3] - data[i, 2])/data[i, 3] - 1)
}

print(temp - 1)
