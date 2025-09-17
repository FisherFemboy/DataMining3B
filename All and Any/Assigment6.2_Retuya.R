scores <- c(75, 82, 60, 95, 40)

ifelse(all(scores >= 60),
       "All students passed",
       ifelse(any(scores < 60),
              "At least one student failed",
              "Uncertain results"))

