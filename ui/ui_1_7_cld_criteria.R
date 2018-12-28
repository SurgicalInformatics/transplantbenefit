box(title = "Selection criteria for chronic liver disease", status = "info", width=12, 
		collapsible = TRUE, collapsed = TRUE,
		p("Patients can be selected if they fulfil one of the following criteria:"),
		tags$ul(
			tags$li("Projected 1-year liver disease mortality without transplantation of >9%, predicted by a
							United Kingdom Model for End-Stage Liver Disease (UKELD) score of ≥49. The UKELD
							score is derived from the patient’s serum sodium, creatinine and bilirubin and International
							Normalised Ratio (INR) of the prothrombin time."),
			tags$li("Patients with porto-pulmonary hypertension (mean PAP >25 mmHg, <50 mmHg; PVR >120
							dynes/s/cm-5; PCWP <15 mmHg) should have had a clinically significant response to one of
							long-acting prostacyclin (or analogues), sildenafil, or bosentan.")
		)
)
