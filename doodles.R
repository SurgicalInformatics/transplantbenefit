library(readxl)
library(tidyverse)

# Import beta coefficients for linear predictor
## Get data
betas = read_xlsx("Liver TBS calculator v 1 4 d.xlsx", range = "Betas_+_transforms!A1:L77") %>% 
	replace(is.na(.), 0) %>% # Replace missing cells with 0 so can be treated as vector
	write_csv("betas.csv")
betas


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







# For debugging, two columns, evaluation and formula
eval_explain <- function(term){
	out1 = term
	out2 =  deparse(substitute(term))
	dplyr::data_frame(out1, out2)
}
# Check
eval_explain(betas$m1_cancer_beta +1)
	
?tbl

# Check	
betas %>% 
	data.frame()
		
# Get means
means = read_xlsx("Liver TBS calculator v 1 4 d.xlsx", range = "Mean values2!A1:E77") %>% 
	replace(is.na(.), 0) # Replace missing cells with 0 so can be treated as vector

betas %>% 
	full_join(means) %>% 
	data.frame()

means %>% 
	data.frame()

log(4, base=exp())
log(2, base=exp(1))

log(2, base=1)
exp(1)

# Function to convert a factor coding to dummy variable
# e.g. group == 2 of possible 4 is 100
group2dummy <- function(length=3, group=1){
	if(group>length) stop("Group must be an integer less than or equal")
	out = rep(0, length-1)
	out[group-1] = 1
	return(out)
}
group2dummy(4, 2)


# Conditional logic around disease
# Previous 10
# HCC 1
# 
# hcc HCC 1
# alchohol Alcohol 3
# nafld NAFLD 8
# hbc Hep B 4
# hcv Hep C 2
# psc PSC 5
# pbc PBC 6
# aid Autoimmune/cryptogenic 7
# met Alpha-1 / Wilson's / Metabolic 8
# other Other 9




# Make rhcv
if(any(
	rdisease_primary_tbs == 2,
	rdisease_secondary_tbs == 2,
	rdisease_tertiary_tbs == 2)){
	rhcv = 1
}else{rhcv = 0}

# Make factor with levels>2 vectors
rdisease_group = group2dummy(10, input$rdisease_group_tbs)
rregistration = group2dummy(7, input$rdisease_group_tbs)
# Assemble x1
c(input$rage_tbs,
	input$rage_tbs,
	input$rgender_tbs,
	rhcv(),
	rdisease_group(),
	rcreatinine_tbs,
	rbilirubin_tbs,
	rinr_tbs,
	rsodium_tbs,
	rpotassium_tbs,
	ralbumin_tbs,
	rrenal_tbs,
	rinpatient_tbs,
	rregistration_tbs,
	rbilirubin_tbs,
	rdisease_group_tbs,
	rcreatinine_tbs,
	rprevious_surgery_tbs,
	rencephalopathy_tbs,
	rascites_tbs,
	rwaiting_time_tbs,
	rdisease_group_tbs,
	rmax_afp_tbs,
	rmax_tumour_size_tbs,
	rtumour_number_tbs,
	dage_tbs,
	dcause_tbs,
	dbmi_tbs,
	ddiabetes_tbs,
	dtype_tbs,
	rhcv_tbs,
	rhcv_tbs,
	dtype_tbs,
	dtype_tbs,
	rdisease_group_tbs,
	blood_group_compatible_tbs,
	splittable_tbs)


power
# Assemble linear predictors vector 2 (ineteraction terms)

1,
1,
1,
1,
1,
1,
1,
1,
1,
1,
1,
1,
1,
1,
rsodium_tbs,
rbilirubin_tds,
rcreatinine_tds,
1,
1,
1,
1,
1,
1,
rage,
1,
1,
1,
1,

1,
1,
1,
1,
1,
ddiabetes_tbs,
dage_tbs,
rage_tbs,
rcreatinine_tbs,
dtype_tbs
1,
1







tmp = quos(input$rage_tbs,
			input$rage_tbs,
			input$rgender_tbs,
			rhcv(),
			rdisease_vec (),
			input$rcreatinine_tbs,
			input$rbilirubin_tbs,
			input$rinr_tbs,
			input$rsodium_tbs,
			input$rpotassium_tbs,
			input$ralbumin_tbs,
			input$rrenal_tbs,
			input$rinpatient_tbs,
			rregistration_vec(),
			input$rbilirubin_tbs,
			rdisease_vec(),
			input$rcreatinine_tbs,
			input$rprevious_surgery_tbs,
			input$rencephalopathy_tbs,
			input$rascites_tbs,
			input$rwaiting_time_tbs,
			input$rdisease_group_tbs,
			input$rmax_afp_tbs,
			input$rmax_tumour_size_tbs,
			input$rtumour_number_tbs,
			input$dage_tbs,
			input$dcause_tbs,
			input$dbmi_tbs,
			input$ddiabetes_tbs,
			input$dtype_tbs,
			input$rhcv_tbs,
			input$rhcv_tbs,
			input$dtype_tbs,
			input$dtype_tbs,
			rdisease_vec (),
			input$blood_group_compatible_tbs,
			input$splittable_tbs)
purrr::map(tmp, rlang::quo_name) %>%
	paste()

paste(!!!tmp)
eval(tmp)
)
tmp
??rlang

library(finalfit)
ff_interaction
	
)

a = 1
b = 2
c = 3

list(a,b,c)
a = c(1,2,3)
a[-1]
