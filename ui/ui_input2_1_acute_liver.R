wellPanel(
	h3("Acute liver failure"),
	
	# box(title = "Acute liver failure", width = NULL, status = "primary",
	# 		solidHeader = TRUE,
	
	selectInput("aet", label = "Aetiology", 
							choices = list("Paracetamol (cat 1-4)" = 1, "Favourable non-paracetamol (cat 5)" = 5, 
														 "Unfavourable non-paracetamol (cat 6)" = 6, "Wilson's/Budd-Chiari (cat 7)" = 7, 
														 "HAT ≤21 days (cat 8)" = 8, "Early dysfunction (cat 9)" = 9, 
														 "Total functional absence (cat 10)" = 10, 
														 "Living donor failure (cat 11)" = 11, 
														 "ALF in children (cat 20)" = 20), 
							selected =1, selectize = FALSE),
	
	conditionalPanel(
		condition = "input.aet == 1",
		selectInput(
			"ph", "pH >24 h after overdose",
			c("<7.25", ">=7.25"), selected = ">=7.25", selectize = FALSE)
	),
	
	conditionalPanel(
		condition = "input.aet == 5 || input.aet == 6",
		div(style="display: inline-block; vertical-align:top; width:79%;", 
				sliderInput("bil2", "Bilirubin", min = 5, max = 500, value = 15)),
		div(style="display:inline-block; vertical-align:top;width:20%; font-size:80%", 
				selectInput("bil_units2", label = NULL, 
										choices = list("umol/L" = 1, "mg/dL" = 2), 
										selected = 1, selectize = FALSE))
	),
	
	conditionalPanel(
		condition = "input.aet == 1",
		div(style="display: inline-block; vertical-align:top; width:79%;",
				sliderInput("creat2", "Creatinine", min = 40, max = 500, value = 80)),
		div(style="display:inline-block; vertical-align:top;width:20%; font-size:80%",
				selectInput("creat_units2", label = NULL,
										choices = list("umol/L" = 1, "mg/dL" = 2),
										selected = 1, selectize = FALSE))
	),
	
	conditionalPanel(
		condition = "input.aet == 1 || input.aet == 5  || input.aet == 6 ||
 																	 		input.aet == 7 || input.aet == 20",
		div(style="display: inline-block; vertical-align:top; width:79%;",
				sliderInput("inr2", "INR/PT", min = 0.8, max = 10, value = 1, step=0.1)),
		div(style="display:inline-block; vertical-align:top;width:20%; font-size:80%",
				selectInput("inr_units2", label = NULL,
										choices = list("IU" = 1, "PT (secs)" = 2),
										selected = 1, selectize = FALSE))
	),
	
	conditionalPanel(
		condition = "input.aet == 1 || input.aet == 5 || input.aet == 6 ||
 																	 		input.aet == 7 || input.aet == 20",
		
		selectInput("enceph2", label = "Encephalopathy",
								choices = list("None", "Grade 1-2", "Grade 3-4"),
								selected = 0, selectize = FALSE)
	),
	
	conditionalPanel(
		condition = "input.aet == 5 || input.aet == 6",
		
		selectInput("jaundicetime", label = "Jaundice to encephalopathy time",
								choices = list("<= 7 days", ">7 days"),
								selected = 0, selectize = FALSE)
	),
	
	conditionalPanel(
		condition = "input.aet == 5 || input.aet == 6",
		
		sliderInput("age2", label = "Age (years)", min = 12, max = 100, value = 60, step=1)
	),
	
	conditionalPanel(
		condition = "input.aet == 1",
		
		selectInput("lac", label = "Lactate (arterial): >5 mmol/L admission + >4 mmol/L 24 h later",
								choices = list("No", "Yes"),
								selected = "No", selectize = FALSE)
	),
	
	conditionalPanel(
		condition = "input.aet == 1",
		
		selectInput("det", label = "Clinical evidence of deterioration (O2 or inotropes + no sepsis)",
								choices = list("No", "Yes"),
								selected = "No", selectize = FALSE)
	),
	
	conditionalPanel(
		condition = "input.aet == 9",
		
		selectInput("ast", label = "AST >10 000 IU",
								choices = list("No", "Yes"),
								selected = "No", selectize = FALSE)
	),
	
	conditionalPanel(
		condition = "input.aet == 9",
		
		selectInput("bile", label = "Absence of bile production",
								choices = list("No", "Yes"),
								selected = "No", selectize = FALSE)
	),
	
	conditionalPanel(
		condition = "input.aet == 9",
		
		selectInput("lac2", label = "Lactate (serum): >3 mmol/L",
								choices = list("No", "Yes"),
								selected = "No", selectize = FALSE)
	),
	
	conditionalPanel(
		condition = "input.aet == 5"
	),
	
	conditionalPanel(
		condition = "input.aet == 6"
	),
	
	conditionalPanel(
		condition = "input.aet == 8"
	),
	
	conditionalPanel(
		condition = "input.aet == 10"
	),
	
	conditionalPanel(
		condition = "input.aet == 11"
	),
	
	conditionalPanel(
		condition = "input.aet == 20"
	)
)