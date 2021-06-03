library(rtweet)        # Used for extracting the tweets
library(tm)            # Text mining cleaning
library(qdapRegex)     # Removing URLs 
library(wordcloud2)    # Creating the wordcloud
library(RColorBrewer)
library(stringr)
library(htmlwidgets)
library(webshot)
webshot::install_phantomjs()

mach_tweets = search_tweets("Forgiveness", n=10000, lang="en")
text <- str_c(mach_tweets$text)
text <- 
  text %>%
  str_remove("\\n") %>%                   # remove linebreaks
  rm_twitter_url()
docs <- Corpus(VectorSource(text))
docs <- tm_map(docs, content_transformer(tolower)) 
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removeWords, stopwords("english")) 
docs <- tm_map(docs, removePunctuation) 
docs <- tm_map(docs, stripWhitespace) 
toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
docs <- tm_map(docs, toSpace, "'")
tdm <- TermDocumentMatrix(docs) ### term-document matrix
matrix <- as.matrix(tdm)
words <- sort(rowSums(matrix),decreasing=TRUE)
df <- data.frame(word = names(words),freq=words)
uxc.background = "#2e3347"
uxc.colors = "#ae4e65"

x = wordcloud2(df, 
           figPath = "E:/darsi/r/1200px-Red_heart_with_heartbeat_logo.svg.png",
           size = 7, color = uxc.colors, backgroundColor=uxc.background,
           fontFamily = "xkcd")
x
saveWidget(x,"tm.html",selfcontained = F)
library(webshot)
webshot::install_phantomjs()
webshot("tm.html","fig_1.png", vwidth = 800, vheight=450)
webshot::webshot("tm.html","tm.png",vwidth = 1992, vheight = 1744, delay =10)
