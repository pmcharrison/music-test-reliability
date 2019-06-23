library(tidyverse)

res <- list()

res$ca_bat <- bind_rows(
  read_csv("input/ca-bat/reliability_sem.csv", col_types = cols()) %>% 
    filter(!include_random_effects & wave == 1) %>% 
    mutate(test = "CA-BAT",
           statistic = "SEM",
           participants = "Laboratory",
           value = sem_mean) %>% 
    rename(num_items = length) %>%
    select(test, participants, statistic, num_items, value),
  
  read_csv("input/ca-bat/reliability_trt.csv", col_types = cols()) %>% 
    filter(!include_random_effects & !simulated) %>% 
    mutate(test = "CA-BAT",
           statistic = "Test-retest correlation",
           participants = "Laboratory",
           value = pearson_cor_value) %>% 
    rename(num_items = length) %>% 
    select(test, participants, statistic, num_items, value)
)

res$mdt <-
  read_csv("input/mdt/reliability-summary.csv", col_types = cols()) %>% 
  mutate(test = "MDT") %>% 
  filter(num_items > 0) %>% 
  select(test, participants, statistic, num_items, value)

res$mpt <- bind_rows(
  read_csv("input/mpt/sem-reliability.csv", col_types = cols()) %>% 
    transmute(test = "MPT",
              participants = "Laboratory",
              statistic = "SEM",
              num_items = length,
              value = sem_mean),
  
  read_csv("input/mpt/trt-reliability.csv", col_types = cols()) %>% 
    transmute(test = "MPT",
              participants = "Laboratory",
              statistic = "Test-retest correlation",
              num_items = length,
              value = pearson_cor_value)
)

res$piat <-
  read_csv("input/piat/reliability.csv", col_types = cols()) %>% 
  select(piat_length, r, sem_mean) %>% 
  gather(key = "statistic", value = "value", r, sem_mean) %>% 
  rename(num_items = piat_length) %>% 
  mutate(statistic = recode(statistic, 
                            r = "Test-retest correlation",
                            sem_mean = "SEM"),
         test = "PIAT",
         participants = "Laboratory") %>% 
  select(test, participants, statistic, num_items, value)

res <- bind_rows(res)
write_csv(res, "output/reliability.csv")
