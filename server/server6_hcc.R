# HCC scoring
# AFP conversion
afp_iu = reactive({ ifelse(input$afp_units == "1", input$afp, input$afp/1.21)})

#	UK_listing
uk_hcc <- reactive({
	hcc_n_uk = cut(input$hcc_n, c(0, 1, 5, 11), c("1", "2 to 5", ">5"), right=TRUE)
	hcc_size_uk = cut(input$hcc_size, c(0, 3, 5, 7, 11), c("≤3 cm", "3 to 5 cm", ">5 to 7 cm", ">7 cm"))
	afp_uk = cut(afp_iu(), c(-1, 1000, 10000), c("≤1000 IU/mL", ">1000 IU/mL"), right=TRUE)
	invasion_uk = input$invasion
	mets_uk = input$mets
	borderline = ifelse(hcc_n_uk == "1" & hcc_size_uk == ">5 to 7 cm", 
											" | Single tumour >5cm to 7cm with no progression (volume <20% increase) + no new nodules over 6 months.",
											"")
	components = paste0("Number ", hcc_n_uk, " | Size ", hcc_size_uk, " | AFP ", afp_uk, " | Vascular invasion ", invasion_uk, 
											" | Extrahepatic ", mets_uk, borderline
	)
	uk_hcc = ifelse(
		hcc_n_uk == ">5" |
			hcc_size_uk == ">7 cm" |
			afp_uk == ">1000 IU/mL" |
			invasion_uk == 1 |
			mets_uk == 1, "Outwith", 
		ifelse(hcc_n_uk == "2 to 5" &
					 	(hcc_size_uk == "3 to 5 cm" |
					 	 	hcc_size_uk == ">5 to 7 cm"), "Outwith",
					 ifelse(hcc_n_uk == "1" &
					 			 	hcc_size_uk == ">5 to 7 cm", "Borderline", "Within")))
	return(list(uk_hcc, components, borderline))
})
uk_hcc_status = reactive({
	ifelse(uk_hcc()[[1]] == "Outwith", "red", 
				 ifelse(uk_hcc()[[1]] == "Borderline", "orange", "green"))
})

# Milan ----
milan_hcc <- reactive({
	hcc_n_milan = cut(input$hcc_n, c(0, 1, 3, 11), c("1", "2 to 3", ">3"), right=TRUE)
	hcc_size_milan = cut(input$hcc_size, c(0, 3, 5, 11), c("≤3 cm", "3 to 5 cm", ">5 cm"))
	invasion_milan = input$invasion
	mets_milan = input$mets
	components = paste0("Number ", hcc_n_milan, " | Size ", hcc_size_milan, " | Vascular invasion ", invasion_milan, 
											" | Extrahepatic ", mets_milan
	)
	milan_hcc = ifelse(
		hcc_n_milan == ">3" |
			hcc_size_milan == ">5 cm" |
			invasion_milan == 1 |
			mets_milan == 1, "Outwith", 
		ifelse(hcc_n_milan == "2 to 3" &
					 	(hcc_size_milan == "3 to 5 cm"), "Outwith", "Within"))
	return(list(milan_hcc, components))
})
milan_hcc_status = reactive({
	ifelse(milan_hcc()[[1]] == "Outwith", "red", "green")
})

# UCSF (2001) ----
ucsf_hcc <- reactive({
	hcc_n_ucsf = cut(input$hcc_n, c(0, 1, 3, 11), c("1", "2 to 3", ">3"), right=TRUE)
	hcc_size_ucsf = cut(input$hcc_size, c(0, 4.5, 6.5, 11), c("≤4.5 cm", "4.5 to 6.5 cm", ">6.5 cm"))
	invasion_ucsf = input$invasion
	mets_ucsf = input$mets
	components = paste0("Number ", hcc_n_ucsf, " | Size ", hcc_size_ucsf, " | Vascular invasion ", invasion_ucsf, 
											" | Extrahepatic ", mets_ucsf, " | Need total diameter ≤8 cm"
	)
	ucsf_hcc = ifelse(
		hcc_n_ucsf == ">3" |
			hcc_size_ucsf == ">6.5 cm" |
			invasion_ucsf == 1 |
			mets_ucsf == 1, "Outwith", 
		ifelse(hcc_n_ucsf == "2 to 3" &
					 	(hcc_size_ucsf == "4.5 to 6.5 cm"), "Outwith", "Within"))
	return(list(ucsf_hcc, components))
})
ucsf_hcc_status = reactive({
	ifelse(ucsf_hcc()[[1]] == "Outwith", "red", "green")
})


#	Duvoux listing
duvoux_hcc <- reactive({
	hcc_n_duvoux = cut(input$hcc_n, c(0, 3, 11), c("≤3 (0 points)", ">3 (2 points)"), right=TRUE)
	hcc_size_duvoux = cut(input$hcc_size, c(0, 3, 6, 11), c("≤3 cm (0 points)", "3 to 6 cm (1 point)", ">6 cm(4 points)"))
	afp_duvoux = cut(afp_iu()*1.21, c(-1, 100, 1000, 10000), 
									 c("≤100 ng/mL (0 points)", "100 to 1000 ng/mL (2 points)", ">1000 ng/mL (3 points)"), 
									 right=TRUE)
	hcc_n_duvoux1 = cut(input$hcc_n, c(0, 3, 11), c("0", "2"), right=TRUE)
	hcc_size_duvoux1 = cut(input$hcc_size, c(0, 3, 6, 11), c("0","1", "4"))
	afp_duvoux1 = cut(afp_iu()*1.21, c(-1, 100, 1000, 10000), 
										c("0", "2", "3"), 
										right=TRUE)
	invasion_duvoux = input$invasion
	mets_duvoux = input$mets
	components = paste0("Down-staging only | Number ", hcc_n_duvoux, " | Size ", hcc_size_duvoux, " | AFP ", afp_duvoux, " | Vascular invasion ", invasion_duvoux, 
											" | Extrahepatic ", mets_duvoux, " | No rupture + ≥6 months from down-staging treatment to imaging."
	)
	duvoux_hcc_score = as.numeric(as.character(hcc_n_duvoux1)) + as.numeric(as.character(hcc_size_duvoux1)) + 
		as.numeric(as.character(afp_duvoux1))
	duvoux_hcc = ifelse(invasion_duvoux == 1 | 
												mets_duvoux == 1, "Outwith",
											ifelse(duvoux_hcc_score >2, "Outwith", "Within"))
	return(list(duvoux_hcc, components, duvoux_hcc_score))
})
duvoux_hcc_status = reactive({
	ifelse(duvoux_hcc()[[1]] == "Outwith", "red", "green")
})

# HCC InfoBox ----
output$uk_hccBox <- renderInfoBox({
	infoBox(
		"UK HCC listing criteria", h1(uk_hcc()[[1]]), uk_hcc()[[2]], icon = icon("bar-chart"),
		color = uk_hcc_status(), fill=TRUE
	)
})

output$milan_hccBox <- renderInfoBox({
	infoBox(
		"Milan criteria (1996)", h1(milan_hcc()[[1]]), milan_hcc()[[2]], icon = icon("bar-chart"),
		color = milan_hcc_status(), fill=TRUE
	)
})

output$ucsf_hccBox <- renderInfoBox({
	infoBox(
		"UCSF criteria (2001)", h1(ucsf_hcc()[[1]]), ucsf_hcc()[[2]], icon = icon("bar-chart"),
		color = ucsf_hcc_status(), fill=TRUE
	)
})

output$duvoux_hccBox <- renderInfoBox({
	infoBox(
		"Duvoux Criteria", h1(paste0(duvoux_hcc()[[1]], " (", duvoux_hcc()[[3]], ")")), 
		duvoux_hcc()[[2]], icon = icon("bar-chart"),
		color = duvoux_hcc_status(), fill=TRUE
	)
})