library(tidyverse)

keywords <- read.csv("Media and literature keyword search (Oct 2020) - Record.csv")

head(keywords)

# filter to fewer categories based on index

# forest vs non forest
keywords_subset <- dplyr::filter(keywords, Index %in% c(1, 13, 6, 14,
                                                 29, 41, 34, 42))

ggplot(keywords_subset, aes(y = Hits, x = Management_or_fire, fill = Forest_or_not)) +
    geom_bar(stat = "identity", position = "dodge") +
    facet_wrap(~Search_type, scales = "free")

# split by habitat
keywords_subset2 <- dplyr::filter(keywords, Index <= 14 | Index >= 29) %>% 
    dplyr::filter(!is.na(Habitat))

ggplot(keywords_subset2, aes(y = Hits, x = Management_or_fire, fill = Habitat)) +
    geom_bar(stat = "identity", position = "dodge") +
    facet_wrap(~Search_type, scales = "free")
