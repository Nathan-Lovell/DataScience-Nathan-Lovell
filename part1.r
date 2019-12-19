## ----echo=FALSE----------------------------------------------------------
library("tidyverse")
library("dplyr")
library("tidyr")
library("readr")
library("ggplot2")


## ------------------------------------------------------------------------
Amazon_Ratings <- read_csv("https://raw.githubusercontent.com/NathanLovell/DataScience-Nathan-Lovell/master/5000_Rows.csv")


## ----echo=FALSE----------------------------------------------------------
colnames(Amazon_Ratings)


## ----echo=FALSE----------------------------------------------------------
Review <- tibble(
review_id=Amazon_Ratings$review_id, customer_id=Amazon_Ratings$customer_id, 
product_id=Amazon_Ratings$product_id, star_rating=Amazon_Ratings$star_rating,
helpful_votes=Amazon_Ratings$helpful_votes, total_votes=Amazon_Ratings$total_votes, 
vine_verified=Amazon_Ratings$vine, verified_purchase=Amazon_Ratings$verified_purchase, 
review_title=Amazon_Ratings$review_headline, review_body=Amazon_Ratings$review_body, 
review_date=Amazon_Ratings$review_date)

colnames(Review)


## ----echo=FALSE----------------------------------------------------------
Product <- tibble(
product_id=Amazon_Ratings$product_id, parent_id=Amazon_Ratings$product_parent, 
description=Amazon_Ratings$product_title, category=Amazon_Ratings$product_category)

colnames(Product)


## ------------------------------------------------------------------------
Product <- distinct(Product, Product$product_id, .keep_all = TRUE)


## ------------------------------------------------------------------------
Review$star_rating <- as.factor(Review$star_rating)
Review$vine_verified <- as.factor(Review$vine_verified)
Review$verified_purchase <- as.factor(Review$verified_purchase)


## ------------------------------------------------------------------------
sum(Review$star_rating == "1")


## ------------------------------------------------------------------------
sum((Review$star_rating == "1") & (Review$verified_purchase == "N"))


## ------------------------------------------------------------------------
sum((Review$star_rating == "1") & (Review$verified_purchase == "Y"))


## ------------------------------------------------------------------------
sum(Review$star_rating == "5")


## ------------------------------------------------------------------------
sum((Review$star_rating == "5") & (Review$vine_verified == "N"))


## ------------------------------------------------------------------------
sum((Review$star_rating == "5") & (Review$vine_verified == "Y"))


## ------------------------------------------------------------------------
sum(Review$verified_purchase == "Y")
sum(Review$verified_purchase == "N")


## ------------------------------------------------------------------------
sum(Review$vine_verified == "Y")
sum(Review$vine_verified == "N")

