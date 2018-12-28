box(title = "ALD selection criteria", status = "info", width=12, 
		conditionalPanel(
			condition = "input.aet == 1",
			h4("Category 1"),
			tags$ul(
				tags$li("Aetiology: Paracetamol poisoning:"), 
				tags$ul(
					tags$li("pH <7.25 more than 24 hours after overdose and after fluid
								resuscitation.")
				)
			),
			h4("Category 2"),
			tags$ul(
				tags$li("Aetiology: Paracetamol poisoning: Co-existing:"),
				tags$ul(
					tags$li("Prothrombin time >100 seconds or INR >6.5, AND"),
					tags$li("Serum creatinine >300 μmol/l or anuria, AND"),
					tags$li("Grade 3–4 encephalopathy")
				)
			),
			h4("Category 3"),
			tags$ul(
				tags$li("Aetiology: Paracetamol poisoning:"),
				tags$ul(
					tags$li("Significant liver injury and coagulopathy following exclusion
			of other causes of hyperlactatemia (e.g. pancreatitis, intestinal ischemia) after adequate fluid
			resuscitation."),
					tags$li("Arterial lactate >5 mmol/l on admission, AND"),
					tags$li("Arterial lactate >4 mmol/l 24 hours later, AND"),
					tags$li("Presence of clinical hepatic encephalopathy.")
				)
			),
			h4("Category 4"),
			tags$ul(
				tags$li("Aetiology: Paracetamol poisoning: Two of the following three criteria (category 2) AND clinical
			evidence of deterioration (e.g. increased ICP, FiO2 >50%, increasing inotrope requirements) in
			the ABSENCE of clinical sepsis."),
				tags$ul(
					tags$li("Prothrombin time >100 seconds or INR >6.5, AND"),
					tags$li("Serum creatinine >300 μmol/l or anuria, AND"),
					tags$li("Grade 3–4 encephalopathy")
				)
			)
		),
		conditionalPanel(
			condition = "input.aet == 5",
			h4("Category 5"),
			tags$ul(
				tags$li("Aetiology: Favourable non-paracetamol aetiologies such as acute viral hepatitis or 
				ecstasy/cocaine induced ALF:"), 
				tags$ul(
					tags$li("Clinical hepatic encephalopathy is mandatory AND"),
					tags$li("Prothrombin time >100 seconds, or INR >6.5, OR"),
					tags$li("Any three from the following:"),
					tags$ul(
						tags$li("Age >40 or <10 years"),
						tags$li("Prothrombin time >50 seconds or INR >3.5"),
						tags$li("Any grade of hepatic encephalopathy 
								with jaundice to encephalopathy time >7 days"),
						tags$li("Serum bilirubin >300 μmol/l.")
					)
				)
			)
		),
		conditionalPanel(
			condition = "input.aet == 6",
			h4("Category 6"),
			tags$ul(
				tags$li("Aetiology: Unfavourable non-paracetamol aetiologies such as seronegative or idiosyncratic drug
					reactions:"), 
				tags$ul(
					tags$li("Prothrombin time >100 seconds, or INR >6.5, OR"),
					tags$li("In the absence of clinical hepatic encephalopathy:"),
					tags$ul(
						tags$li("INR >2 after vitamin K repletion is mandatory AND any two from:"),
						tags$ul(
							tags$li("Age >40 or <10 years"),
							tags$li("Prothrombin time >50 seconds or INR >3.5"),
							tags$li("If hepatic encephalopathy is present then jaundice to encephalopathy time >7 days"),
							tags$li("Serum bilirubin >300 μmol/l.")
						)
					)
				)
			)
		),
		conditionalPanel(
			condition = "input.aet == 7",
			h4("Category 7"),
			tags$ul(
				tags$li("Aetiology: Acute presentation of Wilson’s disease, or Budd-Chiari syndrome."),
				tags$ul(
					tags$li("A combination of coagulopathy, and any grade of encephalopathy.")
				)
			)
		),
		conditionalPanel(
			condition = "input.aet == 8",
			h4("Category 8"),
			tags$ul(
				tags$li("Hepatic artery thrombosis on days 0 to 21 after liver transplantation")
			)
		),
		conditionalPanel(
			condition = "input.aet == 9",
			h4("Category 9"),
			tags$ul(
				tags$li("Early graft dysfunction on days 0 to 7 after liver transplantation with at least two of the following:"),
				tags$ul(
					tags$li("AST >10,000"),
					tags$li("INR >3.0"),
					tags$li("Arterial lactate >3 mmol/l"),
					tags$li("Absence of bile production")
				)
			)
		),
		conditionalPanel(
			condition = "input.aet == 10",
			h4("Category 10"),
			tags$ul(
				tags$li("The total absence of liver function (e.g. after total hepatectomy)")
			)
		),
		conditionalPanel(
			condition = "input.aet == 11",
			h4("Category 11"),
			tags$ul(
				tags$li("Any patient who has been a live liver donor (NHS entitled) who develops severe liver failure
		within 4 weeks of the donor operation")
			)
		),
		conditionalPanel(
			condition = "input.aet == 20",
			h4("Category 20"),
			tags$ul(
				tags$li("Acute liver failure in children under two years of age:"),
				tags$ul(
					tags$li("INR >4 OR"),
					tags$li("Grade 3-4 encephalopathy.")
				)
			)
		)
)
