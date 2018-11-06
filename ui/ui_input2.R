wellPanel(
	h4("Recipient UKELD"),
	sliderInput("rbilirubin_tbs", "Bilirubin (umol/L)", value=20, min = 10, max = 500, step = 1,
							width = NULL),
	sliderInput("rinr_tbs", "INR", value=1.0, min = 0.4, max = 10, step = 0.1,
							width = NULL),
	sliderInput("rcreatinine_tbs", "Serum creatinine (umol/L)", 
							value=70, min = 5, max = 800, step = 1,
							width = NULL),
	radioButtons("rrenal_tbs", label = "Renal replacement therapy", 
							 choices = list("No" = 0, "Yes" = 1),
							 selected = 0, width=NULL, inline=TRUE),
	sliderInput("rsodium_tbs", "Sodium", value=135, min = 115, max = 155, step = 1,
							width = NULL),
	sliderInput("rpotassium_tbs", "Potassium", value=4.5, min = 2.0, max = 10, step = 0.1,
							width = NULL),
	sliderInput("ralbumin_tbs", "Albumin", value=30, min = 5, max = 60, step = 1,
							width = NULL),
	fluidRow(
		column(6,
					 radioButtons("rencephalopathy_tbs", label = "Enceph", 
					 						 choices = list("No" = 0, "Yes" = 1),
					 						 selected = 0, width=NULL, inline=F)
		),
		column(6,
					 radioButtons("rascites_tbs", label = "Ascites", 
					 						 choices = list("No" = 0, "Yes" = 1),
					 						 selected = 0, width=NULL, inline=F))
	),
	
	radioButtons("rdiabetes_tbs", label = "Diabetes", 
							 choices = list("No" = 0, "Yes" = 1),
							 selected = 0, width=NULL, inline=TRUE)
	
)
