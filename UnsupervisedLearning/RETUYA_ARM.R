if(!require(arules)) install.packages("arules")
if(!require(arulesViz)) install.packages("arulesViz")

library(arules)
library(arulesViz)

data("Groceries")
rules <- apriori(Groceries, parameter = list(supp = 0.01, conf = 0.5))
rules_sorted <- sort(rules, by = "lift", decreasing = TRUE)
inspect(head(rules_sorted, 10))
plot(head(rules_sorted, 20), method = "graph")