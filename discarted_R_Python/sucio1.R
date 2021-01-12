


load('data/barthelme_start.RData')

baby_string0 = barth0 %>% 
  filter(id=='baby.txt')

baby_string = unlist(baby_string0$text) %>% 
  paste(collapse=' ') %>% 
  as.String

init_s_w = annotate(baby_string, list(Maxent_Sent_Token_Annotator(),
                                      Maxent_Word_Token_Annotator()))
pos_res = annotate(baby_string, Maxent_POS_Tag_Annotator(), init_s_w)
word_subset = subset(pos_res, type=='word')
tags = sapply(word_subset$features , '[[', "POS")

baby_pos = data_frame(word=baby_string[word_subset], pos=tags) %>% 
  filter(!str_detect(pos, pattern='[[:punct:]]'))







library(tidytext)
library(tidyverse)
unnest_tokens(tibble(txt="It's a good phone"),word, corpus) %>%
  left_join(parts_of_speech) %>%
  filter(pos %in% c("Adjective","Adverb")) %>%
  pull(word) %>%
  unique
# [1] "good"
