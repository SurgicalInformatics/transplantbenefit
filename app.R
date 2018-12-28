# Liverapp.org
# Ewen Harrison
# November 2018
# 

library(shiny)
library(shinydashboard)
library(dplyr)

# Define UI
ui <- dashboardPage(
	
	title = "Edinburgh liver app",
	skin="black",
	dashboardHeader(
		tags$li(class = "dropdown", # Hack to get this to work. 
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
			# Transplant benefit score ----
			tabItem("tbs",
							fluidRow(
								# Input
								column(2,
											 source(file.path("ui", "ui_input1_1.R"))$value
								),
								column(2,
											 source(file.path("ui", "ui_input1_2.R"))$value
								),
								column(2,
											 source(file.path("ui", "ui_input1_3.R"))$value,
											 source(file.path("ui", "ui_input1_4.R"))$value
								),
								column(3,
											 fluidRow(
											 	infoBoxOutput("tbsBox", width=12),
											 	infoBoxOutput("m1Box", width=12),
											 	infoBoxOutput("m2Box", width=12)
											 ),
											 source(file.path("ui", "ui_input1_5.R"))$value
											 
								),
								column(3,
											 infoBoxOutput("ukeldBox", width=12),
											 infoBoxOutput("meldBox", width=12),
											 infoBoxOutput("meldnaBox", width=12),
											 source(file.path("ui", "ui_1_6_selection_criteria.R"))$value,
											 source(file.path("ui", "ui_1_7_cld_criteria.R"))$value,
											 source(file.path("ui", "ui_footnote.R"))$value
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
			
			# Acute liver failure ----
			tabItem("acute_liver",
							fluidRow(
								column(width = 4,
											 source(file.path("ui", "ui_input2_1_acute_liver.R"))$value
								),
								column(width = 4,
											 infoBoxOutput("uk_alfBox", width=12)
								),
								column(width = 4,
											 source(file.path("ui", "ui2_2_ald_criteria.R"))$value,
											 source(file.path("ui", "ui_footnote.R"))$value
								)
							)
			),
			
			# Hepatocellular carcinoma ----
			tabItem("hcc", 
							fluidRow(
								column(width = 4,
											 source(file.path("ui", "ui_input3_1_hcc.R"))$value
								),
								column(width = 4,
											 infoBoxOutput("uk_hccBox", width=12),
											 infoBoxOutput("milan_hccBox", width=12),
											 infoBoxOutput("ucsf_hccBox", width=12)
								),
								column(width = 4,
											 infoBoxOutput("duvoux_hccBox", width=12),
											 source(file.path("ui", "ui_hcc_criteria.R"))$value,
											 source(file.path("ui", "ui_footnote.R"))$value
								)
							)
			),
			
			# Variant syndromes ----
			tabItem("variants",
							source(file.path("ui", "ui_input4_1_var.R"))$value
							
			)
		)
	)
)

# Server
server <- function(input, output, session) {
	
	# Include the logic (server) for each tab
	source(file.path("server", "server0_fn.R"),  local = TRUE)$value
	# TBS server ----
	source(file.path("server", "server1_1.R"),  local = TRUE)$value
	source(file.path("server", "server1_2.R"),  local = TRUE)$value
	source(file.path("server", "server1_3.R"),  local = TRUE)$value
	# source(file.path("server", "server1_4.R"),  local = TRUE)$value
	# ALF server ----
	source(file.path("server", "server2_1_alf.R"),  local = TRUE)$value
	# HCC server ----
	source(file.path("server", "server3_1_hcc.R"),  local = TRUE)$value
	# Variant server ----
	# Intentionally none. 
}

# Run the application 
shinyApp(ui = ui, server = server)
