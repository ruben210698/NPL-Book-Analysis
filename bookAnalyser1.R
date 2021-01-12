#!/usr/bin/env R

#args<-commandArgs(TRUE)
#nameFolder = args[1]

# First analysis, with all the words contained in the text

setwd(dirname(rstudioapi::getSourceEditorContext()$path))
#getwd()

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
source("functions.R")


############################################ Mystery #######################################################

###### Create a single file for all the books of the model
setwd("./data/mystery/")
ListOfFileNames <- list.files(pattern = ".txt")
outFile <- file(
  "../../data-test-Exp1/execution1_Mystery_Mystery/allMysteryBooks.txt", "w")

for (i in ListOfFileNames){
  x <- readLines(i)
  writeLines(x, outFile)
}
close(outFile)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
#####################




#Loading of the files
#source.mystery = DirSource("./data/mystery", encoding = "UTF-8")
source.mybooksTest = DirSource("./data-test-Exp1/execution1_Mystery_Mystery/", 
                               encoding = "UTF-8")



#corpus = Corpus(source.mystery, source.mystery)
corpusTest = Corpus(source.mybooksTest)
summary(corpusTest)


myStopwords = 
  c(stopwords("spanish"),"élope", "ércules", "dos", "ía", "tres", "ís", 
  "éste", "así", "señora", "señorita", "monsieur", "madame",
  "ción", "pre", "ustedes", "vos", "mademoiselle", "ñoría", "caballeros",
  "ñka", "hallaba", "dije", "aí")


#corpus <- myTrasnformation(corpus)
corpusTest <- myTrasnformation(corpusTest, 1)

freq <- myTermFreqMatrix(corpusTest, myStopwords)


jpeg("./data-test-Exp1/execution1_Mystery_Mystery/execution1_Mystery_Mystery.jpeg")
plot(sort(freq, decreasing = T),col="blue",main="Word TF-IDF frequencies", 
     xlab="TF-IDF-based rank", ylab = "TF-IDF")
dev.off()
file.show("./data-test-Exp1/execution1_Mystery_Mystery/execution1_Mystery_Mystery.jpeg")
tail(sort(freq),n=100)



############################################ Romantic #######################################################
## The same code

###### Create a single file for all the books of the model
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
setwd("./data/romantic/")
ListOfFileNames <- list.files(pattern = ".txt")
outFile <- file(
  "../../data-test-Exp1/execution1_Mystery_Romantic/allRomanticBooks.txt", "w")

for (i in ListOfFileNames){
  x <- readLines(i)
  writeLines(x, outFile)
}
close(outFile)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
#####################




#Loading of the files
source.mybooksTest = DirSource("./data-test-Exp1/execution1_Mystery_Romantic/", 
                               encoding = "UTF-8")



corpusTest = Corpus(source.mybooksTest)
summary(corpusTest)


myStopwords = 
  c(stopwords("spanish"),"élope", "ércules", "dos", "ía", "tres", "ís", 
    "éste", "así", "señora", "señorita", "monsieur", "madame",
    "ción", "pre", "ustedes", "vos", "mademoiselle", "ñoría", "caballeros",
    "ñka", "hallaba", "dije", "aí")


corpusTest <- myTrasnformation(corpusTest, 1)

freq <- myTermFreqMatrix(corpusTest, myStopwords)


jpeg("./data-test-Exp1/execution1_Mystery_Romantic/execution1_Mystery_Romantic.jpeg")
plot(sort(freq, decreasing = T),col="blue",main="Word TF-IDF frequencies", 
     xlab="TF-IDF-based rank", ylab = "TF-IDF")
dev.off()
file.show("./data-test-Exp1/execution1_Mystery_Romantic/execution1_Mystery_Romantic.jpeg")
tail(sort(freq),n=100)





############################################ WarTime #######################################################
## The same code

###### Create a single file for all the books of the model
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
setwd("./data/wartime/")
ListOfFileNames <- list.files(pattern = ".txt")
outFile <- file(
  "../../data-test-Exp1/execution1_Mystery_Wartime/allWartimeBooks.txt", "w")

for (i in ListOfFileNames){
  x <- readLines(i)
  writeLines(x, outFile)
}
close(outFile)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
#####################




#Loading of the files
source.mybooksTest = DirSource("./data-test-Exp1/execution1_Mystery_Wartime/", 
                               encoding = "UTF-8")



corpusTest = Corpus(source.mybooksTest)
summary(corpusTest)


myStopwords = 
  c(stopwords("spanish"),"élope", "ércules", "dos", "ía", "tres", "ís", 
    "éste", "así", "señora", "señorita", "monsieur", "madame",
    "ción", "pre", "ustedes", "vos", "mademoiselle", "ñoría", "caballeros",
    "ñka", "hallaba", "dije", "aí")


corpusTest <- myTrasnformation(corpusTest, 1)

freq <- myTermFreqMatrix(corpusTest, myStopwords)


jpeg("./data-test-Exp1/execution1_Mystery_Wartime/execution1_Mystery_Wartime.jpeg")
plot(sort(freq, decreasing = T),col="blue",main="Word TF-IDF frequencies", 
     xlab="TF-IDF-based rank", ylab = "TF-IDF")
dev.off()
file.show("./data-test-Exp1/execution1_Mystery_Wartime/execution1_Mystery_Wartime.jpeg")
tail(sort(freq),n=100)



