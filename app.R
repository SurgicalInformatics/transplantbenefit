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
	
	title = "Transplant benefit score",
	skin="black",
	dashboardHeader(title = "Transplant benefit score explorer",
									titleWidth = 500),
	dashboardSidebar(disable = TRUE),
	dashboardBody(
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
			column(2,
						 wellPanel(
						 	tags$h4("Reset"),
						 	actionButton("reset_all", "All"),
						 	actionButton("rreset", "Recipient"),
						 	actionButton("dreset", "Donor"),
						 	tags$h4("Recipient"),
						 	actionButton("rhighrisk", "High risk"),
						 	actionButton("rveryhighrisk", "Very high risk"),
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
					
						 )

			),
			column(2,
						 infoBoxOutput("m1Box", width=12),
						 infoBoxOutput("m2Box", width=12),
						 infoBoxOutput("tbsBox", width=12),
						 infoBoxOutput("ukeldBox", width=12)
						 ),
			column(2,
						 plotOutput("hist_m1", height=200),
						 plotOutput("hist_m2", height=200),
						 plotOutput("hist_tbs", height=200)
			)
		),
		fluidRow(
			column(12,
						 DT::dataTableOutput("x1"))
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
}

# Run the application 
shinyApp(ui = ui, server = server)
