fluidRow(
	column(width = 4,
				 box(
				 	title = "Variant syndromes", solidHeader = TRUE, status = "primary", width = 12,
				 	"UKELD score must be <49:"),
				 box(
				 	title = "Hepatopulmonary syndrome", status = "primary", width = 12,
				 	"Arterial pO2 <7.8, alveolar arterial oxygen gradient >20 mmHg, calculated shunt fraction >8%
							(brain uptake following TC macroaggregated albumen), pulmonary vascular dilatation
								documented by positive contrast enhanced transthoracic echo, in the absence of overt
								chronic lung disease "),
				 box(
				 	title = "Persistent and intractable pruritus", status = "primary", width = 12,
				 	"Pruritus consequent on cholestastic liver disease, which is intractable after therapeutic trials.
				 	Exclude psychiatric co-morbidity that might contribute to the itch. Lethargy is not an 
				 	accepted primary indication for orthotopic liver transplantation."),
				 box(
				 	title = "Recurrent cholangitis", status = "primary",  width = 12,
				 	"Recurrent significant cholangitis not responsive to medical, surgical or endoscopic therapy.")
	),
	column(width = 4,
				 box(
				 	title = "Variant syndromes", solidHeader = TRUE, status = "primary", width = 12,
				 	"UKELD score can be greater than 49:"),
				 box(
				 	title = "Familial amyloidosis", status = "primary", width = 12,
				 	"Confirmed transthyretin gene mutation in the absence of significant debilitating cardiac
							involvement, or autonomic neuropathy."),
				 box(
				 	title = "Primary hyperlipidaemia", status = "primary", width = 12,
				 	"Homozygous familial hypercholesterolaemia."),
				 box(
				 	title = "Polycystic liver disease", status = "primary", width = 12, 
				 	"Intractable symptom due to mass of liver or pain unresponsive to cystectomy, or severe
							complications secondary to portal hypertension."),
				 
				 box(
				 	title = "Hepatic epithelioid haemangioendothelioma", status = "primary", width = 12, 
				 	"Considered for listing for transplantation with:",
				 	tags$ol(
				 		tags$li("Histological confirmation"),
				 		tags$li("Two or more lesions not amenable to resection"),
				 		tags$li("Local, low volume lymph node involvement does not necessarily preclude transplantation"),
				 		tags$li("Minimum observation period of three months")
				 	)
				 ),
				 
				 box(
				 	title = "Nodular regenerative hyperplasia", status = "primary", width = 12, 
				 	"Indications similar to end-stage cirrhotic liver disease:",
				 	tags$ul(
				 		tags$li("Hereditary haemorrhagic telangiectasia"),
				 		tags$li("Glycogen storage disease"),
				 		tags$li("Primary hyperoxaluria"),
				 		tags$li("Ornithine transcarbamylase deficiency"),
				 		tags$li("Maple syrup urine disease"),
				 		tags$li("Porphyria"),
				 		tags$li("Amyloidosis – other")
				 	)
				 )
	),
	column(width = 4,
				 box(
				 	title = "Variant syndrome in context of chronic liver disease", 
				 	solidHeader = TRUE, status = "primary", width = 12,
				 	"Patients with diuretic resistant ascites and/or chronic hepatic encephalopathy, 
				 	for whom their UKELD score at registration may be <49. 
				 	These cases will be registered under the chronic liver disease criterion
				 	in the elective liver patient registration form."
				 ),
				 box(
				 	title = "Diretic resistant ascites", status = "primary", width = 12, 
				 	"Ascites unresponsive to or intolerant of maximum diuretic dosage 
				 		and nonresponsive to TIPS or where TIPS deemed impossible or contraindicated."
				 ),
				 box(
				 	title = "Chronic hepatic encephalopathy", status = "primary", width = 12, 
				 	"Confirmed by EEG or trail-making tests, with at least two admissions in one
				 	year due to exacerbations in encephalopathy, not manageable by standard therapy.
				 	Structural neurological disease must be excluded by appropriate imaging and, if
				 	necessary, psychometric testing."),
				 
				 source(file.path("ui", "ui_footnote.R"))$value
	)
)
