##LLM tables-results

#load packages
library(dplyr)
library(ggplot2)


#read data
experiment_data <- read.csv("experiment_dataset.csv")
df <- readRDS("df.rds")


###### APPENDIX C Table Entries #####
df %>% 
  ungroup(series) %>%
  filter(type== "actual_sale") %>%
  filter(time < 25) %>%
  summarise(n(), mean(sale), median(sale), min(sale), max(sale), sd(sale))

# baseline and advanced forecast
df %>% 
  filter(type != "actual_sale") %>%
  filter(time < 25) %>%
  ungroup(series) %>%
  group_by(type) %>%
  summarise(n(), mean(sale), median(sale), min(sale), max(sale), sd(sale))

# yes and No promotion entries
df %>% 
  filter(type== "actual_sale") %>%
  filter(time < 25) %>%
  ungroup(series) %>%
  group_by(promo) %>%
  summarise(n(), mean(sale), median(sale), min(sale), max(sale), sd(sale))

# positive and negative external impact
df %>% 
  filter(type== "actual_sale") %>%
  filter(time < 25) %>%
  filter(External_Impact %in% c("Negative", "Positive")) %>%
  ungroup(series) %>%
  group_by(External_Impact) %>%
  summarise(n(), mean(sale), median(sale), min(sale), max(sale), sd(sale))



##### Appendix D #####

# Appendix D, entries to overall
experiment_data %>% 
  #filter(partid0 != "Human") %>%
  group_by(partid0) %>%
  mutate(ME=mean(abs_perc_error), MD=median(abs_perc_error)) %>%
  summarise(mean(MD), median(MD))


# Appendix D, entries to Baseline forecast and Advanced Forecast
experiment_data %>% 
  #filter(partid0 != "Human") %>%
  group_by(partid0,frcast_type_ab) %>%
  mutate(ME=mean(abs_perc_error), MD=median(abs_perc_error)) %>%
  summarise(mean(MD), median(MD)) %>%
  arrange(frcast_type_ab)


# Appendix D, entries to YEs Promotional Impact and No Promotional Impact
experiment_data %>% 
  #filter(partid0 != "Human") %>%
  group_by(partid0,promo_yn) %>%
  mutate(ME=mean(abs_perc_error), MD=median(abs_perc_error)) %>%
  summarise(mean(MD), median(MD)) %>%
  arrange(promo_yn)

# Appendix D, entries to Positive External Impact and Negative External Impact
experiment_data %>% 
  #filter(partid0 != "Human") %>%
  group_by(partid0,ext_impact_pn) %>%
  mutate(ME=mean(abs_perc_error), MD=median(abs_perc_error)) %>%
  summarise(mean(MD), median(MD)) %>%
  arrange(ext_impact_pn)


##### APPENDIX E Table Entries #####
LLM_Results <- experiment_data
## Appendix E , Overall Entries ##
# Appendix E overall, Mean adjustment and Median adjustment size columns
LLM_Results %>%
  group_by(partid0) %>%
  summarise(n(),round(mean(adjustment),1), round(median(adjustment), 1)) %>%
  arrange()


# Appendix E, Overall entries, mean MdAPE and median MdAPE  positive adjustment columns
LLM_Results %>%
  filter(adjustment > 0) %>%
  group_by(partid0) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange()

# Appendix E, Overall entries, mean MdAPE and median MdAPE  negative adjustment columns
LLM_Results %>%
  filter(adjustment < 0) %>%
  group_by(partid0) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange()

# Appendix E, Overall entries, mean and median MdAPE  no adjustment columns
LLM_Results %>%
  filter(adjustment==0) %>%
  group_by(partid0) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange()


## Appendix E, Advanced and Baseline Forecast entries ##

# Mean  Adjustment Size, Median Adjustment size columns
experiment_data %>%
  group_by(partid0,frcast_type_ab) %>%
  summarise(mean(adjustment), median(adjustment)) %>%
  arrange(frcast_type_ab)

# Mean MdAPE Positive Adjustment, Median MdAPE Positive Adjustment columns
LLM_Results %>%
  filter(adjustment > 0) %>%
  group_by(partid0,frcast_type_ab) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(frcast_type_ab)


# Mean MdAPE Negative Adjustment, Median MdAPE N3gative Adjustment columns
LLM_Results %>%
  filter(adjustment < 0) %>%
  group_by(partid0,frcast_type_ab) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(frcast_type_ab)

# Mean MdAPE No Adjustment, Median MdAPE No Adjustment columns
LLM_Results %>%
  filter(adjustment == 0) %>%
  group_by(partid0,frcast_type_ab) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(frcast_type_ab)


## Appendix E : Yes Promotion and No Promotion table Entries ##

# Mean and Median MdAPE No adjustment columns
LLM_Results %>%
  group_by(partid0,promo_yn) %>%
  summarise(mean(adjustment), median(adjustment)) %>%
  arrange(promo_yn)

#Mean MdAPE positive adjustment, Median MdAPE positive adjustment columns
LLM_Results %>%
  filter(adjustment >0) %>%
  group_by(partid0, promo_yn) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(promo_yn)

#Mean MdAPE negative adjustment, Median MdAPE negative adjustment columns
LLM_Results %>%
  filter(adjustment < 0) %>%
  group_by(partid0, promo_yn) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(promo_yn)

#Mean MdAPE no adjustment, Median MdAPE no adjustment columns
LLM_Results %>%
  filter(adjustment == 0) %>%
  group_by(partid0, promo_yn) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(promo_yn)


## Appendix E, Negative and Positive External Impact entries ##
# Mean Adjustment Size, Median Adjustment size columns
LLM_Results %>%
  group_by(partid0,ext_impact_pn) %>%
  summarise(mean(adjustment), median(adjustment)) %>%
  arrange(ext_impact_pn )


# Mean MDAPE Positive Adjustment, Median MdAPE positive Adjustment columns
LLM_Results %>%
  filter(adjustment > 0) %>%
  group_by(partid0,ext_impact_pn) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(ext_impact_pn )

# Mean MDAPE negative Adjustment, Median MdAPE Negative Adjustment columns
LLM_Results %>%
  filter(adjustment < 0) %>%
  group_by(partid0,ext_impact_pn) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(ext_impact_pn)

# Mean MdAPE No Adjustment, Median MdAPE No Adjustment columns
LLM_Results %>%
  filter(adjustment == 0) %>%
  group_by(partid0,ext_impact_pn) %>%
  mutate(MD=median(abs_perc_error)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(ext_impact_pn)
