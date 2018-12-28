library(ggplot2)
# Example histogram against a distribution
theme_set(theme_bw(14))
set.seed(1)
tbs_df = data.frame(
	M1 = rnorm(100, mean = 2000, sd = 1000),
	M2 = rnorm(100, mean = 2000, sd = 1000),
	TBS = rnorm(100, mean = 1000, sd = 500)
)
output$hist_m1 <- renderPlot({
	g1<-ggplot()+
		geom_density(data=tbs_df, aes(x = M1))+
		geom_vline(xintercept = m1(), colour = "orange", size=2)+
		scale_y_continuous(breaks=NULL)+
		annotate("text", x = 2000, y = 0.00008, label = "Need (M1)", 
						 hjust=0.5, size = 7)+
		theme(rect=element_blank(),
					panel.grid = element_blank(),
					panel.background= element_blank(),
					plot.background = element_blank()
		)
	print(g1)
}, bg="transparent")

output$hist_m2 <- renderPlot({
	g1<-ggplot()+
		geom_density(data=tbs_df, aes(x = M2))+
		geom_vline(xintercept = m2(), colour = "orange", size=2)+
		scale_y_continuous(breaks=NULL)+
		annotate("text", x = 2000, y = 0.00008, label = "Utility (M2)", 
						 hjust=0.5, size = 7)+
		theme(rect=element_blank(),
					panel.grid = element_blank(),
					panel.background= element_blank(),
					plot.background = element_blank()
		)
	print(g1)
}, bg="transparent")

output$hist_tbs <- renderPlot({
	g1<-ggplot()+
		geom_density(data=tbs_df, aes(x = TBS))+
		geom_vline(xintercept = tbs(), colour = "orange", size=2)+
		scale_y_continuous(breaks=NULL)+
		annotate("text", x = 1000, y = 0.00008, label = "TBS", 
						 hjust=0.5, size = 7)+
		theme(rect=element_blank(),
					panel.grid = element_blank(),
					panel.background= element_blank(),
					plot.background = element_blank()
		)
	print(g1)
}, bg="transparent")
