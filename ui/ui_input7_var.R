fluidRow(
	column(width = 4,
				 box(
				 	title = "Variant syndromes", solidHeader = TRUE, status = "primary", width = 12,
				 	"A variant syndrome in patients whose UKELD score is <49"),
				 box(
				 	title = "Diuretic resistant ascites", status = "primary", width = 12,
				 	"Ascites unresponsive or intolerant of maximum diuretic dosage and non-responsive to
															TIPS or where TIPS deemed impossible or contraindicated."),
				 box(
				 	title = "Hepatopulmonary syndrome", status = "primary", width = 12,
				 	"Arterial pO2 <7.8, alveolar arterial oxygen gradient >20 mmHg, calculated shunt fraction >8%
															(brain uptake following TC macroaggregated albumen), pulmonary vascular dilatation
															documented by positive contrast enhanced transthoracic echo, in the absence of overt
															chronic lung disease."),
				 box(
				 	title = "Chronic hepatic encephalopathy", status = "primary", width = 12,
				 	"Confirmed by EEG or trail-making tests, at least 2 admissions in 1 year with encephalopathy, 
                              not manageable by standard therapy. Structural
															neurological disease excluded by imaging and, if necessary, psychometric testing."),
				 box(
				 	title = "Persistent and intractable pruritus", status = "primary", width = 12,
				 	"Pruritus consequent on cholestastic liver disease, which is intractable after therapeutic trials.
															Exclude psychiatric co-morbidity that might contribute to itch. Lethargy is not an
															accepted primary indication for transplantation."),
				 box(
				 	title = "Familial amyloidosis", status = "primary", width = 12,
				 	"Confirmed transthyretin gene mutation in the absence of significant debilitating cardiac
															involvement, or autonomic neuropathy.")
	),
	column(width = 4,
				 box(
				 	title = "Primary hyperlipidaemia", status = "primary", width = 12,
				 	"Homozygous familial hypercholesterolaemia, absent LDL receptor expression and LDL
															receptor gene mutation."),
				 box(
				 	title = "Polycystic liver disease", status = "primary", width = 12, 
				 	"Intractable symptoms due to mass of liver or pain unresponsive to cystectomy, or severe
															complications secondary to portal hypertension."),
				 box(
				 	title = "Recurrent cholangitis", status = "primary",  width = 12,
				 	"Recurrent significant cholangitis not responsive to medical, surgical or endoscopic therapy."),
				 box(
				 	title = "Hepatic epithelioid haemangioendothelioma", status = "primary", width = 12, 
				 	"Histological confirmation; not a single lesion amenable to resection; extra-hepatic spread
															confined to abdominal lymph nodes only."),
				 box(
				 	title = "Sickle cell hepatopathy", status = "primary",  width = 12,
				 	"Adult sickle cell hepatopathy, age <40 years; no evidence of sickle cell heart, lung or brain
															disease; compliance with prior therapies; review by specialised Multi-Disciplinary Team."),
				 box(
				 	title = "References", status = "info", width = 12,
				 	a(href="http://www.odt.nhs.uk/pdf/liver_selection_policy.pdf", "NHSBT 
																Selection Criteria and Recipient Registration", target="_blank"),
				 	footer = "© Scottish Liver Transplant Unit 2017-2018.
															The information in this app is provided as an information resource only, 
															and is not to be used alone for any diagnostic or treatment purpose.")
	)
)