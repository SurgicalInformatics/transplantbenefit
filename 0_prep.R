# Prepare model lookup tables

library(readxl)
library(dplyr)

# Import beta coefficients for linear predictor
## Get data
betas = read_xlsx("Liver TBS calculator v 1 4 d.xlsx", range = "Betas_+_transforms!A1:L77") %>% 
	replace(is.na(.), 0) %>% # Replace missing cells with 0 so can be treated as vector
	write_csv("data/betas.csv")

## Inspect to check
betas %>% data.frame()

# Make survival model tables
## Cancer
surv_cancer = read_xlsx("data/Liver TBS calculator v 1 4 d.xlsx", range = "Baseline survivor func!C5:C1830", 
												col_names = "m1_surv") %>% 
	bind_cols(read_xlsx("data/Liver TBS calculator v 1 4 d.xlsx", range = "Baseline survivor func!G5:G1830", 
											col_names = "m2_surv") ) %>% 
	write_csv("data/surv_cancer.csv")

## Noncancer
surv_noncancer = read_xlsx("data/Liver TBS calculator v 1 4 d.xlsx", range = "Baseline survivor func!D5:D1830", 
												col_names = "m1_surv") %>% 
	bind_cols(read_xlsx("data/Liver TBS calculator v 1 4 d.xlsx", range = "Baseline survivor func!H5:H1830", 
											col_names = "m2_surv") ) %>% 
	write_csv("data/surv_noncancer.csv")
