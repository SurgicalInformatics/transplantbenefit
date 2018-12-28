# ALF scoring ----
## Slider adjust
inr = reactive({ ifelse(input$inr_units == "1", input$inr, input$inr/12) })
inr2 = reactive({ ifelse(input$inr_units2 == "1", input$inr2, input$inr2/12) })
inr_alf = reactive({
	if (input$inr_units2 == "1"){
		inr_alf = cut(inr2(), c(0, 3.5, 6.5, 20), c("<=3.5 IU", "3.5-6.5 IU", ">6.5 IU"))
	} else if (input$inr_units2 == "2") {
		inr_alf = cut(inr2()*12, c(0, 50, 100, 200), c("<=50 secs", "50-100 secs", ">100 secs"))
	}
	return(inr_alf)
})

creat_umol = reactive({ ifelse(input$creat_units == "1", input$creat, input$creat*88.42) })
creat_umol2 = reactive({ ifelse(input$creat_units2 == "1", input$creat2, input$creat2*88.42) })

bil_umol = reactive({ ifelse(input$bil_units == "1", input$bil, input$bil*17.1) })
bil_umol2 = reactive({ ifelse(input$bil_units2 == "1", input$bil2, input$bil2*17.1) })


uk_alf <- reactive({
	if (input$aet == 1){
		ph = input$ph
		
		inr_comp = ifelse(input$inr_units2 == "1", paste0(" | INR ", inr_alf()), paste0(" | PT ", inr_alf()))
		creat = cut(creat_umol2(), c(-1, 300, 1000), c("<=300 umol/L", ">300 umol/L"))
		
		cat4_inr = ifelse(
			((input$inr_units2 == "1" & inr_alf() == ">6.5 IU") | 
			 	(input$inr_units2 == "2" & inr_alf() == ">100 secs")), 1, 0)
		cat4_creat = ifelse(
			creat == ">300 umol/L", 1, 0)
		cat4_enceph = ifelse(
			input$enceph2 == "Grade 3-4", 1, 0) 
		components = paste0("pH >24 h after overdose ", ph, inr_comp, " | Creatinine ", creat, " | Encephalopathy ", input$enceph2,
												" | Lactate criterion: ", input$lac, " | Deterioration: ", input$det)
		uk_alf = ifelse(ph == "<7.25", "Indicated (cat 1)", 
										ifelse(
											((input$inr_units2 == "1" & inr_alf() == ">6.5 IU") | 
											 	(input$inr_units2 == "2" & inr_alf() == ">100 secs")) & 
												creat == ">300 umol/L" &
												input$enceph2 == "Grade 3-4",  "Indicated (cat 2)", 
											ifelse(input$lac == "Yes" & 
														 	(input$enceph2 == "Grade 1-2" | input$enceph2 == "Grade 3-4"), "Indicated (cat 3)", 
														 ifelse((cat4_inr + cat4_creat + cat4_enceph > 1) &
														 			 	input$det == "Yes", "Indicated (cat 4)", "Not indicated"))))
		return(list(uk_alf, components))
	}
	if (input$aet == 5){
		inr_comp = ifelse(input$inr_units2 == "1", paste0(" | INR ", inr_alf()), paste0(" | PT ", inr_alf()))
		age2 = cut(input$age2, c(0, 9, 40, 100), c("<10 years", "10-40 years", ">40 years"))
		bil2 = cut(bil_umol2(), c(0, 300, 1000), c("<=300 umol/L", ">300 umol/L"))
		
		cat5_inr = 	ifelse(
			(input$inr_units2 == "1" & 
			 	(inr_alf() == "3.5-6.5 IU" | inr_alf() == ">6.5 IU")) |
				(input$inr_units2 == "2" & 
				 	(inr_alf() == "50-100 secs" | inr_alf() == ">100 secs")), 1, 0)
		cat5_age2 = ifelse(age2 == "<10 years" | age2 == ">40 years", 1, 0)
		cat5_jaundicetime = ifelse(input$jaundicetime == ">7 days", 1, 0)
		cat5_bil2 = ifelse(bil2 == ">300 umol/L", 1, 0)
		
		components = paste0("Encephalopathy ", input$enceph2, inr_comp, " | Age ", age2, 
												" | Jaundice to encephalopathy time criteria: ", input$jaudicetime, 
												"Serum bilirubin: ", bil2)
		uk_alf = ifelse(
			(input$enceph2 == "Grade 1-2" | input$enceph2 == "Grade 3-4") &
				((input$inr_units2 == "1" & inr_alf() == ">6.5 IU") | 
				 	(input$inr_units2 == "2" & inr_alf() == ">100 secs")), "Indicated (cat 5)",
			ifelse(
				(input$enceph2 == "Grade 1-2" | input$enceph2 == "Grade 3-4") &
					(cat5_inr + cat5_age2 +  cat5_jaundicetime + cat5_bil2) > 2, "Indicated (cat 5)",
				"Not indicated"))
		return(list(uk_alf, components))
	}
	if (input$aet == 6){
		inr_comp = ifelse(input$inr_units2 == "1", paste0(" | INR ", inr_alf()), paste0(" | PT ", inr_alf()))
		age2 = cut(input$age2, c(0, 9, 40, 100), c("<10 years", "10-40 years", ">40 years"))
		bil2 = cut(bil_umol2(), c(0, 300, 1000), c("<=300 umol/L", ">300 umol/L"))
		
		cat6_inr = 	ifelse(
			(input$inr_units2 == "1" & 
			 	(inr_alf() == "3.5-6.5 IU" | inr_alf() == ">6.5 IU")) |
				(input$inr_units2 == "2" & 
				 	(inr_alf() == "50-100 secs" | inr_alf() == ">100 secs")), 1, 0)
		cat6_age2 = ifelse(age2 == "<10 years" | age2 == ">40 years", 1, 0)
		cat6_jaundicetime = ifelse(input$jaundicetime == ">7 days", 1, 0)
		cat6_bil2 = ifelse(bil2 == ">300 umol/L", 1, 0)
		
		components = paste0("Encephalopathy ", input$enceph2, inr_comp, " | Age ", age2, 
												" | Jaundice to encephalopathy time criteria: ", input$jaudicetime, 
												"Serum bilirubin: ", bil2)
		uk_alf = ifelse(
			((input$inr_units2 == "1" & inr_alf() == ">6.5 IU") | 
			 	(input$inr_units2 == "2" & inr_alf() == ">100 secs")), "Indicated (cat 6)",
			ifelse(
				inr2() > 2 &
					(cat6_age2 + cat6_inr + cat6_jaundicetime + cat6_bil2) >1, "Indicated (cat 6)", "Not indicated"))
		return(list(uk_alf, components))
	}
	if (input$aet == 7){
		inr_comp = ifelse(input$inr_units2 == "1", paste0(" | INR ", inr_alf()), paste0(" | PT ", inr_alf()))
		components = paste0("Encephalopathy ", input$enceph2, inr_comp)
		uk_alf = ifelse(
			((input$inr_units2 == "1" & 
					(inr_alf() == "3.5-6.5 IU" | inr_alf() == ">6.5 IU")) |
			 	(input$inr_units2 == "2" & 
			 	 	(inr_alf() == "50-100 secs" | inr_alf() == ">100 secs"))) & 
				(input$enceph2 == "Grade 1-2" | input$enceph2 == "Grade 3-4"), "Indicated (cat 7)", "Not indicated")
		return(list(uk_alf, components))
	}
	if (input$aet == 8){
		components = "HAT ≤21 days: Yes"
		uk_alf = "Indicated (cat 8)"
		return(list(uk_alf, components))
	}
	if (input$aet == 9){
		components = paste0("AST criterion: ", input$ast, " | Lactate criterion: ", input$lac2, " | Absence of bile criterion: ", input$bile)
		cat9_lac = ifelse(input$lac2 == "Yes", 1, 0)
		cat9_ast = ifelse(input$ast == "Yes", 1, 0)
		cat9_bile = ifelse(input$bile == "Yes", 1, 0)
		
		uk_alf = ifelse(cat9_lac + cat9_ast + cat9_bile > 1,  "Indicated (cat 9)", "Not indicated")
		return(list(uk_alf, components))
	}
	if (input$aet == 10){
		components = "Total functional absence: Yes"
		uk_alf = "Indicated (cat 10)"
		return(list(uk_alf, components))
	}
	if (input$aet == 11){
		components = "Living donor failure: Yes"
		uk_alf = "Indicated (cat 11)"
		return(list(uk_alf, components))
	}
	if (input$aet == 20){
		inr = cut(inr2(), c(0, 4, 20), c("<=4 IU", ">4 IU"))
		components = paste0("INR ", inr, " | Encephalopathy ", input$enceph2)
		uk_alf = ifelse(
			inr == ">4 IU" | input$enceph2 == "Grade 3-4", "Indicated (cat 20)", "Not indicated")
		return(list(uk_alf, components))
	}
})

uk_alf_status = reactive({
	ifelse(uk_alf()[[1]] == "Not indicated", "green", "red")
})

# ALF InfoBox ----
output$uk_alfBox <- renderInfoBox({
	infoBox(
		"UK Super-urgent listing", h1(uk_alf()[[1]]), 
		uk_alf()[[2]], icon = icon("bar-chart"),
		color = uk_alf_status(), fill=TRUE
	)
})


