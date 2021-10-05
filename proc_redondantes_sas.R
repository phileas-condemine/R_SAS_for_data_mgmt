# prep dans prep_list_proc_sas.R
load("codes_SAS_I_et_T.RData")
library(text2vec)
library(dplyr)
library(stringi)
library(wordcloud)
codes_SAS=tolower(codes_SAS)
list_procs=stri_extract_all(regex = "(proc )([a-z]+)( )",str = codes_SAS)
proc_frequencies=data.frame(table(list_procs))
proc_frequencies%>%arrange(Freq)
par(bg="black")
wordcloud(words = proc_frequencies$list_procs,random.color = F,
          freq = sqrt(proc_frequencies$Freq),
          col=rainbow(n = 10,s = .8,v = .8,start = 0,end = 1,alpha = 1) , 
          rot.per=0.3
          )



token <- codes_SAS %>%word_tokenizer
NLP.train <- text2vec::itoken(token,ids = 1:length(token), progressbar = FALSE)
NLP.dictionary <- create_vocabulary(NLP.train, ngram = c(ngram_min=2L,ngram_max=2L))

twograms_more_n=NLP.dictionary%>%filter(term_count>50)%>%arrange(-term_count)%>%select(-doc_count)
twograms_more_n
#Pas vraiment intéressant...