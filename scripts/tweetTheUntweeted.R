library(dplyr)
library(stringr)

specieslist = as.data.frame(0)
speciestweets = as.data.frame(0)
mytweets = as.data.frame(0)
staremoji <- emojis %>% filter(grepl("white medium star",description))
specieslist <- read.csv("data/SpeciesList.csv")

# find the tweets we've already done
mytweets <- get_my_timeline()

# trying to find the status ids of the tweets we've done before by looking at the url we put in the tweets
# doh! they've been shortened 
url_pattern <- "http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+"
for(i in 1:nrow(mytweets)) {
    url <- str_extract(as.character(mytweets$text[i]),url_pattern)
    print(url)
}

# loop through the scientific names in the file
# search twitter for it
# if we find it and we didn't post it, tweet it
for (i in 1:nrow(specieslist)) {
  speciesname = as.character(specieslist$Genus_species[i])
  print(paste("i=",i,"|",speciesname))
  speciestweets = search_tweets(speciesname)
  
  if(nrow(speciestweets) > 0) {
    for (j in 1:nrow(speciestweets)) {
      # check if this is one of our tweets
      thisscreenname = as.character(speciestweets$screen_name[j])
      thisstatusid = as.character(speciestweets$status_id[j])
      print(thisscreenname)
      if (thisscreenname != my_screen_name) {
        post_tweet(status = paste(staremoji$code," An #untweetableSpecies was tweeted! ", speciestweets$status_url[j]))
      } else {
        print("this was my tweet")
      }
    }
  }
}


  
