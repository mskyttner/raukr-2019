#' ---
#' title: "Harvesting CSVs from Google Drive"
#' author: ""
#' output: 
#'  html_document
#' ---

#' get all CSV data from Google Drive using `googledrive` R package

library(tidyverse)
library(googledrive)
library(here)

gd_download_files <- function(files = drive_ls("RaukR_2019")) {
  
  if (!dir.exists(here("data"))) 
    dir.create(here("data"))
  
  dl <- function(id, fn) drive_download(
    file = as_id(id), 
    path = file.path(here("data"), fn), 
    overwrite = TRUE
  )
  
  map2_dfr(files$id, files$name, dl) 
}

# download the CSV files locally
raukr_csvs <- gd_download_files()

# read all csv files into a tibble
df <- 
  map(raukr_csvs$local_path, read_csv) %>%
  bind_rows()

# find the top ten installed packages
topten <- 
  df %>% 
  count(Package) %>%
  arrange(desc(n)) %>%
  slice(1:10)

topten