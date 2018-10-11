#l - Load relevant libraries
library(jsonlite)
library(tidyverse)

#2 - store URLs in relevant objects
men2018 <- "https://games.crossfit.com/competitions/api/v1/competitions/open/2018/leaderboards?division=1&region=0&scaled=0&sort=0&occupation=0"
women2018 <- "https://games.crossfit.com/competitions/api/v1/competitions/open/2018/leaderboards?division=2&region=0&scaled=0&sort=0&occupation=0"
men2017 <- "https://games.crossfit.com/competitions/api/v1/competitions/open/2017/leaderboards?division=1&region=0&scaled=0&sort=0&occupation=0"
women2017 <- "https://games.crossfit.com/competitions/api/v1/competitions/open/2017/leaderboards?division=2&region=0&scaled=0&sort=0&occupation=0"

#3 - (optional) - Check JSON views
# remove commenting for the relevant check
#View(fromJSON(paste0(men2018, "&page=1"), flatten = TRUE))
#View(fromJSON(paste0(women2018, "&page=1"), flatten = TRUE))
#View(fromJSON(paste0(men2017, "&page=1"), flatten = TRUE))
#View(fromJSON(paste0(women2017, "&page=1"), flatten = TRUE))

#4 add the numerical code for checking 1RM clean from 2018 (check first 25 pages)
men2018pages <- list()
for(i in 1:5){
  m_2018 <- fromJSON(paste0(men2018, "&page=", i))
  men2018pages[[i+1]] <- m_2018[["leaderboardRows"]][["scores"]][[i]][["scoreDisplay"]][3]
}

