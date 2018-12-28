# TBS calculation

# Define variables 
## Make rdisease_group
### Cascading ifelses I'm sure could be replaced with something better
rdisease_group = reactive({
	ifelse(input$previous_tx_tbs>0, 10,
				 ifelse(any(
				 	input$rdisease_primary_tbs == "1",
				 	input$rdisease_secondary_tbs == "1",
				 	input$rdisease_tertiary_tbs == "1"), 
				 	1, 
				 	ifelse(any(
				 		input$rdisease_primary_tbs == "2",
				 		input$rdisease_secondary_tbs == "2",
				 		input$rdisease_tertiary_tbs == "2"), 
				 		2, 
				 		ifelse(any(
				 			input$rdisease_primary_tbs == "3",
				 			input$rdisease_secondary_tbs == "3",
				 			input$rdisease_tertiary_tbs == "3"),
				 			3, 
				 			ifelse(any(
				 				input$rdisease_primary_tbs == "4",
				 				input$rdisease_secondary_tbs == "4",
				 				input$rdisease_tertiary_tbs == "4"),
				 				4,
				 				ifelse(any(
				 					input$rdisease_primary_tbs == "5",
				 					input$rdisease_secondary_tbs == "5",
				 					input$rdisease_tertiary_tbs == "5"),
				 					5, 
				 					ifelse(any(
				 						input$rdisease_primary_tbs == "6",
				 						input$rdisease_secondary_tbs == "6",
				 						input$rdisease_tertiary_tbs == "6"),
				 						6, 
				 						ifelse(any(
				 							input$rdisease_primary_tbs == "7",
				 							input$rdisease_secondary_tbs == "7",
				 							input$rdisease_tertiary_tbs == "7"),
				 							7, 
				 							ifelse(any(
				 								input$rdisease_primary_tbs == "8",
				 								input$rdisease_secondary_tbs == "8",
				 								input$rdisease_tertiary_tbs == "8"),
				 								8, 9)
				 						)
				 					)
				 				)
				 			)
				 		)
				 	)
				 )
	)
})

## Make rhcv
rhcv = reactive({
	ifelse(any(
		input$rdisease_primary_tbs == 2,
		input$rdisease_secondary_tbs == 2,
		input$rdisease_tertiary_tbs == 2), 
		1, 
		0)
})

## Make factor with levels>2 vectors
### This is coded badly in the .xlsx
### Alcohol==3 actually becomes 1. 
### Therefore drop the second element of the vector
rdisease_vec = reactive({
	out = group2dummy(10, rdisease_group())
	out = out[-2]
	return(out)
})
rregistration_vec = reactive({
	group2dummy(7, as.numeric(input$rregistration_tbs))
})

rtumour_number_vec = reactive({
	group2dummy(3, as.numeric(input$rtumour_number_tbs))
})

ddiabetes_vec = reactive({
	group2dummy(3, as.numeric(input$ddiabetes_tbs))
})

dcause_vec = reactive({
	group2dummy(4, as.numeric(input$dcause_tbs))
})

## Fix this funny Royal Free creatinine thing
rcreatinine = reactive({
	if(input$centre_tbs == "3"){
		out = (input$rcreatinine_tbs + 23.4) / 1.2
	}else{
		out = input$rcreatinine_tbs
	}
})

# Assemble x1
x1 = reactive({
	data.frame(raw_x1 = 
						 	as.numeric(
						 		c(input$rage_tbs,
						 			input$rage_tbs,
						 			input$rgender_tbs,
						 			rhcv(),
						 			rdisease_vec(),
						 			rcreatinine(),
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
						 			input$rage_tbs,
						 			input$rprevious_surgery_tbs,
						 			input$rencephalopathy_tbs,
						 			input$rascites_tbs,
						 			input$rwaiting_time_tbs+1,
						 			input$rdiabetes_tbs,
						 			rdisease_vec(),
						 			as.numeric(input$rmax_afp_tbs) + 1,
						 			input$rmax_tumour_size_tbs,
						 			rtumour_number_vec(),
						 			input$dage_tbs,
						 			dcause_vec(),
						 			input$dbmi_tbs,
						 			ddiabetes_vec(),
						 			input$dtype_tbs,
						 			rhcv(),
						 			rhcv(),
						 			rhcv(),
						 			input$dtype_tbs,
						 			input$dtype_tbs,
						 			rdisease_vec (),
						 			input$bloodgroup_compatible_tbs,
						 			input$splittable_tbs)))
})

# Assemble x2 (interactions)
x2 = reactive({
	data.frame(raw_x2 = 
						 	as.numeric(
						 		c(
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
						 			input$rsodium_tbs,
						 			input$rbilirubin_tbs,
						 			input$rbilirubin_tbs,
						 			input$rbilirubin_tbs,
						 			input$rbilirubin_tbs,
						 			input$rbilirubin_tbs,
						 			input$rbilirubin_tbs,
						 			input$rbilirubin_tbs,
						 			input$rbilirubin_tbs,
						 			rcreatinine(),
						 			1,
						 			1,
						 			1,
						 			1,
						 			1,
						 			input$rage_tbs,
						 			input$rage_tbs,
						 			input$rage_tbs,
						 			input$rage_tbs,
						 			input$rage_tbs,
						 			input$rage_tbs,
						 			input$rage_tbs,
						 			input$rage_tbs,
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
						 			ddiabetes_vec(),
						 			input$dage_tbs,
						 			input$rage_tbs,
						 			rcreatinine(),
						 			input$dtype_tbs,
						 			input$dtype_tbs,
						 			input$dtype_tbs,
						 			input$dtype_tbs,
						 			input$dtype_tbs,
						 			input$dtype_tbs,
						 			input$dtype_tbs,
						 			input$dtype_tbs,
						 			1,
						 			1)))
})

# Load table of coefficients and survival functions
betas = readr::read_csv("data/betas.csv")
surv_cancer = readr::read_csv("data/surv_cancer.csv")
surv_noncancer = readr::read_csv("data/surv_noncancer.csv")

# Make big prediction table
linear_prediction = reactive({
	dplyr::bind_cols(betas, x1(), x2()) %>% 
		mutate(transformed_x1 = raw_x1^power,
					 transformed_x1 = ifelse(ln_1 == 1, log(transformed_x1), transformed_x1),
					 transformed_x2 = raw_x2^power,
					 transformed_x2 = ifelse(ln_2 == 1, log(transformed_x2), transformed_x2)
		)
})

# Select now on cancer or not
linear_prediction_cancer = reactive({
	linear_prediction() %>% 
		dplyr::select(parameter, m1_beta = m1_cancer_beta, m2_beta = m2_cancer_beta, 
									m1_mean = m1_cancer_mean, m2_mean = m2_cancer_mean, 
									raw_x1, raw_x2, transformed_x1, transformed_x2) %>% 
		mutate(m1_x = (transformed_x1*transformed_x2) - m1_mean,
					 m2_x = (transformed_x1*transformed_x2) - m2_mean,
					 m1_beta_x = m1_beta * m1_x,
					 m2_beta_x = m2_beta * m2_x)
})

linear_prediction_noncancer = reactive({
	linear_prediction() %>% 
		dplyr::select(parameter, m1_beta = m1_noncancer_beta, m2_beta = m2_noncancer_beta, 
									m1_mean = m1_noncancer_mean, m2_mean = m2_noncancer_mean, 
									raw_x1, raw_x2, transformed_x1, transformed_x2) %>% 
		mutate(m1_x = (transformed_x1*transformed_x2) - m1_mean,
					 m2_x = (transformed_x1*transformed_x2) - m2_mean,
					 m1_beta_x = m1_beta * m1_x,
					 m2_beta_x = m2_beta * m2_x)
})

linear_prediction_active = reactive({
	if(any(input$rdisease_primary_tbs == 1, 
				 input$rdisease_secondary_tbs == 1,
				 input$rdisease_tertiary_tbs == 1)){
		out = linear_prediction_cancer()
	}else{
		out = linear_prediction_noncancer()
	}
	return(out)
})

surv_active = reactive({
	if(any(input$rdisease_primary_tbs == 1, 
				 input$rdisease_secondary_tbs == 1,
				 input$rdisease_tertiary_tbs == 1)){
		out = surv_cancer
	}else{
		out = surv_noncancer
	}
	return(out)
})

# Sum predictor
m1_linear_predictor = reactive({
	sum(linear_prediction_active()$m1_beta_x)
})
m2_linear_predictor = reactive({
	sum(linear_prediction_active()$m2_beta_x)
})


m1 = reactive({
	surv_active()$m1_surv^exp(m1_linear_predictor()) %>% sum()
})
m2 = reactive({
	surv_active()$m2_surv^exp(m2_linear_predictor()) %>% sum()
})
tbs = reactive({
	m2() - m1()
})

# Output
output$m1Box <- renderInfoBox({
	infoBox(
		"Need (M1)", h1(finalfit::round_tidy(m1(), 1)), 
		"Lower indicates greater need",
		icon = icon("bar-chart"),
		color = "orange", fill=TRUE
	)
})
output$m2Box <- renderInfoBox({
	infoBox(
		"Utility (M2)", h1(finalfit::round_tidy(m2(), 1)), 
		"Higher indicates greater utility",
		icon = icon("bar-chart"),
		color = "orange", fill=TRUE
	)
})
output$tbsBox <- renderInfoBox({
	infoBox(
		"TBS (M2-M1)", h1(finalfit::round_tidy(tbs(), 1)), 
		icon = icon("bar-chart"),
		"Higher indicates greater net-benefit",
		color = "orange", fill=TRUE
	)
})


output$x1 = DT::renderDataTable(
	DT::datatable(linear_prediction_active(),
								rownames=FALSE, extensions = "FixedColumns", 
								options = list(#dom = 't', 
									scrollX = TRUE, 
									paging=FALSE,
									fixedColumns = list(leftColumns = 1, rightColumns = 0),
									searching = FALSE
								))
)
