library(tidyverse)
library(arrow)

load_dogs = function() {
  read_feather("dogs.feather")
}
