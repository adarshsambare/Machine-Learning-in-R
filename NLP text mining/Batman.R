library(rvest)
library(magrittr)
library(XML)

a<-10
Batman <- NULL
url1<- "https://www.imdb.com/title/tt0468569/reviews?ref_=tt_ov_rt"
for(i in 0:30){
  url<-read_html(as.character(paste(url1,i*a,sep="")))
  ping<-url %>%
    html_nodes("#tn15content p") %>%
    html_text() 
  Batman<-c(king,ping)
}
Batman
