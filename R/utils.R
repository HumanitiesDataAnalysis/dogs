only_clean_names = . %>% filter(AnimalName != BreedName %>% str_to_upper()) %>%
    filter(AnimalName %>% str_detect("-POO", negate = TRUE)) %>%
    filter(AnimalName %>% str_detect("UNKNOWN|NAME NOT PROVIDED", negate = TRUE))

exclude_duplicate_licenses = function(frame) {
  frame %>% 
    ungroup() %>%
    distinct(
      AnimalName, BreedName, LicenseIssuedDate, LicenseExpiredDate,
      .keep_all = TRUE
    )
}
exclude_duplicate_dogs = function(frame) {
  frame %>% 
    ungroup %>%
    distinct(
      AnimalName, BreedName, ZipCode,
      .keep_all = TRUE
    )
}

library(HumanitiesDataAnalysis)

if (FALSE) {
  dunning = doggos %>% only_clean_names %>% only_unique_dogs %>% group_by(BreedName) %>% summarize_llr(AnimalName)
  probs = doggos  %>% only_unique_dogs %>% only_clean_names %>% group_by(BreedName) %>% summarize_pmi(AnimalName)
  probs %>% inner_join(dunning) %>%
    group_by(BreedName) %>% filter(sum(.count) > 100) %>%
    filter(.count > 10) %>%
    filter(.dunning_significance) %>% arrange(-.dunning_llr) %>% head(10)
}