# Reset all values ----
observeEvent(input$reset_all, {
	# First panel
	updateRadioButtons(session, "rinpatient_tbs",
										 selected = 0)
	updateSelectInput(session, "rregistration_tbs", 
										selected = 1)
	updateNumericInput(session, "rwaiting_time_tbs",
										 value=30)
	updateNumericInput(session, "rage_tbs",
										 value=52)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 3)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateNumericInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 0)
	# Second panel
	updateNumericInput(session, "rbilirubin_tbs",
										 value = 20)
	updateNumericInput(session, "rinr_tbs",
										 value = 1.0)
	updateNumericInput(session, "rcreatinine_tbs",
										 value = 90)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateNumericInput(session, "rsodium_tbs",
										 value = 135)
	updateNumericInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateNumericInput(session, "ralbumin_tbs",
										 value = 30)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 0)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 0)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateNumericInput(session, "rmax_afp_tbs",
										 value=5)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 1)
	updateNumericInput(session, "rmax_tumour_size_tbs", 
										 value = 1)
	
	# Fourth panel
	updateNumericInput(session, "dage_tbs", 
										 value=52)
	updateSelectInput(session, "dcause_tbs", 
										selected = 1)
	updateNumericInput(session, "dbmi_tbs", 
										 value=25)
	updateRadioButtons(session, "ddiabetes_tbs", 
										 selected = 1)
	updateRadioButtons(session, "dtype_tbs",
										 selected = 0)
	updateRadioButtons(session, "bloodgroup_compatible_tbs", 
										 selected = 0)
	updateRadioButtons(session, "splittable_tbs", 
										 selected = 0)
})







# Reset recipient values ----
observeEvent(input$rreset, {
	# First panel
	updateRadioButtons(session, "rinpatient_tbs",
										 selected = 0)
	updateSelectInput(session, "rregistration_tbs", 
										selected = 1)
	updateNumericInput(session, "rwaiting_time_tbs",
										 value=30)
	updateNumericInput(session, "rage_tbs",
										 value=52)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 3)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateNumericInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 0)
	# Second panel
	updateNumericInput(session, "rbilirubin_tbs",
										 value = 20)
	updateNumericInput(session, "rinr_tbs",
										 value = 1.0)
	updateNumericInput(session, "rcreatinine_tbs",
										 value = 90)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateNumericInput(session, "rsodium_tbs",
										 value = 135)
	updateNumericInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateNumericInput(session, "ralbumin_tbs",
										 value = 30)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 0)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 0)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateNumericInput(session, "rmax_afp_tbs",
										 value=5)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 1)
	updateNumericInput(session, "rmax_tumour_size_tbs", 
										 value = 1)
})

# Reset donor values ----
observeEvent(input$dreset, {
	
	# Fourth panel
	updateNumericInput(session, "dage_tbs", 
										 value=52)
	updateSelectInput(session, "dcause_tbs", 
										selected = 1)
	updateNumericInput(session, "dbmi_tbs", 
										 value=25)
	updateRadioButtons(session, "ddiabetes_tbs", 
										 selected = 1)
	updateRadioButtons(session, "dtype_tbs",
										 selected = 0)
	updateRadioButtons(session, "bloodgroup_compatible_tbs", 
										 selected = 0)
	updateRadioButtons(session, "splittable_tbs", 
										 selected = 0)
})



# R high risk ----
observeEvent(input$rhighrisk, {
	# First panel
	updateRadioButtons(session, "rinpatient_tbs",
										 selected = 0)
	updateSelectInput(session, "rregistration_tbs", 
										selected = 1)
	updateNumericInput(session, "rwaiting_time_tbs",
										 value=30)
	updateNumericInput(session, "rage_tbs",
										 value=65)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 3)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateNumericInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 0)
	# Second panel
	updateNumericInput(session, "rbilirubin_tbs",
										 value = 100)
	updateNumericInput(session, "rinr_tbs",
										 value = 1.5)
	updateNumericInput(session, "rcreatinine_tbs",
										 value = 90)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateNumericInput(session, "rsodium_tbs",
										 value = 130)
	updateNumericInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateNumericInput(session, "ralbumin_tbs",
										 value = 25)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 0)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 1)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateNumericInput(session, "rmax_afp_tbs",
										 value=5)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 1)
	updateNumericInput(session, "rmax_tumour_size_tbs", 
										 value = 1)

})





# R very high risk ----

observeEvent(input$rveryhighrisk, {
	# First panel
	updateRadioButtons(session, "rinpatient_tbs",
										 selected = 1)
	updateSelectInput(session, "rregistration_tbs", 
										selected = 1)
	updateNumericInput(session, "rwaiting_time_tbs",
										 value=30)
	updateNumericInput(session, "rage_tbs",
										 value=65)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 3)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateNumericInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 1)
	# Second panel
	updateNumericInput(session, "rbilirubin_tbs",
										 value = 120)
	updateNumericInput(session, "rinr_tbs",
										 value = 1.7)
	updateNumericInput(session, "rcreatinine_tbs",
										 value = 110)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateNumericInput(session, "rsodium_tbs",
										 value = 125)
	updateNumericInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateNumericInput(session, "ralbumin_tbs",
										 value = 25)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 1)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 1)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateNumericInput(session, "rmax_afp_tbs",
										 value=5)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 1)
	updateNumericInput(session, "rmax_tumour_size_tbs", 
										 value = 1)
	
})






# R cancer ----
observeEvent(input$rcancer, {
	# First panel
	updateRadioButtons(session, "rinpatient_tbs",
										 selected = 0)
	updateSelectInput(session, "rregistration_tbs", 
										selected = 1)
	updateNumericInput(session, "rwaiting_time_tbs",
										 value=30)
	updateNumericInput(session, "rage_tbs",
										 value=52)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 1)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateNumericInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 0)
	# Second panel
	updateNumericInput(session, "rbilirubin_tbs",
										 value = 20)
	updateNumericInput(session, "rinr_tbs",
										 value = 1.0)
	updateNumericInput(session, "rcreatinine_tbs",
										 value = 90)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateNumericInput(session, "rsodium_tbs",
										 value = 135)
	updateNumericInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateNumericInput(session, "ralbumin_tbs",
										 value = 30)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 0)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 0)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateNumericInput(session, "rmax_afp_tbs",
										 value=5)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 1)
	updateNumericInput(session, "rmax_tumour_size_tbs", 
										 value = 2)
	
})




# R cancer close ----
observeEvent(input$rcancerclose, {
	# First panel
	updateRadioButtons(session, "rinpatient_tbs",
										 selected = 0)
	updateSelectInput(session, "rregistration_tbs", 
										selected = 1)
	updateNumericInput(session, "rwaiting_time_tbs",
										 value=30)
	updateNumericInput(session, "rage_tbs",
										 value=52)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 1)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateNumericInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 0)
	# Second panel
	updateNumericInput(session, "rbilirubin_tbs",
										 value = 20)
	updateNumericInput(session, "rinr_tbs",
										 value = 1.0)
	updateNumericInput(session, "rcreatinine_tbs",
										 value = 90)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateNumericInput(session, "rsodium_tbs",
										 value = 135)
	updateNumericInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateNumericInput(session, "ralbumin_tbs",
										 value = 30)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 0)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 0)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateNumericInput(session, "rmax_afp_tbs",
										 value=90)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 3)
	updateNumericInput(session, "rmax_tumour_size_tbs", 
										 value = 2.9)
	
})





# Donor good  ----
observeEvent(input$dlowrisk, {

	# Fourth panel
	updateNumericInput(session, "dage_tbs", 
										 value=30)
	updateSelectInput(session, "dcause_tbs", 
										selected = 2)
	updateNumericInput(session, "dbmi_tbs", 
										 value=25)
	updateRadioButtons(session, "ddiabetes_tbs", 
										 selected = 1)
	updateRadioButtons(session, "dtype_tbs",
										 selected = 0)
	updateRadioButtons(session, "bloodgroup_compatible_tbs", 
										 selected = 0)
	updateRadioButtons(session, "splittable_tbs", 
										 selected = 1)
})


# Donor mod  ----
observeEvent(input$dmodrisk, {
	
	# Fourth panel
	updateNumericInput(session, "dage_tbs", 
										 value=60)
	updateSelectInput(session, "dcause_tbs", 
										selected = 1)
	updateNumericInput(session, "dbmi_tbs", 
										 value=30)
	updateRadioButtons(session, "ddiabetes_tbs", 
										 selected = 2)
	updateRadioButtons(session, "dtype_tbs",
										 selected = 0)
	updateRadioButtons(session, "bloodgroup_compatible_tbs", 
										 selected = 0)
	updateRadioButtons(session, "splittable_tbs", 
										 selected = 0)
})



# Donor marginal  ----
observeEvent(input$dmarginal, {
	
	# Fourth panel
	updateNumericInput(session, "dage_tbs", 
										 value=75)
	updateSelectInput(session, "dcause_tbs", 
										selected = 1)
	updateNumericInput(session, "dbmi_tbs", 
										 value=40)
	updateRadioButtons(session, "ddiabetes_tbs", 
										 selected = 2)
	updateRadioButtons(session, "dtype_tbs",
										 selected = 0)
	updateRadioButtons(session, "bloodgroup_compatible_tbs", 
										 selected = 0)
	updateRadioButtons(session, "splittable_tbs", 
										 selected = 0)
})


# Donor good DCD  ----
observeEvent(input$ddcdgood, {
	
	# Fourth panel
	updateNumericInput(session, "dage_tbs", 
										 value=45)
	updateSelectInput(session, "dcause_tbs", 
										selected = 2)
	updateNumericInput(session, "dbmi_tbs", 
										 value=25)
	updateRadioButtons(session, "ddiabetes_tbs", 
										 selected = 1)
	updateRadioButtons(session, "dtype_tbs",
										 selected = 1)
	updateRadioButtons(session, "bloodgroup_compatible_tbs", 
										 selected = 0)
	updateRadioButtons(session, "splittable_tbs", 
										 selected = 0)
})


# Donor marginal DCD  ----
observeEvent(input$ddcdmarginal, {
	
	# Fourth panel
	updateNumericInput(session, "dage_tbs", 
										 value=65)
	updateSelectInput(session, "dcause_tbs", 
										selected = 1)
	updateNumericInput(session, "dbmi_tbs", 
										 value=30)
	updateRadioButtons(session, "ddiabetes_tbs", 
										 selected = 2)
	updateRadioButtons(session, "dtype_tbs",
										 selected = 1)
	updateRadioButtons(session, "bloodgroup_compatible_tbs", 
										 selected = 0)
	updateRadioButtons(session, "splittable_tbs", 
										 selected = 0)
})