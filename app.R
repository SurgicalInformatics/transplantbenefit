#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
	
	titlePanel(h1("Transplant benefit score"), "Transplant benefit score"),
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
		column(6,
					 #source(file.path("ui", "ui_output1.R"))$value
					 textOutput("m1"),
					 textOutput("m2"),
					 textOutput("tbs"),
					 dataTableOutput("x1")
		)
	)
)

# Server
server <- function(input, output, session) {
	
	# Include the logic (server) for each tab
	source(file.path("server", "server1.R"),  local = TRUE)$value
}

# Run the application 
shinyApp(ui = ui, server = server)
