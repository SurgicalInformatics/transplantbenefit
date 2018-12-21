wellPanel(
	h4("HCC"),
	sliderInput("hcc_n", label = "Number of tumours", min = 1, max = 10, value = 1, step=1),
	sliderInput("hcc_size", label = "Size of largest tumour (cm)", min = 0.5, max = 8, value = 1, 
							step=0.1),
	div(style="display: inline-block; vertical-align:top; width:79%;", 
			sliderInput("afp", "aFP", min = 0, max = 1500, value = 10, step=10)),
	div(style="display:inline-block; vertical-align:top; width:20%; font-size:80%", 
			selectInput("afp_units", label = NULL, 
									choices = list("IU/ml" = 1, "ng/mL" = 2), 
									selected = 1)),
	selectInput("invasion", label = "Vascular invasion", 
							choices = list("No" = 0, "Yes" = 1), 
							selected = 0, selectize = FALSE),
	selectInput("mets", label = "Extrahepatic disease", 
							choices = list("No" = 0, "Yes" = 1), 
							selected = 0, selectize = FALSE)
)