box(title = "Transplant Benefit Score", status = "info", width=12, 
		collapsible = TRUE, collapsed = TRUE,
		
		p("This webapp allows the calculation of a number of tools used in liver transplantation. 
			Click the menu button above for options."),
		p("The Transplant Benefit Score (TBS) is a national set of rules used in the UK to offer 
			livers to named adult patients on the elective liver waiting list."),
		tags$ul(
			tags$li("Livers are offered nationally to named patient predicted to gain the most 
							survival benefit from receiving the particular liver graft on offer."),
			tags$li("Utility - Need = Transplant benefit"),
			tags$li("The benefit score is calculated by measuring the difference between the area 
							under the waiting list survival curve and the area under the post-transplant 
							survival curve over a 5-year interval."),
			tags$li("The information in this app is provided as an information resource only, 
							and is not to be used alone for any diagnostic or treatment purpose.")
		)
)
