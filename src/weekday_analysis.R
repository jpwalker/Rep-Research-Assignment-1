source('src/daily_stats.R')
library(lattice)

is.weekend <- function(date) {
  day <- weekdays(date)
  if (day == "Sunday" | day == "Saturday") {
    return('Weekend')
  }
  else {
    return('Weekday')
  }
}

assign_weekdays <- function(data) {
  wdays <- sapply(data$datePosix, is.weekend, USE.NAMES = FALSE)
  data$wdays <- wdays
  return(data)
}

impute_data <- assign_weekdays(impute_data)
# Create subsetted dataframes.
weekend_data <- subset(impute_data, wdays == 'Weekend')
weekday_data <- subset(impute_data, wdays == 'Weekday')
# Find the average steps for each interval.
weekend_inter_avg <- interval_average(weekend_data)
weekday_inter_avg <- interval_average(weekday_data)
# Create new column for the subsetted datasets marking weekend/weekday
weekend_inter_avg$is.weekend <- array(data='Weekend', 
                                      dim = length(weekend_inter_avg$interval))
weekday_inter_avg$is.weekend <- array(data='Weekday', 
                                      dim = length(weekday_inter_avg$interval)) 
# Remerge dataset for lattice plotting.
merged <- merge(weekday_inter_avg, weekend_inter_avg, all=TRUE)
plt <- xyplot(mean ~ interval | is.weekend, merged, xlab='Interval Number', 
       ylab='Average Number of Steps', main='Average Activity Pattern', type='l')
print(plt)