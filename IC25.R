library(ggplot2)
library(stringr)

data$Date[data$Date=="M06"] <- "03.06"
data$Date[data$Date=="M23"] <- "03.23"
data$Date[data$Date=="J05"] <- "06.05"
data$Date[data$Date=="J15"] <- "06.15"
data$Date[data$Date=="S04"] <- "09.04"
data$Date[data$Date=="S21"] <- "09.21"
data$Date[data$Date=="D04"] <- "12.04"
data$Date[data$Date=="D21"] <- "12.21"
data$Avg.Daily.Entries.n <- as.double(str_sub(data$Avg.Daily.Entries, end = 3))


ggplot(subset(data, Station.Name == "Bethesda" & Date == "03.06"),
       aes(Time.Period, Avg.Daily.Entries.n)) +
  geom_col() +
  labs(title = "Average Daily Entries in Bethesda Over Time on March 6",
       x = "Time of Day", y = "Average Daily Entries (Thousands)")


area <- c("Bethesda")
ggplot(subset(data, Station.Name %in% area),
       aes(Date, Avg.Daily.Entries.n, fill = Time.Period)) +
  geom_col() +
  labs(title = "Average Daily Entries in Bethesda Over Time",
       x = "Date (MM.DD)", y = "Average Daily Entries (Thousands)",
       fill = "Time of Day")
