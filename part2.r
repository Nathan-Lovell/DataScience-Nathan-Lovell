## ----echo=FALSE, message=FALSE, error=FALSE, warning=FALSE, results='hide'----
include <- function(library_name){
  if( !(library_name %in% installed.packages()) )
    install.packages(library_name) 
  library(library_name, character.only=TRUE)
}
include("tidyverse")
include("knitr")
include("jsonlite")
purl("https://raw.githubusercontent.com/Nathan-Lovell/DataScience-Nathan-Lovell/master/deliverable1.Rmd", output = "part1for2.r") # produces r source from rmd
source("part1for2.r") # executes the source


## ----echo=FALSE, message=FALSE, results='hide'---------------------------
Amazon_json <- read_csv("convertcsv.csv")
#Amazon_Ratings <- read_csv("https://raw.githubusercontent.com/NathanLovell/DataScience-Nathan-Lovell/master/5000_Rows.csv")
#Amazon_json <- fromJSON("5000_json.json", flatten=TRUE) <- formatting error and cannot run. Must convert to csv


## ------------------------------------------------------------------------
colnames(Amazon_json)


## ------------------------------------------------------------------------
json_reviews <- tibble(
reviewerer_id=Amazon_json$reviewerID, product_id=Amazon_json$asin, helpful_vote=Amazon_json$`helpful/0`, total_vote=Amazon_json$`helpful/1`, review_title=Amazon_json$summary, review_text=Amazon_json$reviewText, review_time=Amazon_json$unixReviewTime
)
colnames(json_reviews)


## ----echo=FALSE, message=FALSE, error=FALSE, warning=FALSE, results='hide'----
only_verified <- filter(Review, verified_purchase == "Y")
no_verified <- filter(Review, verified_purchase== "N")

## ------------------------------------------------------------------------
ggplot(only_verified, aes(x=star_rating)) + geom_bar(aes(y=(..count..)/sum(..count..))) + coord_cartesian(ylim=c(0, .60)) + labs(title="Verified Purchase Reviews", x="Number of Stars", y="% of Reviews")
ggplot(no_verified, aes(x=star_rating)) + geom_bar(aes(y=(..count..)/sum(..count..))) + coord_cartesian(ylim=c(0, .60)) + labs(title="Non-Verified Purchase Reviews", x="Number of Stars", y="% of Reviews")


## ------------------------------------------------------------------------
simple_model <- lm(Review, formula= as.numeric(star_rating) ~ as.numeric(verified_purchase))
summary(simple_model)

