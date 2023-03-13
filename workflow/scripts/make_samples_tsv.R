library(tidyverse, suppressPackageStartupMessages())

read_csv("data/metadata/PRJNA477349_SraRunTable.csv", show_col_types = FALSE) %>%  
  rename_all(tolower) %>% 
  select_if(~sum((!is.na(.))) > 0) %>% # Remove empty columns
  mutate(
    geo_loc_name = str_replace_all(geo_loc_name, "Tanzania: ", ""),
    geo_loc_name = str_replace_all(geo_loc_name, "The Greater Serengeti Ecosystem", "Serengeti"),
    geo_loc_name = str_replace_all(geo_loc_name, " Ecosystem", ""),
    isolate = str_replace_all(isolate, "_\\d*$", ""),
    lat_lon = str_replace_all(lat_lon, " E$", ""),
    latitude = as.numeric(str_replace_all(lat_lon, " S.*", "")) * -1,
    longitude = as.numeric(str_replace_all(lat_lon, ".*S ", ""))) %>% 
  rename(ecosystem = geo_loc_name) %>%
  rename(description = host) %>% 
  mutate(bases = round(bases/1E6, digits = 0)) %>% 
  select(run, bioproject, ecosystem, isolate, latitude, longitude, mb_bases=bases, description) %>%
  # write_csv("data/metadata/PRJNA477349_tidy_metadata.csv")
  write_csv("config/samples.tsv")

