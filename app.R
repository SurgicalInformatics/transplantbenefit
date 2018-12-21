#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(dplyr)

# Define UI for application that draws a histogram
ui <- dashboardPage(
	
	title = "Edinburgh liver app",
	skin="black",
	dashboardHeader(
		tags$li(class = "dropdown", # Hack to get this to work, not sure why needed. 
						tags$head(tags$link(rel="shortcut icon", href="https://argonaut.is.ed.ac.uk/public/favicon.ico"),
											tags$script(type="text/javascript", src="retina.js"))),
		title = HTML("<a href = 'http://liverapp.org'>
									<img src='https://argonaut.is.ed.ac.uk/public/elapp_logo.png' data-rjs = 'https://argonaut.is.ed.ac.uk/public/elapp_logo@2x.png' />
										</a>"
		),
		
		titleWidth = 320
	),
	
	dashboardSidebar(disable = FALSE, collapsed = TRUE,
									 sidebarMenu(
									 	menuItem("Transplant benefit score", tabName = "tbs"),
									 	menuItem("Acute liver failure", tabName = "acute_liver"),
									 	menuItem("HCC", tabName = "hcc"),
									 	menuItem("Variant syndromes", tabName = "variants"))
	),
	dashboardBody(
		tabItems(
			tabItem("tbs",
							fluidRow(
								# Input
								column(2,
											 source(file.path("ui", "ui_input1.R"))$value
								),
								column(2,
											 source(file.path("ui", "ui_input2.R"))$value
								),
								column(2,
											 source(file.path("ui", "ui_input3.R"))$value,
											 source(file.path("ui", "ui_input4.R"))$value
								),
								column(3,
											 wellPanel(
											 	tags$h4("Reset"),
											 	actionButton("reset_all", "All"),
											 	actionButton("rreset", "Recipient"),
											 	actionButton("dreset", "Donor"),
											 	tags$h4("Recipient"),
											 	actionButton("rmodrisk", "Mod risk"),
											 	actionButton("rhighrisk", "High risk"),
											 	actionButton("rveryhighrisk", "V high risk"),
											 	actionButton("rcancer", "HCC early"),
											 	actionButton("rcancerclose", "HCC at criteria"),
											 	tags$h4("Donor"),
											 	actionButton("dlowrisk", "DBD good"),
											 	actionButton("dmodrisk", "DBD moderate"),
											 	actionButton("dmarginal", "DBD marginal"),
											 	actionButton("ddcdgood", "DCD good"),
											 	actionButton("ddcdmarginal", "DCD marginal"),
											 	tags$h4("Change over time (keep clicking)"),
											 	actionButton("decompensate", "Decompensate (click 1 mth)"),
											 	actionButton("stable_on_list", "Stable on list (click 6 mths)"),
											 	actionButton("cancer_growing", "HCC grows (click 2 mm/mth)")
											 ),
											 infoBoxOutput("m1Box", width=12),
											 infoBoxOutput("m2Box", width=12),
											 infoBoxOutput("tbsBox", width=12)
											 
								),
								column(3,
											 infoBoxOutput("ukeldBox", width=12),
											 infoBoxOutput("meldBox", width=12),
											 infoBoxOutput("meldnaBox", width=12),
											 box(title = "References", status = "info", width=12,
											 		a(href="http://www.ncbi.nlm.nih.gov/pubmed/10733541", "MELD", target="_blank"),br(),
											 		a(href="http://www.ncbi.nlm.nih.gov/pubmed/17895356", "UKELD", target="_blank"),br(),
											 		a(href="http://www.ncbi.nlm.nih.gov/pubmed/18768945", "MELD-Na", target="_blank"),br(),
											 		#a(href="https://www.ncbi.nlm.nih.gov/pubmed/16382473", "CTP", target="_blank"),br(),
											 		#a(href="https://www.ncbi.nlm.nih.gov/pubmed/16382473", "Modified CTP", target="_blank"),
											 		footer = "© Scottish Liver Transplant Unit 2017-2018.
																	 		The information in this app is provided as an information resource only, 
																	 		and is not to be used alone for any diagnostic or treatment purpose."
											 )
											 
											 # box(
											 # 	plotOutput("hist_m1", height=200),
											 # 	plotOutput("hist_m2", height=200),
											 # 	plotOutput("hist_tbs", height=200), 
											 # 	title = "Population comparison",
											 # 	width=12,
											 # 	collapsible = TRUE)
								)
							),
							fluidRow(
								column(12,
											 checkboxInput("data_table", label = "Show data table", FALSE),
											 conditionalPanel(
											 	condition = 'input.data_table == true',
											 	DT::dataTableOutput("x1"))
								)
							)
			),
			tabItem("acute_liver",
							fluidRow(
								column(width = 4,
											 source(file.path("ui", "ui_input5_acute_liver.R"))$value
								),
								column(width = 8,
											 infoBoxOutput("uk_alfBox", width=6)
								)
							)
			), 
			tabItem("hcc", 
							fluidRow(
								column(width = 4,
											 source(file.path("ui", "ui_input6_hcc.R"))$value
								),
								column(width = 4,
											 infoBoxOutput("uk_hccBox", width=12),
											 infoBoxOutput("milan_hccBox", width=12)
								),
								column(width = 4,
											 infoBoxOutput("ucsf_hccBox", width=12),
											 infoBoxOutput("duvoux_hccBox", width=12)
								)
							)
			),
			tabItem("variants",
							source(file.path("ui", "ui_input7_var.R"))$value

			)
		)
	)
)


# Server
server <- function(input, output, session) {
	
	# Include the logic (server) for each tab
	source(file.path("server", "server0_fn.R"),  local = TRUE)$value
	source(file.path("server", "server1.R"),  local = TRUE)$value
	source(file.path("server", "server2.R"),  local = TRUE)$value
	source(file.path("server", "server3.R"),  local = TRUE)$value
	source(file.path("server", "server4.R"),  local = TRUE)$value
	source(file.path("server", "server5_alf.R"),  local = TRUE)$value
	source(file.path("server", "server6_hcc.R"),  local = TRUE)$value
}

# Run the application 
shinyApp(ui = ui, server = server)
