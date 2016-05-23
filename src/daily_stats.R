# Function returns the total step for a given date.
sum_steps_daily <- function(f_date, data) {
  return(sum(data$steps[data$date == f_date],na.rm=TRUE))
}

# Function returns the step sum for each day.
sum_steps_daily_dataframe <- function(data) {
  sums <- sapply(levels(data$date), sum_steps_daily, data, USE.NAMES = FALSE)
  return(data.frame(date_fctr = levels(data$date), sum = sums))
}

# Function averages across all days for a given interval.
average_interval_days <- function(interval, data){
  return(mean(data$steps[data$interval == interval], na.rm = TRUE))
}

# Function returns the average  number of steps for each interval averaged as 
# a function of days.
interval_average <- function(data) {
  means <- sapply(unique(data$interval), average_interval_days, data, USE.NAMES = FALSE)
  return(data.frame(interval = unique(data$interval), mean = means))
}