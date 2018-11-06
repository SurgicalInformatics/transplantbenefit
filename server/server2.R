# Reset all values ----
observeEvent(input$reset_all, {
	# First panel
	updateRadioButtons(session, "rinpatient_tbs",
										 selected = 0)
	updateSelectInput(session, "rregistration_tbs", 
										selected = 1)
	updateSliderInput(session, "rwaiting_time_tbs",
										 value=30)
	updateSliderInput(session, "rage_tbs",
										 value=52)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 3)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateSliderInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 0)
	# Second panel
	updateSliderInput(session, "rbilirubin_tbs",
										 value = 20)
	updateSliderInput(session, "rinr_tbs",
										 value = 1.0)
	updateSliderInput(session, "rcreatinine_tbs",
										 value = 70)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateSliderInput(session, "rsodium_tbs",
										 value = 135)
	updateSliderInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateSliderInput(session, "ralbumin_tbs",
										 value = 30)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 0)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 0)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateSliderInput(session, "rmax_afp_tbs",
										 value=5)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 1)
	updateSliderInput(session, "rmax_tumour_size_tbs", 
										 value = 1)
	
	# Fourth panel
	updateSliderInput(session, "dage_tbs", 
										 value=52)
	updateSelectInput(session, "dcause_tbs", 
										selected = 1)
	updateSliderInput(session, "dbmi_tbs", 
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
	updateSliderInput(session, "rwaiting_time_tbs",
										 value=30)
	updateSliderInput(session, "rage_tbs",
										 value=52)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 3)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateSliderInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 0)
	# Second panel
	updateSliderInput(session, "rbilirubin_tbs",
										 value = 20)
	updateSliderInput(session, "rinr_tbs",
										 value = 1.0)
	updateSliderInput(session, "rcreatinine_tbs",
										 value = 70)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateSliderInput(session, "rsodium_tbs",
										 value = 135)
	updateSliderInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateSliderInput(session, "ralbumin_tbs",
										 value = 30)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 0)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 0)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateSliderInput(session, "rmax_afp_tbs",
										 value=5)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 1)
	updateSliderInput(session, "rmax_tumour_size_tbs", 
										 value = 1)
})

# Reset donor values ----
observeEvent(input$dreset, {
	
	# Fourth panel
	updateSliderInput(session, "dage_tbs", 
										 value=52)
	updateSelectInput(session, "dcause_tbs", 
										selected = 1)
	updateSliderInput(session, "dbmi_tbs", 
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
	updateSliderInput(session, "rwaiting_time_tbs",
										 value=30)
	updateSliderInput(session, "rage_tbs",
										 value=65)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 3)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateSliderInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 0)
	# Second panel
	updateSliderInput(session, "rbilirubin_tbs",
										 value = 100)
	updateSliderInput(session, "rinr_tbs",
										 value = 1.5)
	updateSliderInput(session, "rcreatinine_tbs",
										 value = 90)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateSliderInput(session, "rsodium_tbs",
										 value = 130)
	updateSliderInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateSliderInput(session, "ralbumin_tbs",
										 value = 25)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 0)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 1)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateSliderInput(session, "rmax_afp_tbs",
										 value=5)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 1)
	updateSliderInput(session, "rmax_tumour_size_tbs", 
										 value = 1)

})





# R very high risk ----

observeEvent(input$rveryhighrisk, {
	# First panel
	updateRadioButtons(session, "rinpatient_tbs",
										 selected = 1)
	updateSelectInput(session, "rregistration_tbs", 
										selected = 1)
	updateSliderInput(session, "rwaiting_time_tbs",
										 value=30)
	updateSliderInput(session, "rage_tbs",
										 value=65)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 3)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateSliderInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 1)
	# Second panel
	updateSliderInput(session, "rbilirubin_tbs",
										 value = 120)
	updateSliderInput(session, "rinr_tbs",
										 value = 1.7)
	updateSliderInput(session, "rcreatinine_tbs",
										 value = 110)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateSliderInput(session, "rsodium_tbs",
										 value = 125)
	updateSliderInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateSliderInput(session, "ralbumin_tbs",
										 value = 25)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 1)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 1)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateSliderInput(session, "rmax_afp_tbs",
										 value=5)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 1)
	updateSliderInput(session, "rmax_tumour_size_tbs", 
										 value = 1)
	
})






# R cancer ----
observeEvent(input$rcancer, {
	# First panel
	updateRadioButtons(session, "rinpatient_tbs",
										 selected = 0)
	updateSelectInput(session, "rregistration_tbs", 
										selected = 1)
	updateSliderInput(session, "rwaiting_time_tbs",
										 value=30)
	updateSliderInput(session, "rage_tbs",
										 value=52)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 1)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateSliderInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 0)
	# Second panel
	updateSliderInput(session, "rbilirubin_tbs",
										 value = 20)
	updateSliderInput(session, "rinr_tbs",
										 value = 1.0)
	updateSliderInput(session, "rcreatinine_tbs",
										 value = 70)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateSliderInput(session, "rsodium_tbs",
										 value = 135)
	updateSliderInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateSliderInput(session, "ralbumin_tbs",
										 value = 30)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 0)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 0)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateSliderInput(session, "rmax_afp_tbs",
										 value=5)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 1)
	updateSliderInput(session, "rmax_tumour_size_tbs", 
										 value = 2)
	
})




# R cancer close ----
observeEvent(input$rcancerclose, {
	# First panel
	updateRadioButtons(session, "rinpatient_tbs",
										 selected = 0)
	updateSelectInput(session, "rregistration_tbs", 
										selected = 1)
	updateSliderInput(session, "rwaiting_time_tbs",
										 value=30)
	updateSliderInput(session, "rage_tbs",
										 value=52)
	updateRadioButtons(session, "rgender_tbs",
										 selected=0)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 1)
	updateSelectInput(session, "rdisease_secondary_tbs", 
										selected = 9)
	updateSelectInput(session, "rdisease_tertiary_tbs", 
										selected = 9)
	updateSliderInput(session, "previous_tx_tbs",
										 value = 0)
	updateRadioButtons(session, "rprevious_surgery_tbs",
										 selected = 0)
	# Second panel
	updateSliderInput(session, "rbilirubin_tbs",
										 value = 20)
	updateSliderInput(session, "rinr_tbs",
										 value = 1.0)
	updateSliderInput(session, "rcreatinine_tbs",
										 value = 70)
	updateRadioButtons(session, "rrenal_tbs",
										 selected = 0)
	updateSliderInput(session, "rsodium_tbs",
										 value = 135)
	updateSliderInput(session, "rpotassium_tbs",
										 value = 4.5)
	updateSliderInput(session, "ralbumin_tbs",
										 value = 30)
	updateRadioButtons(session, "rencephalopathy_tbs",
										 selected = 0)
	updateRadioButtons(session, "rascites_tbs",
										 selected = 0)
	updateRadioButtons(session, "rdiabetes_tbs",
										 selected = 0)
	
	# Third panel cancer
	updateSliderInput(session, "rmax_afp_tbs",
										 value=90)
	updateSelectInput(session, "rtumour_number_tbs",
										selected = 3)
	updateSliderInput(session, "rmax_tumour_size_tbs", 
										 value = 2.9)
	
})





# Donor good  ----
observeEvent(input$dlowrisk, {

	# Fourth panel
	updateSliderInput(session, "dage_tbs", 
										 value=30)
	updateSelectInput(session, "dcause_tbs", 
										selected = 3)
	updateSliderInput(session, "dbmi_tbs", 
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
	updateSliderInput(session, "dage_tbs", 
										 value=60)
	updateSelectInput(session, "dcause_tbs", 
										selected = 1)
	updateSliderInput(session, "dbmi_tbs", 
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
	updateSliderInput(session, "dage_tbs", 
										 value=75)
	updateSelectInput(session, "dcause_tbs", 
										selected = 1)
	updateSliderInput(session, "dbmi_tbs", 
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
	updateSliderInput(session, "dage_tbs", 
										 value=40)
	updateSelectInput(session, "dcause_tbs", 
										selected = 3)
	updateSliderInput(session, "dbmi_tbs", 
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
	updateSliderInput(session, "dage_tbs", 
										 value=65)
	updateSelectInput(session, "dcause_tbs", 
										selected = 1)
	updateSliderInput(session, "dbmi_tbs", 
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



# Decompensate ----
observeEvent(input$decompensate, {
	# First panel
	updateSliderInput(session, "rwaiting_time_tbs",
										 value=input$rwaiting_time_tbs + 30)
	updateSliderInput(session, "rage_tbs",
										 value=input$rage_tbs + 0.08)

	# Second panel
	updateSliderInput(session, "rbilirubin_tbs",
										 value = input$rbilirubin_tbs + 5)
	updateSliderInput(session, "rinr_tbs",
										 value = input$rinr_tbs + 0.1)
	updateSliderInput(session, "rcreatinine_tbs",
										 value = input$rcreatinine_tbs + 5)
	updateSliderInput(session, "rsodium_tbs",
										 value = input$rsodium_tbs - 0.5)
	updateSliderInput(session, "ralbumin_tbs",
										 value = input$ralbumin_tbs - 0.2)
})

# Stable on list ----
observeEvent(input$stable_on_list, {
	# First panel
	updateSliderInput(session, "rwaiting_time_tbs",
										 value=input$rwaiting_time_tbs + 182)
	updateSliderInput(session, "rage_tbs",
										 value=input$rage_tbs + 0.5)
})


# Cancer growing ---- 
# R cancer ----
observeEvent(input$cancer_growing, {
	# First panel
	updateSliderInput(session, "rwaiting_time_tbs",
										 value=input$rwaiting_time_tbs + 30)
	updateSliderInput(session, "rage_tbs",
										 value = input$rage_tbs + 0.08)
	updateSelectInput(session, "rdisease_primary_tbs", 
										selected = 1)
	# Third panel cancer
	updateSliderInput(session, "rmax_afp_tbs",
										 value=input$rmax_afp_tbs + 5)
	updateSliderInput(session, "rmax_tumour_size_tbs", 
										 value = input$rmax_tumour_size_tbs + 0.2)
	
})

