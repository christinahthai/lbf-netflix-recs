
library(dplyr)
library(purrr)
library(tidyr)

netflix = read.csv("netflix_titles.csv")


str(netflix)

netflix = netflix %>% mutate(title = as.character(title),
                   director = as.character(director),
                   cast = as.character(cast),
                   year = release_year,
                   country = as.character(country),
                   genre = as.character(listed_in),
                   description = as.character(description)
                   )


netflix = netflix  %>% 
  mutate(genre = map(genre, ~ strsplit(.x, ", ") %>% unlist()),
         cast = map(cast, ~strsplit(.x, ", ") %>% unlist())) %>% 
  unnest(genre)

