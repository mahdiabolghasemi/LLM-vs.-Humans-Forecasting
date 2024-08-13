Reproducibility Package for paper "HUMANS VS LARGE LANGUAGE MODELS: JUDGMENTAL FORECASTING IN AN ERA OF ADVANCED AI"

Contents: TABLES 2-6, FIGURES 2-6, APPENDICES D, F, J, K (see datasets_codes_part1.zip) for the paper
NOTE: The results for Appendix C and E tables are generated using the appendixCE_tables.R file accompanied. 

Reproducibility Package Assembly Date: 12 August 2024

Author(s) of the Reproducibility Package and Contact Information: Odkhishig Ganbold (odkhishig.ganbold@unimelb.edu.au), Mahdi Abolghasemi (mahdi.abolghasemi@qut.edu.au)


The Structure of the Repository Provided:
1. data-analysis_code.do - STATA code for producing TABLES 2-6, FIGURES 2-6, APPENDICES D, F, J, K
2. experiment_dataset.dta - STATA data file for data-analysis_code.do input, used for producing TABLES 2-6, FIGURES 2-6, APPENDICES D, F, J
3. post-experimental-questionnaire_dataset.dta - STATA data file for data-analysis_code.do input, used for producing APPENDIX K
4. data_analysis_part1_log.txt - STATA code output file containing results for TABLES 2-6, APPENDICES D, F, J, K


The Computing Environment, Language(s), Licence(s), and Package(s) Necessary to Run the Reproducibility Check:
- Computing Environment: Operating System: Windows 11 Pro OS, Version 23H2; Hardware: 12th Gen Intel(R) Core(TM) i7-12700H CPU @ 2.30GHz, 32GB RAM
- Primary Language: Stata is the primary language used for the analysis.
- Stata License: Stata/SE 18.0 (licensed version)


Data Used and Its Format, Access to the Data, Origin, Pre-processing:
- Study data were collected through laboratory experiments (human forecasters' data) and web prompts (LLM forecasters' data).
- The datasets underwent pre-processing, including outlier removal and data cleaning, to prepare them for analysis.
- The pre-processed datasets are saved in STATA .dta format.
- Access to the data is provided via https://urldefense.com/v3/__https://github.com/mahdiabolghasemi/LLM-vs.-Humans-Forecasting__;!!NVzLfOphnbDXSw!FWhuAInYW0Bl_4QHXga9erPj_FTD5LVqYYMp6dxLz01_-k-Cy3slW8AwpKdgCj57IqMCIMk7GLYF6MoABh1BxRkI7k4$ , with details on the origin of the datasets documented within the repository.


Code to Run for Producing Specific Tables and Figures:
- A data-analysis_code.do file has been provided, which contains all the necessary code to produce the specific tables and figures presented in the paper.
- The data-analysis_code.do file includes clear instructions and annotations, detailing the sequence of commands required to replicate each table and figure.
- Users should execute the data-analysis_code.do file in STATA to generate the results as presented.


Type of Computer Used for Running the Experiment and Expected Runtime:
- The data analysis was conducted on a laptop equipped with 2th Gen Intel(R) Core(TM) i7-12700H CPU and 32GB of RAM.
- The operating system was Windows 11 Pro OS.
- Expected runtime for the full analysis, including data processing and the generation of all tables and figures, is approximately less than one minute on this setup. Variations in runtime may occur depending on the hardware specifications and system load.


Special Setup Required to Run the Reproducibility Check:
- The analysis primarily runs on standard computational resources and does not require special hardware such as GPUs.
- Parallel computing is not required; however, the code can be modified to take advantage of multi-core processors for faster execution.
- Ensure that the following software dependencies are installed: STATA/SE 18.0
- Certain analyses or simulations may require an extended memory setup due to large dataset sizes. Ensure that your system has adequate RAM (e.g., 32GB) to handle such tasks without running into memory issues.


Availability of Sharable Datasets:
- All relevant datasets used in the analysis are directly included in the replication kit.
- Each dataset is provided in STATA .dta format, and corresponding documentation is included to explain the dataset contents and structure.
- No external datasets or repositories are required for replication; everything necessary is contained within the provided kit.

