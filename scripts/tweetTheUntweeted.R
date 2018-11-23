specieslist = as.data.frame(0)
speciestweets = as.data.frame(0)
mytweets = as.data.frame(0)
staremoji <- emojis %>% filter(grepl("white medium star",description))

specieslist <- read.csv("data/SpeciesList.csv")
mytweets <- get_my_timeline()

library(dplyr)

for (i in 1:10){ #nrow(speciesList)) {
  
  speciesname = as.character(specieslist$Genus_species[i])
  print(paste("i=",i,"|",speciesname))
  speciestweets = search_tweets(speciesname)
  
  if(nrow(speciestweets) > 0) {
    for (j in 1:nrow(speciestweets)) {
      # check if this is one of our tweets
      thisscreenname = as.character(speciestweets$screen_name[j])
      print(thisscreenname)
      if (thisscreenname != my_screen_name) {
        post_tweet(status = paste(staremoji$code," Another #untweetableSpecies! ", speciestweets$status_url[j]))
      } else {
        print("this was my tweet")
      }
    }
  }
}


  
