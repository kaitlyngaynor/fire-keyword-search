library(tidyverse)

keywords <- read.csv("Media and literature keyword search (Oct 2020) - Record.csv")

head(keywords)

# filter to for rows of interest

# compare forest vs. non-forest in news and academic
forest_nonforest <- dplyr::filter(keywords, Index %in% c(43, 48, 49, 50)) 

ggplot(forest_nonforest, aes(y = Hits, x = Forest_or_not, fill = Forest_or_not)) +
    geom_bar(stat = "identity", position = "dodge") +
    facet_wrap(~Search_type, scales = "free") +
    theme_bw() +
    ylab("Number of Articles") +
    scale_fill_manual(values=c("#38501e", "#926433")) +
    scale_x_discrete(labels = c('Forest','Non-Forest')) +
    theme(legend.position = "none",
          axis.title.x = element_blank())
ggsave("keywordsearch.png", width = 5, height = 3)

########### old versions

# forest vs non forest
keywords_subset <- dplyr::filter(keywords, Index %in% c(1, 48, 6, 14,
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
