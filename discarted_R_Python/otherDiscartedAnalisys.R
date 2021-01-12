#some other analyses made during the practice

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

#substr(corpus[[4]], start = 1, stop = 1000)

#Some checks on correct reading
#length(corpus)
#summary(corpus)
#meta(corpus[[1]])
#meta(corpus[[2]])
#meta(corpus[[3]])
#meta(corpus[[4]])


#Create a default term document matrix
'tdm = TermDocumentMatrix(corpus)
tdm
tdm[,1]
inspect(tdm[,1:4])

length(dimnames(tdm)$Terms)

freq=rowSums(as.matrix(tdm))
head(freq,10)
tail(freq,10)'
# It can be seen that, before any analysis is made of these data, 
# a series of transformations must be made




############################## Transform the corpus ###########################

#Transform the corpus
#getTransformations()
#stopwords("spanish")

#############################################################



##### To show the most repeated words:
'tdm = TermDocumentMatrix(corpus,
                       control=list(stopwords = myStopwords,
                                    removePunctuation = T, 
                                    removeNumbers = T,
                                    stripWhitespace = T,
                                    tolower = T))

freq=rowSums(as.matrix(tdm))
high.freq=tail(sort(freq),n=50)
hfp.df=as.data.frame(sort(high.freq))
hfp.df$names <- rownames(hfp.df) 
ggplot(hfp.df, aes(reorder(names,high.freq), high.freq)) +
  geom_bar(stat="identity") + coord_flip() + 
  xlab("Terms") + ylab("Frequency") +
  ggtitle("Term frequencies")

tail(sort(freq),n=100)'
##################################






# Words chosen as proper names to be deleted
### Discarded proposal
'
  myStopwords = c(stopwords("spanish"),"poirot", "franklin", "raquel", "betteredge",
                  "verinder", "linnet", "doyle", "blake", "cuff", "godfrey", "rosanna", "race",
                  "simon", "bruff", "bouc", "jacqueline", "ratchett", "holmes", "allerton")
  myStopwords = c(myStopwords,
  "ezra", "achmet", "clack", "nilo", "windleshaw", "tonga", "hindúes", "forrester", 
  "richetti", "mary", "estambul", "hildegarde", "andrés", "bourget", "cassetti", 
  "norwood", "gema", "frizinghall", "athelney", "aurora", "schmidt", "candy", 
  "egipto", "luisa", "jennings", "bartholomew", "jonathan", "spearman", 
  "dragomiroff", "agra", "andrenyi", "ridgeway", "watson", "juana", 
  "mademoiselle", "toby", "robson", "luker", "michel", "smith", 
  "hércules", "miss", "sherlock", "penélope", "ferguson", 
  "ablewhite", "thaddeus", "constantine", "bowers", "jones", "small", 
  "schuyler", "madame", "hardman", "camarote", "otterbourne", "debenham", 
  "arbuthnot", "bessner", "rosalía", "fanthorp", "armstrong", "bellefort", 
  "tim", "hubbard", "macqueen", "morstan", "mistress", "pennington", 
  "cornelia", "sholto")
  
  '




'high.freq=tail(sort(freq),n=50)
hfp.df=as.data.frame(sort(high.freq))
hfp.df$names <- rownames(hfp.df) 
ggplot(hfp.df, aes(reorder(names,high.freq), high.freq)) +
  geom_bar(stat="identity") + coord_flip() + 
  xlab("Terms") + ylab("Frequency") +
  ggtitle("Term frequencies")

tail(sort(freq),n=100)'






library(tidytext)
#install.packages("dplyr") 
library(tidyverse)
unnest_tokens(tibble(txt=txtAll),word, txt) %>%
  left_join(parts_of_speech) %>%
  filter(pos %in% c("Adjectives","Adverb")) %>%
  pull(word) %>%
  unique
# [1] "good"

#pos




library(tidytext)
#install.packages("dplyr") 
library(tidyverse)
unnest_tokens(tibble(txt=txtAll),word, txt) %>%
  left_join(parts_of_speech) %>%
  filter(pos %in% c("Adjectives","Adverb")) %>%
  pull(word) %>%
  unique
# [1] "good"

#pos
