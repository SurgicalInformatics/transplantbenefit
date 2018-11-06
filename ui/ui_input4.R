# Donor
wellPanel(
	h4("Donor"),
sliderInput("dage_tbs", "Donor age (years)", value=52, min = 5, max = 90, step = 1,
						 width = NULL),
selectInput("dcause_tbs", label = "Cause of donor death", 
						choices = list(	"Intracranial bleed/thrombosis" = 1,
														"Trauma RTA" = 2,
														"Non-RTA trauma / suicide / accident" = 3,
														"Other" = 4),
						selected = 1, selectize=FALSE, width=NULL),
sliderInput("dbmi_tbs", "Donor BMI", value=25, min = 10, max = 50, step = 1,
						 width = NULL),
radioButtons("ddiabetes_tbs", label = "Donor diabetes", 
						 choices = list("No" = 1, "Yes" = 2, "Unknown" = 3),
						 selected = 1, width=NULL, inline=TRUE),
fluidRow(
	column(6,
				 radioButtons("dtype_tbs", label = "Donor", 
				 						 choices = list("DBD" = 0, "DCD" = 1),
				 						 selected = 0, width=NULL, inline=FALSE)),
	column(6, 
				 radioButtons("splittable_tbs", label = "Splittable", 
				 						 choices = list("No" = 0, "Yes" = 1),
				 						 selected = 0, width=NULL, inline=FALSE))
),
radioButtons("bloodgroup_compatible_tbs", label = "Blood group matched", 
						 choices = list("No" = 1, "Yes" = 0),
						 selected = 0, width=NULL, inline=TRUE)
)