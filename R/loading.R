library(tidyverse)
library(arrow)

load_dogs = function() {
  read_feather("dogs.feather")
}

load_zips = function() {
  nyczips = read_csv("data/nyczips.csv")
}