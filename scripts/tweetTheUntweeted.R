specieslist = as.data.frame(0)
speciestweets = as.data.frame(0)
mytweets = as.data.frame(0)

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
        post_tweet(status = paste("Another #untweetableSpecies ", speciestweets$status_url[j]))
      } else {
        print("already posted that one")
      }
    }
  }
}

#  post_tweet(status = paste("My first retweet from R for #untweetableSpecies ", species_tweet$status_url))  
#  get_timeline('Untweeted Australian Species', n = 100, max_id = NULL, home = FALSE,
#               parse = TRUE, check = TRUE, token = NULL, ...)
  
  
#  for(t in species_tweet)
#  {
#    (tweetId  <- t$status_id)
#    (tweetUrl <- t$status_url)
#    (twwetText = t$text)
#  }
  
