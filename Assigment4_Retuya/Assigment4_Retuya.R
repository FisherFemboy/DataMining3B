age <- as.integer(readline(prompt = "Enter age: "))

if (age <= 12) {
  group <- "Child"
} else if (age >= 13 && age <= 19) {
  group <- "Teenager"
} else if (age >= 20 && age <= 59) {
  group <- "Adult"
} else {
  group <- "Senior"
}

print(paste("Age group:", group))
