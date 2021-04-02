only_clean_names = function(frame) {
  return(frame %>% filter(AnimalName != BreedName %>% str_to_upper()) %>%
    filter(AnimalName %>% str_detect("-POO", negate = TRUE)))
}
