# TBS calculation

# Define variables 
rcreatinine = reactive(make_rcreatinine(input$centre_tbs, input$rcreatinine_tbs))
rcancer = reactive({
	is_cancer(input$rdisease_primary_tbs, 
						input$rdisease_secondary_tbs,
						input$rdisease_tertiary_tbs)
})

# Load table of coefficients and survival functions
betas = readr::read_csv("data/betas.csv")
surv_cancer = readr::read_csv("data/surv_cancer.csv")
surv_noncancer = readr::read_csv("data/surv_noncancer.csv")

linear_prediction = reactive({
	rdisease_vec = make_rdisease_vec(input$rdisease_primary_tbs, 
																	 input$rdisease_secondary_tbs,
																	 input$rdisease_tertiary_tbs,
																	 input$previous_tx_tbs)
	rhcv = is_rhcv(input$rdisease_primary_tbs,
								 input$rdisease_secondary_tbs,
								 input$rdisease_tertiary_tbs)
	rregistration_vec = group2dummy(as.numeric(input$rregistration_tbs), 7)
	rtumour_number_vec = group2dummy(as.numeric(input$rtumour_number_tbs), 3)
	dcause_vec = group2dummy(as.numeric(input$dcause_tbs), 4)
	ddiabetes_vec = group2dummy(as.numeric(input$ddiabetes_tbs), 3)
	
	x1 = make_x1(input$rage_tbs,
							 input$rgender_tbs,
							 rhcv,
							 rdisease_vec,
							 rcreatinine(),
							 input$rbilirubin_tbs,
							 input$rinr_tbs,
							 input$rsodium_tbs,
							 input$rpotassium_tbs,
							 input$ralbumin_tbs,
							 input$rrenal_tbs,
							 input$rinpatient_tbs,
							 rregistration_vec,
							 input$rprevious_surgery_tbs,
							 input$rencephalopathy_tbs,
							 input$rascites_tbs,
							 input$rwaiting_time_tbs,
							 input$rdiabetes_tbs,
							 input$rmax_afp_tbs,
							 input$rmax_tumour_size_tbs,
							 rtumour_number_vec,
							 input$dage_tbs,
							 dcause_vec,
							 input$dbmi_tbs,
							 ddiabetes_vec,
							 input$dtype_tbs,
							 input$bloodgroup_compatible_tbs,
							 input$splittable_tbs)
	
	x2 = make_x2(input$rsodium_tbs,
							 input$rbilirubin_tbs,
							 rcreatinine(),
							 input$rage_tbs,
							 ddiabetes_vec,
							 input$dage_tbs,
							 input$dtype_tbs)
	
	# Make big prediction table
	linear_prediction = dplyr::bind_cols(betas, x1, x2) %>% 
		mutate(transformed_x1 = raw_x1^power,
					 transformed_x1 = ifelse(ln_1 == 1, log(transformed_x1), transformed_x1),
					 transformed_x2 = raw_x2^power,
					 transformed_x2 = ifelse(ln_2 == 1, log(transformed_x2), transformed_x2)
		)
	
	# Select now on cancer or not
	linear_prediction_table = 
		if(rcancer() == 1){
			linear_prediction %>% 
				dplyr::select(parameter, m1_beta = m1_cancer_beta, m2_beta = m2_cancer_beta, 
											m1_mean = m1_cancer_mean, m2_mean = m2_cancer_mean, 
											raw_x1, raw_x2, transformed_x1, transformed_x2) %>% 
				mutate(m1_x = (transformed_x1*transformed_x2) - m1_mean,
							 m2_x = (transformed_x1*transformed_x2) - m2_mean,
							 m1_beta_x = m1_beta * m1_x,
							 m2_beta_x = m2_beta * m2_x)
		}else{
			linear_prediction %>% 
				dplyr::select(parameter, m1_beta = m1_noncancer_beta, m2_beta = m2_noncancer_beta, 
											m1_mean = m1_noncancer_mean, m2_mean = m2_noncancer_mean, 
											raw_x1, raw_x2, transformed_x1, transformed_x2) %>% 
				mutate(m1_x = (transformed_x1*transformed_x2) - m1_mean,
							 m2_x = (transformed_x1*transformed_x2) - m2_mean,
							 m1_beta_x = m1_beta * m1_x,
							 m2_beta_x = m2_beta * m2_x)
		}
	
	# Sum predictor
	m1_linear_predictor = sum(linear_prediction_table$m1_beta_x)
	m2_linear_predictor = sum(linear_prediction_table$m2_beta_x)
	
	return(
		list(m1_linear_predictor=m1_linear_predictor, 
				 m2_linear_predictor=m2_linear_predictor, 
				 linear_prediction_table=linear_prediction_table)
	)
})

# Pick appropriate survival table
surv_active = reactive({
	if(rcancer() == 1){
		surv_cancer
	}else{
		surv_noncancer
	}
})

m1 = reactive({
	surv_active()$m1_surv^exp(linear_prediction()$m1_linear_predictor) %>% sum()
})
m2 = reactive({
	surv_active()$m2_surv^exp(linear_prediction()$m2_linear_predictor) %>% sum()
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
	DT::datatable(linear_prediction()$linear_prediction_table,
								rownames=FALSE, extensions = "FixedColumns",
								options = list(#dom = 't',
									scrollX = TRUE,
									paging=FALSE,
									fixedColumns = list(leftColumns = 1, rightColumns = 0),
									searching = FALSE
								))
)
