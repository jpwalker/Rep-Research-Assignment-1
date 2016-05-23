source('src/daily_stats.R')

impute <- function(steps, interval, avg_inter) {
  if (is.na(steps)) {
    return(avg_inter$mean[avg_inter$interval == interval])
  }
  else {
    return(steps)
  }
}

print('Number of NAs is:')
print(sum(is.na(data$steps)))
impute_data <- data
avg_inter <- interval_average(data)
new_steps <- mapply(impute, steps = data$steps, interval = data$interval,
                    MoreArgs = list(avg_inter = avg_inter), USE.NAMES = FALSE)
impute_data$steps <- new_steps
print('Number of NAs after imputing:')
print(sum(is.na(impute_data$steps)))