
clear
clear matrix
capture log close
// Step 1. Please define below the folder where the datasets are saved, for example "C:\Users\Downloads\datasets_codes_part1"
cd "C:\Users\Downloads\datasets_codes_part1" 
// Step 2. Please click on Execute(do) button (Ctrl+D) to run the data analysis code. Oonce the code is executed, the output is written to this data_analysis_log.txt file in the folder defined above.
log using data_analysis_part1_log.txt, text replace 

// Please note: Code chunks that begin with 'preserve' and end with 'restore' should be executed in a single step. Failing to do so will prevent the original dataset from being restored properly.

** ============================================================================================
** TITLE: HUMANS VS LARGE LANGUAGE MODELS: JUDGMENTAL FORECASTING IN AN ERA OF ADVANCED AI
** FILE: STATA DATA ANALYSIS CODE
** ANALYSIS FOR: TABLES 2-6, FIGURES 2-6, APPENDICES D, F, J, K
** ============================================================================================

** ============================= START OF MAIN DATA ANALYSES ====================================

** READ IN DATA FOR TABLES/FIGURES 2-6, APPENDICES D, F, J:
use "experiment_dataset.dta", clear

** === TABLES 2-6 and FIGURES 2-6 - Mixed-effects model results ===
// Table 2/Figure 2: Mixed-effects model results for H1 - APE by Forecaster Type: Human vs. LLMs
mixed abs_perc_error actual_sales i.forecaster_code || partid:, reml
graph box abs_perc_error, over(forecaster_code) ytitle("Absolute Percentage Error")
// Table 3/Figure 3: Mixed-effects model results for H2 - Interaction: forecasters and statistical forecast type
mixed abs_perc_error actual_sales i.frcast_type_code##i.forecaster_code || partid:, reml
margins i.frcast_type_code##i.forecaster_code
margins, over( i.frcast_type_code i.forecaster_code )
marginsplot, xdim( forecaster_code ) title ("APE: Predictive margins with 95% CIs")
// Table 4/Figure 4: Mixed-effects model results for H3 - Interaction: forecasters and promotion
mixed abs_perc_error actual_sales i.promo_yn_code##i.forecaster_code || partid:, reml
margins i.promo_yn_code##i.forecaster_code
margins, over( i.promo_yn_code i.forecaster_code )
marginsplot, xdim( forecaster_code ) title ("APE: Predictive margins with 95% CIs")
// Table 5/Figure 5: Mixed-effects model results for H4 - Interaction: Forecasters and external impact
mixed abs_perc_error actual_sales i.ext_impact_pn_code##i.forecaster_code || partid:, reml
margins i.ext_impact_pn_code##i.forecaster_code
margins, over( i.ext_impact_pn_code i.forecaster_code )
marginsplot, xdim( forecaster_code ) title ("APE: Predictive margins with 95% CIs")
// Table 6/Figure 6: Mixed-effects model results for H5 -  Interaction: forecasters and treatment conditions
mixed abs_perc_error actual_sales i.treatment_code##i.forecaster_code || partid:, reml
margins i.treatment_code##i.forecaster_code
margins, over( i.treatment_code i.forecaster_code )
marginsplot, xdim( forecaster_code ) title ("APE: Predictive margins with 95% CIs")

** === APPENDIX D: descriptive stats ===
// APPENDIX D: MdAPE - OVERALL (Note: executed below (preserve-restore) in a single step)
preserve
bysort partid: egen median_abs_perc_error = median(abs_perc_error)
codebook forecaster_code
collapse (first) forecaster_code (median) median_abs_perc_error, by(partid)
bysort forecaster_code: egen median_of_median_abs_perc_error = median(median_abs_perc_error)
label define forecaster_code_lbl 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3.5" 5 "ChatGPT4" 6 "Llama2"
label values forecaster_code forecaster_code_lbl
univar median_abs_perc_error, by(forecaster_code)
restore
// APPENDIX D: MdAPE - BASELINE FORECAST (Note: executed below (preserve-restore) in a single step)
preserve
keep if frcast_type_ab == "baseline"
bysort partid: egen median_abs_perc_error = median(abs_perc_error)
codebook forecaster_code
collapse (first) forecaster_code (median) median_abs_perc_error, by(partid)
bysort forecaster_code: egen median_of_median_abs_perc_error = median(median_abs_perc_error)
label define forecaster_code_lbl 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3.5" 5 "ChatGPT4" 6 "Llama2"
label values forecaster_code forecaster_code_lbl
univar median_abs_perc_error, by(forecaster_code)
restore
// APPENDIX D: MdAPE - ADVANCED FORECAST (Note: executed below (preserve-restore) in a single step)
preserve
keep if frcast_type_ab == "advanced"
bysort partid: egen median_abs_perc_error = median(abs_perc_error)
codebook forecaster_code
collapse (first) forecaster_code (median) median_abs_perc_error, by(partid)
bysort forecaster_code: egen median_of_median_abs_perc_error = median(median_abs_perc_error)
label define forecaster_code_lbl 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3.5" 5 "ChatGPT4" 6 "Llama2"
label values forecaster_code forecaster_code_lbl
univar median_abs_perc_error, by(forecaster_code)
restore
// APPENDIX D: MdAPE - YES PROMO (Note: executed below (preserve-restore) in a single step)
preserve
keep if promo_yn == "yes promo"
bysort partid: egen median_abs_perc_error = median(abs_perc_error)
codebook forecaster_code
collapse (first) forecaster_code (median) median_abs_perc_error, by(partid)
bysort forecaster_code: egen median_of_median_abs_perc_error = median(median_abs_perc_error)
label define forecaster_code_lbl 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3.5" 5 "ChatGPT4" 6 "Llama2"
label values forecaster_code forecaster_code_lbl
univar median_abs_perc_error, by(forecaster_code)
restore
// APPENDIX D: MdAPE - NO PROMO (Note: executed below (preserve-restore) in a single step)
preserve
keep if promo_yn == "no promo"
bysort partid: egen median_abs_perc_error = median(abs_perc_error)
codebook forecaster_code
collapse (first) forecaster_code (median) median_abs_perc_error, by(partid)
bysort forecaster_code: egen median_of_median_abs_perc_error = median(median_abs_perc_error)
label define forecaster_code_lbl 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3.5" 5 "ChatGPT4" 6 "Llama2"
label values forecaster_code forecaster_code_lbl
univar median_abs_perc_error, by(forecaster_code)
restore
// APPENDIX D: MdAPE - POSITIVE EXTERNAL IMPACT (Note: executed below (preserve-restore) in a single step)
preserve
keep if ext_impact_pn == "positive"
bysort partid: egen median_abs_perc_error = median(abs_perc_error)
codebook forecaster_code
collapse (first) forecaster_code (median) median_abs_perc_error, by(partid)
bysort forecaster_code: egen median_of_median_abs_perc_error = median(median_abs_perc_error)
label define forecaster_code_lbl 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3.5" 5 "ChatGPT4" 6 "Llama2"
label values forecaster_code forecaster_code_lbl
univar median_abs_perc_error, by(forecaster_code)
restore
// APPENDIX D: MdAPE - NEGATIVE EXTERNAL IMPACT (Note: executed below (preserve-restore) in a single step)
preserve
keep if ext_impact_pn == "negative"
bysort partid: egen median_abs_perc_error = median(abs_perc_error)
codebook forecaster_code
collapse (first) forecaster_code (median) median_abs_perc_error, by(partid)
bysort forecaster_code: egen median_of_median_abs_perc_error = median(median_abs_perc_error)
label define forecaster_code_lbl 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3.5" 5 "ChatGPT4" 6 "Llama2"
label values forecaster_code forecaster_code_lbl
univar median_abs_perc_error, by(forecaster_code)
restore

** === APPENDIX F: Forecast accuracy of Expert's in terms of APE (n=1, based on one expert data) ===
// APPENDIX F: Expert APE - overall (Note: executed below (preserve-restore) in a single step)
preserve
collapse (first) expert_ape, by(period_id)
univar expert_ape
restore
// APPENDIX F: Expert APE - baseline (Note: executed below (preserve-restore) in a single step)
preserve
keep if frcast_type_ab == "baseline"
collapse (first) expert_ape, by(period_id)
univar expert_ape
restore
// APPENDIX F: Expert APE - advanced (Note: executed below (preserve-restore) in a single step)
preserve
keep if frcast_type_ab == "advanced"
collapse (first) expert_ape, by(period_id)
univar expert_ape
restore
// APPENDIX F: Expert APE - Yes promotion (Note: executed below (preserve-restore) in a single step)
preserve
keep if promo_yn == "yes promo"
collapse (first) expert_ape, by(period_id)
univar expert_ape
restore
// APPENDIX F: Expert APE - No promotion (Note: executed below (preserve-restore) in a single step)
preserve
keep if promo_yn == "no promo"
collapse (first) expert_ape, by(period_id)
univar expert_ape
restore
// APPENDIX F: Expert APE - Positive external impact (Note: executed below (preserve-restore) in a single step)
preserve
keep if ext_impact_pn == "positive"
collapse (first) expert_ape, by(period_id)
univar expert_ape
restore
// APPENDIX F: Expert APE - Negative external impact (Note: executed below (preserve-restore) in a single step)
preserve
keep if ext_impact_pn == "negative"
collapse (first) expert_ape, by(period_id)
univar expert_ape
restore

** === APPENDIX J: Mixed-effects model for human forecasters and regression model for each LLM by hypothesiss ===
// APPENDIX J: H2a - APE baseline to advanced change significance test by forecaster: 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3" 5 "ChatGPT4" 6 "Llama2"
mixed abs_perc_error actual_sales i.frcast_type_code if forecaster == "Human"|| partid:
regress abs_perc_error actual_sales i.frcast_type_code if forecaster == "Bard"
regress abs_perc_error actual_sales i.frcast_type_code if forecaster == "Bing"
regress abs_perc_error actual_sales i.frcast_type_code if forecaster == "ChatGPT3.5"
regress abs_perc_error actual_sales i.frcast_type_code if forecaster == "ChatGPT4"
regress abs_perc_error actual_sales i.frcast_type_code if forecaster == "Llama2"
// APPENDIX J: H3a - APE NON-PROMO to PROMO change significance test by forecaster: 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3" 5 "ChatGPT4" 6 "Llama2"
mixed abs_perc_error actual_sales i.promo_yn_code if forecaster == "Human"|| partid:, reml
regress abs_perc_error actual_sales i.promo_yn_code if forecaster == "Bard"
regress abs_perc_error actual_sales i.promo_yn_code if forecaster == "Bing"
regress abs_perc_error actual_sales i.promo_yn_code if forecaster == "ChatGPT3.5"
regress abs_perc_error actual_sales i.promo_yn_code if forecaster == "ChatGPT4"
regress abs_perc_error actual_sales i.promo_yn_code if forecaster == "Llama2"
// APPENDIX J: H4a - APE NEGATIVE to POSITIVE EXT.IMPACT change significance test by forecaster: 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3" 5 "ChatGPT4" 6 "Llama2"
mixed abs_perc_error actual_sales i.ext_impact_pn_code if forecaster == "Human"|| partid:, reml
regress abs_perc_error actual_sales i.ext_impact_pn_code if forecaster == "Bard"
regress abs_perc_error actual_sales i.ext_impact_pn_code if forecaster == "Bing"
regress abs_perc_error actual_sales i.ext_impact_pn_code if forecaster == "ChatGPT3.5"
regress abs_perc_error actual_sales i.ext_impact_pn_code if forecaster == "ChatGPT4"
regress abs_perc_error actual_sales i.ext_impact_pn_code if forecaster == "Llama2"
// APPENDIX J: H5a - APE TREATMENT CONDITIONS change significance test by forecaster: 1 "Human" 2 "Bard" 3 "Bing" 4 "ChatGPT3" 5 "ChatGPT4" 6 "Llama2"
mixed abs_perc_error actual_sales i.treatment_code if forecaster == "Human"|| partid:, reml
regress abs_perc_error actual_sales i.treatment_code if forecaster == "Bard"
regress abs_perc_error actual_sales i.treatment_code if forecaster == "Bing"
regress abs_perc_error actual_sales i.treatment_code if forecaster == "ChatGPT3.5"
regress abs_perc_error actual_sales i.treatment_code if forecaster == "ChatGPT4"
regress abs_perc_error actual_sales i.treatment_code if forecaster == "Llama2"


** === APPENDIX K: Mean, Median, and Standard Deviation of Responses to the Post-Experimental Questionnaire
** READ IN DATA FOR APPENDIX K:
use "post-experimental-questionnaire_dataset.dta", clear

// Q1-The importance of the following information in supporting your judgement when presented with Baseline statistical forecast (1 - Not important, 7 - Very important):
// Forthcoming promotion type
univar Importance_PromoType_Base
// Forthcoming external impact
univar Importance_EnvImpact_Base
// The uplift size of previous promotions in general 
univar Importance_PrevPromoUplift_Base
// The uplift size of previous similar promotions
 univar Importance_PrevSimPromoUplift_Ba 
// Time series (sales) history
univar Importance_SalesHist_Base 
// Baseline statistical forecast
univar Importance_BaseStatForecast 
// Frequency of promotions
univar Importance_PromoFreq_Base 

//Q2- The importance of the following information in supporting your judgement when presented with Advanced statistical forecast (1 – Not important, 7 – Very important):
// Forthcoming promotion type
univar Importance_PromoType_Adv 
// Forthcoming environmental impact
univar Importance_EnvImpact_Adv 
// The uplift size of previous promotions in general
univar Importance_PrevPromoUplift_Adv 
// The uplift size of previous similar promotions
univar Importance_PrevSimPromoUplift_Ad 
// Time series (sales) history
univar Importance_SalesHist_Adv 
// Advanced statistical forecast
univar Importance_AdvStatForecast 
// Frequency of promotions
univar Importance_PromoFreq_Adv 

// Q3- To what extent do you agree with the following statements (1 - Strongly disagree, 7 - Strongly agree):
// The earlier promotions had a greater impact on your judgment about the forecast in period 25
univar Impact_EarlyPromos 
// The later promotions had a greater impact on your judgment about the forecast in period 25
univar Impact_LatePromos 
// All the promotions had an approximately the same impact on your judgment about the forecast in period 25
univar Impact_AllPromos 
// In my forecasts, I considered only those periods of the provided sales time series that reflected similar conditions to the forecast period (for example, upward or downward trend)
univar Forecast_ConsiderSimilarPeriods 
// In my forecasts, I considered all periods of the provided sales time series regardless of their similarity to the conditions of the forecast period
univar Forecast_ConsiderAllPeriods 
//In anticipation of the objective feedback on your performance, how would you assess the accuracy of your judgemental forecasts made during the experiment? (1 - Very low, 7 - Very high)
univar SelfAssess_Accuracy

//================================ END OF DATA ANALYSES==============================================

log close