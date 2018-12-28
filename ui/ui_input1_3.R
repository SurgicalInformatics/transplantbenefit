# Cancer only need to be conditional
conditionalPanel(
	condition = "input.rdisease_primary_tbs == 1 || 
	input.rdisease_secondary_tbs == 1 ||
	input.rdisease_tertiary_tbs == 1",
	wellPanel(
		h4("Cancer"),
		sliderInput("rmax_afp_tbs", label = "aFP maximum", value=5, min = 0, max = 1000, step = 1,
								 width = NULL),
		selectInput("rtumour_number_tbs", label = "Number of tumours", 
								choices = list("One tumour" = 1, 
															 "Two tumours" = 2,
															 "Three or more tumours" = 3),
								selected = 1, selectize=FALSE, width=NULL),
		sliderInput("rmax_tumour_size_tbs", label = "Maximum tumour size (cm)", value=1, 
								 min = 0, max = 9, step = 0.1,
								 width = NULL)
	))
