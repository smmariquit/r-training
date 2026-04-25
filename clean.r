install.packages(c("tm", "SnowballC", ""))

library(tm)
library(SnowballC)
library(textstem)

data(crude)
corpus <-crude

corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stripWhitespace)

corpus <- tm_map(corpus, content_transformer(lemmatize_strings))
corpus <- tm_map(corpus, stemDocument)

cleaned_text <- sapply(corpus, function(x) x$content)

tokenized_text <- strsplit(cleaned_text, "\\s+")
print(tokenized_text[[1]])

