# TBS calculation

# Define variables used else where
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

tbs_out = reactive({
	fn_tbs(
		centre_tbs = input$centre_tbs,
		rregistration_tbs = input$rregistration_tbs,
		rinpatient_tbs = input$rinpatient_tbs,
		rwaiting_time_tbs = input$rwaiting_time_tbs,
		rage_tbs = input$rage_tbs,
		rgender_tbs = input$rgender_tbs,
		rdisease_primary_tbs = input$rdisease_primary_tbs, 
		rdisease_secondary_tbs = input$rdisease_secondary_tbs,
		rdisease_tertiary_tbs = input$rdisease_tertiary_tbs,
		previous_tx_tbs = input$previous_tx_tbs,
		rprevious_surgery_tbs = input$rprevious_surgery_tbs,
		rbilirubin_tbs = input$rbilirubin_tbs,
		rinr_tbs = input$rinr_tbs,
		rcreatinine_tbs = input$rcreatinine_tbs,
		rrenal_tbs = input$rrenal_tbs,
		rsodium_tbs = input$rsodium_tbs,
		rpotassium_tbs = input$rpotassium_tbs,
		ralbumin_tbs = input$ralbumin_tbs,
		rencephalopathy_tbs = input$rencephalopathy_tbs,
		rascites_tbs = input$rascites_tbs,
		rdiabetes_tbs = input$rdiabetes_tbs,
		rmax_afp_tbs = input$rmax_afp_tbs,
		rtumour_number_tbs = input$rtumour_number_tbs,
		rmax_tumour_size_tbs = input$rmax_tumour_size_tbs,
		dage_tbs = input$dage_tbs,
		dcause_tbs = input$dcause_tbs,
		dbmi_tbs = input$dbmi_tbs,
		ddiabetes_tbs = input$ddiabetes_tbs,
		dtype_tbs = input$dtype_tbs,
		splittable_tbs = input$splittable_tbs,
		bloodgroup_compatible_tbs = input$bloodgroup_compatible_tbs,
		
		include_table = TRUE
	)
})

# Output
output$m1Box <- renderInfoBox({
	infoBox(
		"Need (M1)", h1(finalfit::round_tidy(tbs_out()[[1]]$m1, 1)), 
		"Lower indicates greater need",
		icon = icon("bar-chart"),
		color = "black", fill=TRUE
	)
})
output$m2Box <- renderInfoBox({
	infoBox(
		"Utility (M2)", h1(finalfit::round_tidy(tbs_out()[[1]]$m2, 1)), 
		"Higher indicates greater utility",
		icon = icon("bar-chart"),
		color = "black", fill=TRUE
	)
})

tbs_status = reactive({
	ifelse(tbs_out()[[1]]$tbs >1000, "red", 
				 ifelse(tbs_out()[[1]]$tbs >600, "orange", "green"))
})


output$tbsBox <- renderInfoBox({
	infoBox(
		"TBS (M2-M1)", h1(finalfit::round_tidy(tbs_out()[[1]]$tbs, 1)), 
		icon = icon("bar-chart"),
		"Higher indicates greater net-benefit",
		color = tbs_status(), fill=TRUE
	)
})


output$x1 = DT::renderDataTable(
	DT::datatable(tbs_out()$linear_prediction_table,
								rownames=FALSE, extensions = "FixedColumns",
								options = list(#dom = 't',
									scrollX = TRUE,
									paging=FALSE,
									fixedColumns = list(leftColumns = 1, rightColumns = 0),
									searching = FALSE
								))
)
