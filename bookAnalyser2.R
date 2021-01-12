#!/usr/bin/env R

dirData1 = "./data-test/execution1_Mystery_Mystery_1"
dirData2 = "./data-test/execution1_Mystery_Mystery_2"
dirData3 = "./data-test/execution1_Mystery_Romantic"
dirData4 = "./data-test/execution1_Mystery_Wartime" 
dirData5 = "./data-test/execution2_Romantic_Mystery"
dirData6 = "./data-test/execution2_Romantic_Romantic"
dirData7 = "./data-test/execution2_Romantic_Wartime"
# You must remove the previous graphics
listDirsMystery = c(dirData1, dirData2, dirData3, dirData4)
listDirsRomantic = c(dirData5, dirData6, dirData7)
listDirs = listDirsRomantic

setwd(dirname(rstudioapi::getSourceEditorContext()$path))
library(tm)
library(ggplot2)
library(wordcloud)
library(RWeka)
library(reshape2)
source("functions.R")

for(dirData in listDirs) {
  #Loading of the files
  source.mybooksTest = DirSource(dirData, encoding = "UTF-8")
  
  corpusTest = Corpus(source.mybooksTest)
  summary(corpusTest)
  
  
  myStopwords = c(stopwords("spanish"),"élope", "ércules", "dos", "ía", "tres", "ís", 
                  "éste", "así", "señora", "señorita", "monsieur", "madame",
                  "ción", "pre", "ustedes", "vos", "mademoiselle", "ñoría", "caballeros",
                  "ñka", "hallaba", "dije", "aí")
  
  #No hay transformaciones (Ya estan en Ptyhon)
  freq <- myTermFreqMatrix(corpusTest, myStopwords)
  
  
  nameList = unlist(strsplit(dirData, "/"))
  name =  nameList[length(nameList)]
 # print(name)
  jpeg(paste(dirData, "/", name, ".jpeg", sep = ""))
  plot(sort(freq, decreasing = T),col="blue",main="Word TF-IDF frequencies", xlab="TF-IDF-based rank", ylab = "TF-IDF")
  dev.off()
  file.show(paste(dirData, "/", name, ".jpeg", sep = ""))
  tail(sort(freq),n=100)
}
