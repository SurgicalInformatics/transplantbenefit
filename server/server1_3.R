# UKELD ----
ukeld = reactive({
	bil_ukeld = max(input$rbilirubin_tbs, 1)
	creat_ukeld = min(max(rcreatinine(), 1), 400)
	inr_ukeld = max(input$rinr_tbs, 1)
	na_ukeld = input$rsodium_tbs
	components = paste("Bil", round(bil_ukeld, 0), "umol/L |",
										 "Creat", round(creat_ukeld, 0), "umol/L |",
										 "INR", finalfit::round_tidy(inr_ukeld, 1), " |",
										 "Na", round(na_ukeld, 1), "mmol/L"
	)
	ukeld = round(
		(5.395 * log(inr_ukeld))+
			(1.485 * log(creat_ukeld))+
			(3.13 * log(bil_ukeld))-
			(81.565 * log(na_ukeld))+
			435,
		0)
	return(list(ukeld, components))
})
ukeld_status = reactive({
	ifelse(ukeld()[[1]] >61, "red", 
				 ifelse(ukeld()[[1]] >48, "orange", "green"))
})

output$ukeldBox <- renderInfoBox({
	infoBox(
		"UKELD", h1(ukeld()[[1]]), ukeld()[[2]], icon = icon("bar-chart"),
		color = ukeld_status(), fill=TRUE
	)
})

# MELD ----
standard_meld = reactive({
	creat_mg = ifelse(input$rrenal_tbs == 0, rcreatinine()/88.42, 4)
	bil_meld = max(input$rbilirubin_tbs/17.1, 1)
	creat_meld = min(max(creat_mg, 1), 4)
	inr_meld = max(input$rinr_tbs, 1) 
	components = paste("Bilirubin", round(bil_meld, 1), "mg/dL |",
										 "Creatinine", round(creat_meld, 1), "mg/dL |",
										 "INR", finalfit::round_tidy(inr_meld, 1)
	)
	standard_meld = round(
		(11.2 * log(inr_meld)) + 
			(9.57 * log(creat_meld)) +
			(3.78 * log(bil_meld)) + 
			6.43,
		0)
	return(list(standard_meld, components))
})
standard_meld_status = reactive({
	ifelse(standard_meld()[[1]] >35, "red", 
				 ifelse(standard_meld()[[1]] >11, "orange", "green"))
})

output$meldBox <- renderInfoBox({
	infoBox(
		"MELD", h1(standard_meld()[[1]]), standard_meld()[[2]], icon = icon("bar-chart"),
		color = standard_meld_status(), fill=TRUE
	)
})


# MELD-Na ----
meld_na = reactive({
	creat_mg = ifelse(input$rrenal_tbs == 0, rcreatinine()/88.42, 4)
	bil_meld = max(input$rbilirubin_tbs/17.1, 1)
	creat_meld = min(max(creat_mg, 1), 4)
	inr_meld = max(input$rinr_tbs, 1) 
	na_meld = min(max(input$rsodium_tbs, 125), 140)
	components = paste("Bilirubin", round(bil_meld, 1), "mg/dL |",
										 "Creatinine", round(creat_meld, 1), "mg/dL |",
										 "INR", finalfit::round_tidy(inr_meld, 1), " |",
										 "Na", na_meld, "mmol/L"
	)
	meld_na = round(
		standard_meld()[[1]] - 
			na_meld - 
			(0.025 * standard_meld()[[1]] * (140 - na_meld)) +
			140,
		0)
	return(list(meld_na, components))
})
meld_na_status = reactive({
	ifelse(meld_na()[[1]] >35, "red", 
				 ifelse(meld_na()[[1]] >11, "orange", "green"))
})

output$meldnaBox <- renderInfoBox({
	infoBox(
		"MELD-Sodium (MELD-Na)", h1(meld_na()[[1]]), meld_na()[[2]], icon = icon("bar-chart"),
		color = meld_na_status(), fill=TRUE
	)
})
