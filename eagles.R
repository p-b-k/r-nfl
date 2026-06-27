########################################################################################################################
# Start working on Eagles info using R and nflverse
########################################################################################################################


library(tidyverse)
library(ggrepel)
library(nflreadr)
library(nflplotR)

options(nflreadr.verbose = FALSE)

pbp <- load_pbp(2020)
