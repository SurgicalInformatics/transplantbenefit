library(readxl)
library(dplyr)

# Import beta coefficients for linear predictor
## Get data
betas = read_xlsx("Liver TBS calculator v 1 4 d.xlsx", range = "Betas_+_transforms!A1:L77") %>% 
	replace(is.na(.), 0) %>% # Replace missing cells with 0 so can be treated as vector
	write_csv("betas.csv")
betas %>% data.frame()


surv_cancer = read_xlsx("Liver TBS calculator v 1 4 d.xlsx", range = "Baseline survivor func!C5:C1830", 
												col_names = "m1_surv") %>% 
	bind_cols(read_xlsx("Liver TBS calculator v 1 4 d.xlsx", range = "Baseline survivor func!G5:G1830", 
											col_names = "m2_surv") ) %>% 
	write_csv("surv_cancer.csv")

surv_noncancer = read_xlsx("Liver TBS calculator v 1 4 d.xlsx", range = "Baseline survivor func!D5:D1830", 
												col_names = "m1_surv") %>% 
	bind_cols(read_xlsx("Liver TBS calculator v 1 4 d.xlsx", range = "Baseline survivor func!H5:H1830", 
											col_names = "m2_surv") ) %>% 
	write_csv("surv_noncancer.csv")



tmp = c(1,2,3,4,5,6,7,8)
tmp = matrix(rep(tmp, 5), ncol=5)
tmp[1,] = seq(1, 20, length.out=5)
tmp

tmp = matrix(tmp)
tmp
?replicate
?expand
library(tidyr)
expand(tmp)



# Implicit missings ---------------------------------------------------------
df <- tibble(
	year   = c(2010, 2010, 2010, 2010, 2012, 2012, 2012),
	qtr    = c(   1,    2,    3,    4,    1,    2,    3),
	return = rnorm(7)
)
df %>% expand(year, qtr)
df %>% expand(year = 2010:2012, qtr)
df %>% expand(year = full_seq(year, 1), qtr)
df %>% complete(year = full_seq(year, 1), qtr)
expand.grid(height = seq(60, 80, 5), weight = seq(100, 300, 50),
						sex = c("Male","Female"))



