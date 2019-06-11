library(tidyverse)
library(here)
library(readr)

.libPaths()

ipt <- 
  installed.packages() %>%
  as_tibble() %>%
  select(Package, LibPath, Version, Priority, Built)

dir.create(here("data"))

ipt %>% write_csv(path = here("data", "installed-packages.csv"))

rm(ipt)
