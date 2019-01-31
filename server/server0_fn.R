group2dummy <- function(group, length){
	if(group>length) stop("Group must be an integer less than or equal to length")
	out = rep(0, length-1)
	out[group-1] = 1
	return(out)
}


# Tranform input variables to desired format
## Make rdisease_group
### Cascading ifelses I'm sure could be replaced with something better
make_rdisease_vec = function(rdisease_primary_tbs, 
														 rdisease_secondary_tbs,
														 rdisease_tertiary_tbs,
														 previous_tx_tbs){
	out = ifelse(previous_tx_tbs>0, 10,
							 ifelse(any(
							 	rdisease_primary_tbs == "1",
							 	rdisease_secondary_tbs == "1",
							 	rdisease_tertiary_tbs == "1"), 
							 	1, 
							 	ifelse(any(
							 		rdisease_primary_tbs == "2",
							 		rdisease_secondary_tbs == "2",
							 		rdisease_tertiary_tbs == "2"), 
							 		2, 
							 		ifelse(any(
							 			rdisease_primary_tbs == "3",
							 			rdisease_secondary_tbs == "3",
							 			rdisease_tertiary_tbs == "3"),
							 			3, 
							 			ifelse(any(
							 				rdisease_primary_tbs == "4",
							 				rdisease_secondary_tbs == "4",
							 				rdisease_tertiary_tbs == "4"),
							 				4,
							 				ifelse(any(
							 					rdisease_primary_tbs == "5",
							 					rdisease_secondary_tbs == "5",
							 					rdisease_tertiary_tbs == "5"),
							 					5, 
							 					ifelse(any(
							 						rdisease_primary_tbs == "6",
							 						rdisease_secondary_tbs == "6",
							 						rdisease_tertiary_tbs == "6"),
							 						6, 
							 						ifelse(any(
							 							rdisease_primary_tbs == "7",
							 							rdisease_secondary_tbs == "7",
							 							rdisease_tertiary_tbs == "7"),
							 							7, 
							 							ifelse(any(
							 								rdisease_primary_tbs == "8",
							 								rdisease_secondary_tbs == "8",
							 								rdisease_tertiary_tbs == "8"),
							 								8, 9)
							 						)
							 					)
							 				)
							 			)
							 		)
							 	)
							 )
	) %>% 
		group2dummy(10)
	out = out[-2]
	return(out)
}

## Make rhcv
is_rhcv = function(rdisease_primary_tbs,
									 rdisease_secondary_tbs,
									 rdisease_tertiary_tbs){
	ifelse(any(
		rdisease_primary_tbs == 2,
		rdisease_secondary_tbs == 2,
		rdisease_tertiary_tbs == 2), 
		1, 
		0)
}

is_cancer = function(rdisease_primary_tbs, 
										 rdisease_secondary_tbs,
										 rdisease_tertiary_tbs){
	ifelse(any(rdisease_primary_tbs == 1, 
						 rdisease_secondary_tbs == 1,
						 rdisease_tertiary_tbs == 1),
				 1,
				 0)
}

## Fix this funny Royal Free creatinine thing
make_rcreatinine = function(centre_tbs, rcreatinine_tbs){
	if(centre_tbs == "3"){
		out = (rcreatinine_tbs + 23.4) / 1.2
	}else{
		out = rcreatinine_tbs
	}
	return(out)
}

# Make x1 table
make_x1 = function(rage_tbs,
									 rgender_tbs,
									 rhcv,
									 rdisease_vec,
									 rcreatinine,
									 rbilirubin_tbs,
									 rinr_tbs,
									 rsodium_tbs,
									 rpotassium_tbs,
									 ralbumin_tbs,
									 rrenal_tbs,
									 rinpatient_tbs,
									 rregistration_vec,
									 rprevious_surgery_tbs,
									 rencephalopathy_tbs,
									 rascites_tbs,
									 rwaiting_time_tbs,
									 rdiabetes_tbs,
									 rmax_afp_tbs,
									 rmax_tumour_size_tbs,
									 rtumour_number_vec,
									 dage_tbs,
									 dcause_vec,
									 dbmi_tbs,
									 ddiabetes_vec,
									 dtype_tbs,
									 bloodgroup_compatible_tbs,
									 splittable_tbs){
	data.frame(raw_x1 = 
						 	as.numeric(
						 		c(rage_tbs,
						 			rage_tbs,
						 			rgender_tbs,
						 			rhcv,
						 			rdisease_vec,
						 			rcreatinine,
						 			rbilirubin_tbs,
						 			rinr_tbs,
						 			rsodium_tbs,
						 			rpotassium_tbs,
						 			ralbumin_tbs,
						 			rrenal_tbs,
						 			rinpatient_tbs,
						 			rregistration_vec,
						 			rbilirubin_tbs,
						 			rdisease_vec,
						 			rage_tbs,
						 			rprevious_surgery_tbs,
						 			rencephalopathy_tbs,
						 			rascites_tbs,
						 			as.numeric(rwaiting_time_tbs) + 1,
						 			rdiabetes_tbs,
						 			rdisease_vec,
						 			as.numeric(rmax_afp_tbs) + 1,
						 			rmax_tumour_size_tbs,
						 			rtumour_number_vec,
						 			dage_tbs,
						 			dcause_vec,
						 			dbmi_tbs,
						 			ddiabetes_vec,
						 			dtype_tbs,
						 			rhcv,
						 			rhcv,
						 			rhcv,
						 			dtype_tbs,
						 			dtype_tbs,
						 			rdisease_vec ,
						 			bloodgroup_compatible_tbs,
						 			splittable_tbs)
						 	)
	)
}

# Make x2 table
make_x2 = function(rsodium_tbs,
									 rbilirubin_tbs,
									 rcreatinine,
									 rage_tbs,
									 ddiabetes_vec,
									 dage_tbs,
									 dtype_tbs){
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
						 			rsodium_tbs,
						 			rbilirubin_tbs,
						 			rbilirubin_tbs,
						 			rbilirubin_tbs,
						 			rbilirubin_tbs,
						 			rbilirubin_tbs,
						 			rbilirubin_tbs,
						 			rbilirubin_tbs,
						 			rbilirubin_tbs,
						 			rcreatinine,
						 			1,
						 			1,
						 			1,
						 			1,
						 			1,
						 			rage_tbs,
						 			rage_tbs,
						 			rage_tbs,
						 			rage_tbs,
						 			rage_tbs,
						 			rage_tbs,
						 			rage_tbs,
						 			rage_tbs,
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
						 			ddiabetes_vec,
						 			dage_tbs,
						 			rage_tbs,
						 			rcreatinine,
						 			dtype_tbs,
						 			dtype_tbs,
						 			dtype_tbs,
						 			dtype_tbs,
						 			dtype_tbs,
						 			dtype_tbs,
						 			dtype_tbs,
						 			dtype_tbs,
						 			1,
						 			1)
						 	)
	)
}





# Self contained function to generate M1, M2, and TBS ------------------
## In shiny, may be a little bit slower than running components
## Hence just used in this form for exploration page. 
fn_tbs <- function(centre_tbs,
									 rregistration_tbs,
									 rinpatient_tbs,
									 rwaiting_time_tbs,
									 rage_tbs,
									 rgender_tbs,
									 rdisease_primary_tbs, 
									 rdisease_secondary_tbs,
									 rdisease_tertiary_tbs,
									 previous_tx_tbs,
									 rprevious_surgery_tbs,
									 rbilirubin_tbs,
									 rinr_tbs,
									 rcreatinine_tbs,
									 rrenal_tbs,
									 rsodium_tbs,
									 rpotassium_tbs,
									 ralbumin_tbs,
									 rencephalopathy_tbs,
									 rascites_tbs,
									 rdiabetes_tbs,
									 rmax_afp_tbs,
									 rtumour_number_tbs,
									 rmax_tumour_size_tbs,
									 dage_tbs,
									 dcause_tbs,
									 dbmi_tbs,
									 ddiabetes_tbs,
									 dtype_tbs,
									 splittable_tbs,
									 bloodgroup_compatible_tbs,
									 
									 include_table = FALSE
){
	
	rregistration_vec = group2dummy(as.numeric(rregistration_tbs), 7)
	rdisease_vec = make_rdisease_vec(rdisease_primary_tbs, 
																	 rdisease_secondary_tbs,
																	 rdisease_tertiary_tbs,
																	 previous_tx_tbs)
	rcancer = is_cancer(rdisease_primary_tbs, 
											rdisease_secondary_tbs,
											rdisease_tertiary_tbs)
	rhcv = is_rhcv(rdisease_primary_tbs,
								 rdisease_secondary_tbs,
								 rdisease_tertiary_tbs)
	rcreatinine = make_rcreatinine(centre_tbs, rcreatinine_tbs)
	rtumour_number_vec = group2dummy(as.numeric(rtumour_number_tbs), 3)
	dcause_vec = group2dummy(as.numeric(dcause_tbs), 4)
	ddiabetes_vec = group2dummy(as.numeric(ddiabetes_tbs), 3)
	
	x1 = make_x1(rage_tbs,
							 rgender_tbs,
							 rhcv,
							 rdisease_vec,
							 rcreatinine,
							 rbilirubin_tbs,
							 rinr_tbs,
							 rsodium_tbs,
							 rpotassium_tbs,
							 ralbumin_tbs,
							 rrenal_tbs,
							 rinpatient_tbs,
							 rregistration_vec,
							 rprevious_surgery_tbs,
							 rencephalopathy_tbs,
							 rascites_tbs,
							 rwaiting_time_tbs,
							 rdiabetes_tbs,
							 rmax_afp_tbs,
							 rmax_tumour_size_tbs,
							 rtumour_number_vec,
							 dage_tbs,
							 dcause_vec,
							 dbmi_tbs,
							 ddiabetes_vec,
							 dtype_tbs,
							 bloodgroup_compatible_tbs,
							 splittable_tbs)
	
	x2 = make_x2(rsodium_tbs,
							 rbilirubin_tbs,
							 rcreatinine,
							 rage_tbs,
							 ddiabetes_vec,
							 dage_tbs,
							 dtype_tbs)
	
	# Make big prediction table
	linear_prediction = dplyr::bind_cols(betas, x1, x2) %>% 
		mutate(transformed_x1 = raw_x1^power,
					 transformed_x1 = ifelse(ln_1 == 1, log(transformed_x1), transformed_x1),
					 transformed_x2 = raw_x2^power,
					 transformed_x2 = ifelse(ln_2 == 1, log(transformed_x2), transformed_x2)
		)
	
	# Select now on cancer or not
	linear_prediction_table = 
		if(rcancer == 1){
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
	
	# Pick appropriate survival table
	surv_active = 
		if(rcancer == 1){
			surv_cancer
		}else{
			surv_noncancer
		}
	
	# Generate need, utility and TBS
	m1 = surv_active$m1_surv^exp(m1_linear_predictor) %>% sum()
	m2 = surv_active$m2_surv^exp(m2_linear_predictor) %>% sum()
	tbs = m2 - m1
	
	if(include_table){
		return(list(
			data.frame(m1 = m1,
								 m2 = m2,
								 tbs = tbs),
			linear_prediction_table = linear_prediction_table)
		)
	} else {
		return(
			data.frame(m1 = m1,
								 m2 = m2,
								 tbs = tbs)
		)
	}
	
}
