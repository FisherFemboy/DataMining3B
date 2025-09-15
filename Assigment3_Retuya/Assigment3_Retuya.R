temp <- as.integer(readline(prompt = "Enter temperature: "))

if (temp >= 30) {
  category <- "Hot"
} else if (temp >= 20 && temp <= 29) {
  category <- "Warm"
} else {
  category <- "Cold"
}

print(paste("Temperature is:", category))
