
speciesList <- read.csv("data/SpeciesList.csv")

species_name = as.character(0)
species_tweet = as.data.frame(0)

for (i in 1:10){ #nrow(speciesList)) {
  species_name = as.character(speciesList$Genus_species[i])
  print(species_name)
  species_tweet = search_tweets(species_name)
  print(nrow(species_tweet))
  
  print(species_tweet$text)
#  post_tweet(status = paste("My first retweet from R for #untweetableSpecies ", species_tweet$status_url))  

  nrow(get_my_timeline())
#  get_timeline('Untweeted Australian Species', n = 100, max_id = NULL, home = FALSE,
#               parse = TRUE, check = TRUE, token = NULL, ...)
  
#  if
  
  for(t in species_tweet)
  {
    (tweetId  <- t$status_id)
    (tweetUrl <- t$status_url)
    (twwetText = t$text)
  }
  
}
