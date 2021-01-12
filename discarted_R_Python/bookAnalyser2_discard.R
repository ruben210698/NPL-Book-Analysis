# Second analysis, with only the verbs contained in the text

setwd(dirname(rstudioapi::getSourceEditorContext()$path))
getwd()

library(tm)
library(ggplot2)
library(wordcloud)
library(RWeka)
library(reshape2)

library(rJava)
.jinit(parameters="-Xmx4g")
# If there are more memory problems, invoke gc() after the POS tagging
library(NLP) 
#install.packages("openNLPmodels.en", repos = "http://datacube.wu.ac.at/", type = "source")
library(openNLP)
library(openNLPmodels.en)
library(tm)
library(stringr)
source("functions.R")

library(udpipe)
#ud_model <- udpipe_download_model(language = "spanish")
library(textrank)


###### Create a single file for all the books of the model
setwd("./data/mystery/")
ListOfFileNames <- list.files(pattern = ".txt")
outFile <- file("../../data-test/allMysteryBooks.txt", "w")
txtAll = ""
for (i in ListOfFileNames){
  x <- readLines(i)
  txtAll <- paste(txtAll, x, sep=" ")
  writeLines(x, outFile)
}
close(outFile)
setwd(dirname(rstudioapi::getSourceEditorContext()$path))
#####################

path = "./review_polarity_small/txt_sentoken/"



#source.mybooksTest = DirSource("./data-test", encoding = "UTF-8")
dir = DirSource("./data/prueba/pos", encoding = "UTF-8")
corpus = Corpus(dir)
summary(corpus)
length(corpus)

inspect(corpus[[1]])
#inspect(Corpus(source.mybooksTest)[[1]])
#########################################################################################################


library("openNLP")

library(NLP)
library(openNLP)

tagPOS <-  function(x, ...) {
  s <- as.String(x)
  word_token_annotator <- Maxent_Word_Token_Annotator()
  a2 <- Annotation(1L, "sentence", 1L, nchar(s))
  a2 <- annotate(s, word_token_annotator, a2)
  a3 <- annotate(s, Maxent_POS_Tag_Annotator(), a2)
  a3w <- a3[a3$type == "word"]
  POStags <- unlist(lapply(a3w$features, `[[`, "POS"))
  POStagged <- paste(sprintf("%s/%s", s[a3w], POStags), collapse = " ")
  list(POStagged = POStagged, POStags = POStags)
}


txtAllTag <- tagPOS(txtAll)

sapply(strsplit(txtAllTag,"[[:punct:]]*/VB.?"),function(x) {res = sub("(^.*\\s)(\\w+$)", "\\2", x); res[!grepl("\\s",res)]} )


#########################################################################################################













myStopwords = c(stopwords("spanish"),"élope", "ércules", "dos", "ía", "tres", "ís", 
                "éste", "así", "señora", "señorita", "monsieur", "madame",
                "ción", "pre", "ustedes", "vos", "mademoiselle", "ñoría", "caballeros",
                "ñka", "aí")

#corpus <- myTrasnformation(corpus)
#corpusTest <- myTrasnformation(corpusTest, 0)







#freq <- myTermFreqMatrix(corpusTest, myStopwords)
#plot(sort(freq, decreasing = T),col="blue",main="Word TF-IDF frequencies", xlab="TF-IDF-based rank", ylab = "TF-IDF")
#tail(sort(freq),n=100)



