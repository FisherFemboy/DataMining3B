temp <- c(32, 35, 29, 40)

ifelse(all(temp >= 30),
       "All days were hot",
       ifelse(any(temp < 30),
              "At least one day was below 30",
              "Mixed temperature readings"))




