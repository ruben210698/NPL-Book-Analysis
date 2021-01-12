setwd(dirname(rstudioapi::getSourceEditorContext()$path))
#getwd()

library(tm)
library(ggplot2)
library(wordcloud)
library(RWeka)
library(reshape2)


#Loading of the files
source.mystery = DirSource("./data/mystery", encoding = "UTF-8")
corpus = Corpus(source.mystery)

#Some checks on correct reading
#length(corpus)
#summary(corpus)
#meta(corpus[[1]])
#meta(corpus[[2]])
#meta(corpus[[3]])
#meta(corpus[[4]])


#Create a default term document matrix
tdm = TermDocumentMatrix(corpus)
tdm
tdm[,1]
inspect(tdm[,1:4])

length(dimnames(tdm)$Terms)

freq=rowSums(as.matrix(tdm))
head(freq,10)
tail(freq,10)
# Se observa que, antes de hacer cualquier analisis sobre estos datos, se deben hacer una serie de transformaciones





#Transform the corpus
getTransformations()
#doc=corpus[1:4]
#doc=corpus[1]
#doc[[1]]$content[1]
stopwords("spanish")


docs <- corpus[1:4]
docs[0]
#for(j in c(1)){
for(j in seq(docs)) {
  print(paste0("Book: ", j))
  doc=docs[j]
  
  doc = tm_map(doc,removeWords,stopwords("spanish"))
  doc = tm_map(doc,removePunctuation)
  doc = tm_map(doc,removeNumbers)
  doc = tm_map(doc,stripWhitespace)
  doc = tm_map(doc, tolower)
  
  # Some other transformations
  doc <- gsub("/", " ", doc)
  doc <- gsub("@", " ", doc)
  doc <- gsub("\\|", "", doc)
  doc <- gsub("»", " ", doc)
  doc <- gsub("«", " ", doc)
  doc <- gsub("—", " ", doc)
  
  doc <- gsub("¿", " ", doc)
  doc <- gsub("\\?", " ", doc)
  doc <- gsub("!", " ", doc)
  doc <- gsub("¡", " ", doc)
  doc <- gsub("\\(", " ", doc)
  
  doc <- gsub("\\)", " ", doc)
  doc <- gsub("\\[", " ", doc)
  doc <- gsub("\\]", " ", doc)
  doc <- gsub("\\{", " ", doc)
  doc <- gsub("\\}", " ", doc)
  
  #### docs <- tm_map(docs, removeWords, c(“department”, “email”))
  
  docs[j] <- doc[[1]]
    
}
doc <- docs[1]
substr(doc[[1]], start = 1, stop = 1000)
#doc[[1]]$content[1]

#doc
#inspect(doc)

