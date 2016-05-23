source('src/daily_stats.R')

i_avg <- interval_average(data)
plot(i_avg$interval, i_avg$mean, main='Average Activity Pattern', 
     xlab='Interval Number', ylab='Average Number of Steps', type='l')
print('Maximum number of steps for any 5-minute interval is:')
mx <- max(i_avg$mean)
print(mx)
print('Maximum activity occurs at interval:')
print(i_avg$interval[i_avg$mean == mx])