source("load_data.R")

# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has seen greater changes over time in motor 
# vehicle emissions?

library(dplyr)
library(ggplot2)

baltimore.emissions.motor <- subset(NEI, (fips == "24510" & type == "ON-ROAD"))
LA.emissions.motor <- subset(NEI, (fips == "06037" & type == "ON-ROAD"))
baltimore.emissions.motor.by.year <- summarise(group_by(baltimore.emissions.motor, year), Emissions = sum(Emissions))
LA.emissions.motor.by.year <- summarise(group_by(LA.emissions.motor, year), Emissions = sum(Emissions))

baltimore.emissions.motor.by.year$County <- "Baltimore City, MD"
LA.emissions.motor.by.year$County <- "Los Angeles County, CA"
both.emissions <- rbind(baltimore.emissions.motor.by.year, LA.emissions.motor.by.year)


ggplot(both.emissions, aes(x=factor(year), y=Emissions, fill=County)) +
  geom_bar(stat="identity") +
  facet_grid(County ~ ., scales="free") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions in Tons")) +
  ggtitle(expression("Total PM"[2.5]*" Emissions from Motor Vehicle Sources in Tons")) +
  theme(plot.title = element_text(size = 11, face="bold"),
        axis.title = element_text(size = 10, face="bold"),
        axis.text.x = element_text(size = 5))

dev.copy(png, "plot6.png")
dev.off()