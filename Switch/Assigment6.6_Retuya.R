choice <- as.numeric(readline("Choose Operator: 1 for add | 2 for subtract | 3 for mulitplication | 4 for division "))
a <- 10
b <- 5

result <- switch(choice,
                 a + b,   
                 a - b,    
                 a * b,    
                 a / b,    
                 "Invalid choice")

print(result)
