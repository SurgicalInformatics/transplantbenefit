# Recode input for output table

report_table1 <- reactive({
	dplyr::data_frame(
		Centre = factor(input$centre_tbs, levels = c(0,1,2,3,4,5,6,7),
										labels = c("Newcastle", 
															 "Leeds",
															 "Cambridge",
															 "Royal Free",
															 "King's College",
															 "Birmingham",
															 "Edinburgh",
															 "Other")),
		Registered = factor(input$rregistration_tbs, levels = c(1,7,6,5,4,3,2),
												labels = c("2013+",
																	 "2012",
																	 "2011",
																	 "2010",
																	 "2009",
																	 "2008",
																	 "2007")),
		Location = factor(input$rinpatient_tbs, levels = c(0, 1),
											labels = c("Outpatient", "Inpatient")),
		`Waiting time (days)` = input$rwaiting_time_tbs,
		`Recipient age (years)` = input$rage_tbs,
		Sex = factor(input$rgender_tbs, levels = c(0, 1),
								 labels = c("Male", "Female")),
		`Primary disease` = factor(input$rdisease_primary_tbs, levels = c(3,8,1,4,2,5,6,7,8,9),
																		 labels = c(
																		 	"Alcohol",
																		 	"NAFLD", 
																		 	"HCC",
																		 	"Hepatitis B (HBV)", 
																		 	"Hepatitis C (HCV)",
																		 	"PSC",
																		 	"PBC",
																		 	"Autoimmune/cryptogenic",
																		 	"Metabolic/Wilson's/alpha-1",
																		 	"Nil or other")),
		`Secondary disease` = factor(input$rdisease_secondary_tbs, levels = c(3,8,1,4,2,5,6,7,8,9),
																			 labels = c(
																			 	"Alcohol",
																			 	"NAFLD", 
																			 	"HCC",
																			 	"Hepatitis B (HBV)", 
																			 	"Hepatitis C (HCV)",
																			 	"PSC",
																			 	"PBC",
																			 	"Autoimmune/cryptogenic",
																			 	"Metabolic/Wilson's/alpha-1",
																			 	"Nil or other")),
		`Tertiary disease` = factor(input$rdisease_tertiary_tbs, levels = c(3,8,1,4,2,5,6,7,8,9),
																			labels = c(
																				"Alcohol",
																				"NAFLD", 
																				"HCC",
																				"Hepatitis B (HBV)", 
																				"Hepatitis C (HCV)",
																				"PSC",
																				"PBC",
																				"Autoimmune/cryptogenic",
																				"Metabolic/Wilson's/alpha-1",
																				"Nil or other")),
		`Number previous OLTs` = input$previous_tx_tbs,
		`Previous abdo surgery` = factor(input$rprevious_surgery_tbs, levels = c(0, 1),
																		 labels = c("No", "Yes"))
	) %>% 
		tidyr::gather()
})

report_table2 <- reactive({
	dplyr::data_frame(
		`Bilirubin (umol/L)` = input$rbilirubin_tbs,
		INR = finalfit::round_tidy(input$rinr_tbs, 1),
		`Creatinine (umol/L)` = input$rcreatinine_tbs,
		`Renal replacement` = factor(input$rrenal_tbs, levels = c(0,1),
																 labels = c("No", "Yes")),
		`Sodium (mmol/L)` = input$rsodium_tbs,
		`Potassium (mmol/L)`  = finalfit::round_tidy(input$rpotassium_tbs, 1),
		`Albumin (g/L)` = input$ralbumin_tbs,
		Encephalopathy = factor(input$rencephalopathy_tbs, levels = c(0, 1),
														labels = c("No", "Yes")),
		Ascites = factor(input$rascites_tbs, levels = c(0, 1),
										 labels = c("No", "Yes")),
		Diabetes = factor(input$rdiabetes_tbs, levels = c(0, 1), 
											labels = c("No", "Yes")),
		` ` = " "
	)  %>% 
		tidyr::gather()
})


report_table3 <- reactive({
	dplyr::data_frame(
		`Donor age (years)` = input$dage_tbs,
		`Cause of death` = factor(input$dcause_tbs, levels = c(1,2,3,4),
																		labels = c("ICB",
																							 "Trauma RTA",
																							 "Non-RTA trauma",
																							 "Other")),
		`Donor BMI` = input$dbmi_tbs,
		`Donor diabetes` = factor(input$ddiabetes_tbs, levels = c(1,2),
															labels = c("No", "Yes")),
		`Donor type` = factor(input$dtype_tbs, levels = c(0,1),
													labels = c("DBD", "DCD")),
		Splittable = factor(input$splittable_tbs, levels = c(0,1),
												labels = c("No", "Yes")),
		`Blood grp match` = factor(input$bloodgroup_compatible_tbs, levels = c(1, 0),
																			labels = c("No", "Yes")),
		` ` = " ",
		`  ` = " ",
		`   ` = " ",
		`    ` = " "
	) %>% 
		tidyr::gather()
})


report_table4 = reactive(cbind(report_table1(), report_table2(), report_table3()))


report_table5 <- reactive({
	dplyr::data_frame(
		`aFP maximum` = input$rmax_afp_tbs,
		`Number of tumours` = factor(input$rtumour_number_tbs, levels = c(1,2,3), 
																 labels = c("One tumour", "Two tumours", "Three+ tumours")),
		`Maximum tumour size (cm)` = input$rmax_tumour_size_tbs
	) %>% 
		tidyr::gather()
})

output$report_table_out1 = renderTable(
	report_table1()
)
output$report_table_out2 = renderTable(
	report_table2()
)
output$report_table_out3 = renderTable(
	report_table3()
)
output$report_table_out4 = renderTable(
	report_table4()
)
output$report_table_out5 = renderTable(
	report_table4()
)

cancer = reactive({
	ifelse(any(input$rdisease_primary_tbs == 1, 
						 input$rdisease_secondary_tbs == 1,
						 input$rdisease_tertiary_tbs == 1), TRUE, FALSE)
})

output$tmp = renderText(cancer())


## .pdf
output$download_pdf <- downloadHandler(
	filename = function(){"tbs.pdf"},
	content = function(filename) {
		# Copy the report file to a temporary directory before processing it, in
		# case we don't have write permissions to the current working dir (which
		# can happen when deployed).
		tempReport <- file.path(tempdir(), "tbs_template.Rmd")
		file.copy("tbs_template.Rmd", tempReport, overwrite = TRUE)
		
		# Set up parameters to pass to Rmd document
		params <- list(
			tbs = finalfit::round_tidy(tbs_out()[[1]]$tbs, 1),
			need = finalfit::round_tidy(tbs_out()[[1]]$m1, 1),
			utility = finalfit::round_tidy(tbs_out()[[1]]$m2, 1),
			ukeld = ukeld(),
			standard_meld = standard_meld(),
			meld_na = meld_na(),
			download_text = input$download_text,
			footer_txt = footer_txt,
			report_table1 = report_table1(),
			report_table2 = report_table2(),
			report_table3 = report_table3(),
			report_table4 = report_table4(),
			report_table5 = report_table5(),
			cancer = cancer())
		
		
		
		# Knit the document, passing in the `params` list, and eval it in a
		# child of the global environment (this isolates the code in the document
		# from the code in this app).
		rmarkdown::render(tempReport, output_file = filename,
											params = params,
											envir = new.env(parent = globalenv())
		)
	})
