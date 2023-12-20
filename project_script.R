library(tidyverse)
library(LinDA)

## input_data

bac_gr_funcs <- openxlsx::read.xlsx("./data/Bacterial group functions.xlsx")    #Bacterial group functions

fbh <- read.csv("./data/final_bacteria_health.csv")                             #final_bacteria_health
fb140 <- read.csv("./data/final_bacteria_ibs_140.csv")                          #final_bacteria_ibs_140

fbh_stats <- openxlsx::read.xlsx("./data/final_health_statistic.xlsx")          #final_health_statistic
fb140_stats <- openxlsx::read.xlsx("./data/final_ibs_140_statistic.xlsx")       #final_ibs_140_statistic

## processing 'bac_gr_funcs' dt

bac_gr_funcs <- bac_gr_funcs %>% 
  mutate(Inflammatory = coalesce(Inflammatory, 0),
         Oral = coalesce(Oral, 0),
         Gases = coalesce(Gases, 0),
         TaxonName = gsub(" ", "_", TaxonName),
         Bacteria_tax = paste(TaxonName, Rank, sep = "_"))

## make dts long

pivot_long_foo <- function(dt){
  dt %>% 
    pivot_longer(
      cols = X01D2Z36_F:possible.genus.03_G,
      names_to = "Bacteria_tax",
      values_to = "Value"
    )
}

fb140_long <- pivot_long_foo(fb140)
fbh_long <- pivot_long_foo(fbh)

## merge dts(fb40_long/fbh_long with corresponding stats dts)

fb140_mrg <- fb140_long %>% 
  inner_join(fb140_stats, by="patient_ID") %>% 
  mutate(source = "IBS")

fbh_mrg <- fbh_long %>% 
  inner_join(fbh_stats, by="patient_ID") %>% 
  mutate(source = "Healthy")

## set fb40/fbh dts together 

fb_long <- bind_rows(fbh_mrg, fb140_mrg)

## left join fb_long with bac_gr_funcs

fb_all <- fb_long %>% 
  inner_join(bac_gr_funcs, by="Bacteria_tax")

# NA_count_foo <- function(dt) {
#   dt %>% 
#     summarise(across(everything(), ~ sum(is.na(.x)))) %>% 
#     select(where(function(x) x != 0))
# }

## NA counting for every column & filtering NA records

NA_count_foo <- function(dt) {
  dt %>%
    mutate(n = n()) %>% 
    summarise(across(everything(), ~ sum(is.na(.x))),
              n = n()) %>% 
    select(n, where(function(x) x != 0)) %>% 
    mutate(across(everything()), round(. / n, 4)) %>% 
    select(-n) %>% 
    pivot_longer(
      cols = everything(),
      names_to = "Feature",
      values_to = "Value"
    ) %>% 
    arrange(desc(Value))
}

# NA_cols_foo <- function(dt) {
#   dt %>% 
#     select(patient_ID, where(~sum(is.na(.x)) > 0))
# }

## save temporary dataset
# data.table::fwrite(fb_all, "./output/all_long.csv")

fb_all_NA_cnt <- NA_count_foo(fb_all)

# fb_all_NA_dt <- NA_cols_foo(fb_all)

## dt with non-empty Bacteria_category column 
# 
# tmp <- fb_all %>% 
#   filter(!is.na(Bacteria_category_eng))

