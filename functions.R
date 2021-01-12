#!/usr/bin/env R

library(tm)
library(ggplot2)
library(wordcloud)
library(RWeka)
library(reshape2)

library(rJava)
.jinit(parameters="-Xmx4g")
# If there are more memory problems, invoke gc() after the POS tagging
library(NLP) 
library(openNLP)
library(tm)
library(stringr)


myTrasnformation <- function(corpus, deleteProperNames) {
  for(i in seq(corpus)) {
    print(paste0("Book: ", i))
    
    corpus[[i]] = gsub("/", " ",   corpus[[i]])
    corpus[[i]] = gsub("@", " ",   corpus[[i]])
    if(deleteProperNames){
      corpus[[i]] = gsub("(([A-Z])|([ÁÉÍÓÚ]))[A-z]*", " ",   corpus[[i]])
    }
    corpus[[i]] = gsub("\\|", "",  corpus[[i]])
    corpus[[i]] = gsub("»", " ",   corpus[[i]])
    corpus[[i]] = gsub("«", " ",   corpus[[i]])
    corpus[[i]] = gsub("—", " ",   corpus[[i]])
    corpus[[i]] = gsub("––", " ",   corpus[[i]])
    
    corpus[[i]] = gsub("\\“", " ",   corpus[[i]])
    corpus[[i]] = gsub("\\”", " ",   corpus[[i]])
    corpus[[i]] = gsub("\\’", " ",   corpus[[i]])
    corpus[[i]] = gsub("\\–", " ",   corpus[[i]])
    
  }
  #substr(corpus[[4]], start = 1, stop = 1000)
  
  ############################################################
  
  corpus
  
} # END Function




myTermFreqMatrix <- function(corpus, myStopwords) {
  # Get the term frequency
  tdm.tfidf = TermDocumentMatrix(corpus,
                                 control = list(weighting = weightTfIdf,
                                                stopwords = myStopwords,
                                                removePunctuation = T, 
                                                removeNumbers = T,
                                                stripWhitespace = T,
                                                tolower = T))
  
  freq=rowSums(as.matrix(tdm.tfidf))
  
  freq
}


