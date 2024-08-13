# LLM-vs.-Humans-Forecasting

This is the repository for replicating the results of "Humans vs. large language models: judgmnental forecasting in an era of advanced AI", by Mahdi Abolghasemi, Odkhishig Ganbold, Kristian Raotaru, to appear in International Journal of Forecasting. This study investigates the forecasting accuracy of human experts versus Large Language Models (LLMs) in the retail sector, particularly during standard and promotional sales periods. Utilizing a controlled experimental setup with 123 human forecasters and five LLMs, including ChatGPT-4, ChatGPT3.5, Bard, Bing, and Llama2, we evaluated forecasting precision through Absolute Percentage Error. Our analysis centered on the effect of the following factors on forecasters’ performance: the supporting statistical model (baseline and advanced), whether the product was on promotion, and the nature of external impact.  You can find the shiny app for experiment here: https://mahdiforecasting.shinyapps.io/exp1/. Please read the full paper for details.

## Instructions
The main analysis of mixed-effect models is done using STATA. The input data (experiment_dataset.dta) and code (data-analysis_code.do) are available in the reop. The detailed instructions are given in the readme.txt file. 

For generating some of the tables in Appendix C and E, you can use appendixCE_tables.R which will read the LLM-Results.csv files provided above. 


## References
Humans vs. large language models: Judgmental forecasting in an era of advanced AI, MAhdi Abolghasemi, Odkhishig Ganbold, Kristian Raotaru, 2024, International Journal of Forecasting (to appear). 
