##LLM Appendix tables-results

#load packages
library(dplyr)
library(ggplot2)


## read data from experiment
#This is the data obtained from participants and most analysis are based on this data.
LLM_Results <- read.csv("LLM-Results.csv")

## read the raw
# This is used only for appendix C table.
df <- readRDS("df.rds")


##### APPENDIX C Table Entries #####
df %>% 
  ungroup(series) %>%
  filter(type== "actual_sale") %>%
  filter(time < 25) %>%
  summarise(n(), mean(sale), median(sale), min(sale), max(sale), sd(sale))

# positive and negative external impact
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
  ungroup(series) %>%
  group_by(External_Impact) %>%
  summarise(n(), mean(sale), median(sale), min(sale), max(sale), sd(sale))



##### APPENDIX D Table Entries #####


# Appendix D, entries to overall
LLM_Results %>% 
  group_by(partid0) %>%
  mutate(ME=mean(APE), MD=median(APE)) %>%
  summarise(mean(MD), median(MD))

# Appendix D, entries to Baseline forecast and Advanced Forecast
LLM_Results %>% 
  group_by(partid0,frcast_type_ab) %>%
  mutate(ME=mean(APE.1), MD=median(APE.1)) %>%
  summarise(mean(MD), median(MD)) %>%
  arrange(frcast_type_ab)

# Appendix D, entries to Yes Promotional Impact and No Promotional Impact
LLM_Results %>% 
  group_by(partid0,promo_yn) %>%
  mutate(ME=mean(APE.1), MD=median(APE.1)) %>%
  summarise(mean(MD), median(MD))  %>%
  arrange(promo_yn)

# Appendix D, entries to Positive External Impact and Negative External Impact
LLM_Results %>% 
  group_by(partid0,ext_impact_pn) %>%
  mutate(ME=mean(APE.1), MD=median(APE.1)) %>%
  summarise(mean(MD), median(MD)) %>%
  arrange(ext_impact_pn)


##### APPENDIX E Table Entries #####

## Appendix E , Overal Entries

# Appendix E overall, Mean adjustment and Median adjustment size columns
LLM_Results %>%
  group_by(partid0) %>%
  summarise(n(),round(mean(adjustment.1),1), round(median(adjustment.1), 1)) %>%
  arrange()


# Appendix E, Overall entries, mean MdAPE and median MdAPE  positive adjustment columns
LLM_Results %>%
  filter(adjustment.1 > 0) %>%
  group_by(partid0) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange()

# Appendix E, Overall entries, mean MdAPE and median MdAPE  negative adjustment columns
LLM_Results %>%
  filter(adjustment.1 < 0) %>%
  group_by(partid0) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange()

# Appendix E Mean MdAPE negative adjustment, Median MdAPE negative adjustment columns
LLM_Results %>%
  filter(adjustment.1<0) %>%
  group_by(partid0) %>%
  summarise(mean(APE.1), median(APE.1)) %>%
  arrange()

# Appendix E, Overall entries, mean and median MdAPE  no adjustment columns
LLM_Results %>%
  filter(adjustment.1==0) %>%
  group_by(partid0) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange()


### Appendix E, Advanced and Baseline Forecast entries

# Mean  Adjustment Size, Median Adjustment size columns
LLM_Results %>%
  group_by(partid0,frcast_type_ab) %>%
  summarise(mean(adjustment.1), median(adjustment.1)) %>%
  arrange(frcast_type_ab)

# Mean MdAPE Positive Adjustment, Median MdAPE Positive Adjustment columns
LLM_Results %>%
  filter(adjustment.1 > 0) %>%
  group_by(partid0,frcast_type_ab) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(frcast_type_ab)


# Mean MdAPE Negative Adjustment, Median MdAPE N3gative Adjustment columns
LLM_Results %>%
  filter(adjustment.1 < 0) %>%
  group_by(partid0,frcast_type_ab) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(frcast_type_ab)

# Mean MdAPE No Adjustment, Median MdAPE No Adjustment columns
LLM_Results %>%
  filter(adjustment.1 == 0) %>%
  group_by(partid0,frcast_type_ab) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(frcast_type_ab)



### Appendix E : Yes Promotion and No Promotion table Entries

# Mean and Median MdAPE No adjustment zolumns
LLM_Results %>%
  group_by(partid0,promo_yn) %>%
  summarise(mean(adjustment.1), median(adjustment.1)) %>%
  arrange(promo_yn)

#Mean MdAPE positive adjustment, Median MdAPE positive adjustment columns
LLM_Results %>%
  filter(adjustment.1>0) %>%
  group_by(partid0, promo_yn) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(promo_yn)

#Mean MdAPE negative adjustment, Median MdAPE negative adjustment columns
LLM_Results %>%
   filter(adjustment.1 < 0) %>%
  group_by(partid0, promo_yn) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(promo_yn)

#Mean MdAPE no adjustment, Median MdAPE no adjustment columns
LLM_Results %>%
   filter(adjustment.1 == 0) %>%
  group_by(partid0, promo_yn) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(promo_yn)




# Appendix E, Negative and Positive External Impact entries, 

# Mean Adjustment Size, Median Adjustment size columns
LLM_Results %>%
  group_by(partid0,ext_impact_pn) %>%
  summarise(mean(adjustment.1), median(adjustment.1)) %>%
  arrange(ext_impact_pn )


# Mean MDAPE Positive Adjustment, Median MdAPE positive Adjustment columns
LLM_Results %>%
  filter(adjustment.1 > 0) %>%
  group_by(partid0,ext_impact_pn) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(ext_impact_pn )

# Mean MDAPE negative Adjustment, Median MdAPE Negative Adjustment columns
LLM_Results %>%
  filter(adjustment.1 < 0) %>%
  group_by(partid0,ext_impact_pn) %>%
  mutate(MD=median(APE.1)) %>%
  summarise(n(),mean(MD), median(MD)) %>%
  arrange(ext_impact_pn)


