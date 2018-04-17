source("load_data.R")

# Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in emissions 
# from 1999-2008 for Baltimore City? Which have seen increases in emissions from 
# 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
library(dplyr)

baltimore <- subset(NEI, fips == "24510")
byyear <- summarise(group_by(baltimore, type, year), Emissions = sum(Emissions))

ggplot(byyear, aes(x = factor(year), y = Emissions, fill = type)) + 
  geom_bar(stat="identity") + 
  facet_grid(.~type) + 
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions in Tons")) +
  ggtitle(expression("Total PM"[2.5]*" Emissions in Baltimore City by Various Source Types")) +
  theme(plot.title = element_text(size = 11, face="bold"), 
        axis.title = element_text(size = 10, face="bold"),
        axis.text.x = element_text(size = 5))

dev.copy(png, "plot3.png")
dev.off()