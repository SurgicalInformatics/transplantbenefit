# UKELD ----
ukeld = reactive({
	bil_ukeld = max(input$rbilirubin_tbs, 1)
	creat_ukeld = min(max(input$rcreatinine_tbs, 1), 400)
	inr_ukeld = max(input$rinr_tbs, 1)
	na_ukeld = input$rsodium_tbs
	components = paste("Bil", round(bil_ukeld, 0), "umol/L |",
										 "Creat", round(creat_ukeld, 0), "umol/L |",
										 "INR", round(inr_ukeld, 1), "IU |",
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