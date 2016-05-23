source('src/daily_stats.R')

daily_sum_steps <- sum_steps_daily_dataframe(impute_data)
hist(daily_sum_steps$sum, breaks=10, xlab='Number of steps per day', 
     ylab='Frequency', main= 'Histogram of Daily Steps')
abline(v=mean(daily_sum_steps$sum), lty=2)
abline(v=median(daily_sum_steps$sum), lty=3)
print('The mean number of steps is:')
print(mean(daily_sum_steps$sum))
print('The median number of steps per day is:')
print(median(daily_sum_steps$sum))