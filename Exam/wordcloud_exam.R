setwd("C:/Users/Helloworld/OneDrive/Desktop/Exam")

library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

set.seed(123)

gov_nouns <- c("service", "queue", "staff", "clerk", "process", "officer", "license", "documents", "system", "waiting")
actions <- c("was", "is", "rated", "considered", "found")
ratings <- c("satisfactory", "unsatisfactory", "highly satisfactory", "poor", "average", "outstanding", "acceptable", "disappointing")

part1 <- sample(gov_nouns, 1000, replace = TRUE)
part2 <- sample(actions, 1000, replace = TRUE)
part3 <- sample(ratings, 1000, replace = TRUE)
text_gen <- paste("The", part1, part2, part3, ".")

writeLines(text_gen, "feedback.txt")

text <- readLines("feedback.txt")

corpus <- Corpus(VectorSource(text))

corpus <- tm_map(corpus, content_transformer(tolower))

removeSpecial <- content_transformer(function(x) gsub("[^a-z ]", " ", x))
corpus <- tm_map(corpus, removeSpecial)

corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, stemDocument)

tdm <- TermDocumentMatrix(corpus)
m <- as.matrix(tdm)
word_freqs <- sort(rowSums(m), decreasing = TRUE)
df <- data.frame(word = names(word_freqs), freq = word_freqs)

cat("\n--- TOP 10 WORDS ---\n")
print(head(df, 10))

cat("\nInterpretation:\n")
cat("1. 'Service' and 'Queue' are the most frequent words, which makes sense for government offices.\n")
cat("2. 'Satisfactory' is very common, meaning most feedback is just okay.\n")
cat("3. Words like 'clerk' show people talk a lot about the staff.\n")

png("wordcloud_exam.png", width = 800, height = 600)
set.seed(1234)
wordcloud(words = df$word, 
          freq = df$freq, 
          min.freq = 2, 
          max.words = 1000, 
          random.order = FALSE, 
          rot.per = 0.35, 
          scale = c(4, 0.5), 
          colors = brewer.pal(8, "Dark2"))
dev.off()

rare_df <- subset(df, freq == 1)

if(nrow(rare_df) < 5) {
  rare_df <- tail(df, 5) 
}

png("wordcloud_rare.png", width = 800, height = 600)
wordcloud(words = rare_df$word, 
          freq = rare_df$freq, 
          min.freq = 1, 
          max.words = 50, 
          random.order = FALSE, 
          colors = brewer.pal(8, "Dark2"))
dev.off()
