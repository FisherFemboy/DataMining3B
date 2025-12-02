# Install packages if they are missing
if(!require(arules)) install.packages("arules")
if(!require(arulesViz)) install.packages("arulesViz")

# Load the libraries
library(arules)
library(arulesViz)

# Load the Groceries dataset
data("Groceries")

# Run the Apriori algorithm
# [cite_start]Using support=0.01 and confidence=0.5 based on your lab slides [cite: 90]
rules <- apriori(Groceries, parameter = list(supp = 0.01, conf = 0.5))

# Sort the rules by "lift" to see the strongest connections first
rules_sorted <- sort(rules, by = "lift", decreasing = TRUE)

# View the top 10 rules
inspect(head(rules_sorted, 10))

# Visualize the rules
# We use head() here to avoid errors if there are fewer than 20 rules
plot(head(rules_sorted, 20), method = "graph")