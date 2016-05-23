library(stringr)

filename <- 'activity'
unzip(str_c(filename, '.zip'))
data <- read.csv(str_c(filename, '.csv'))
data$datePosix <- as.POSIXct(strptime(data$date, "%Y-%m-%d"))
file.remove(str_c(filename, '.csv'))