source("load_data.R")

# How have emissions from motor vehicle sources changed from
# 1999-2008 in Baltimore City?

baltimore.emissions.motor <- subset(NEI, (fips == "24510" & type == "ON-ROAD"))

library(dplyr)
library(ggplot2)

baltimore.emissions.motor.by.year <- summarise(group_by(baltimore.emissions.motor, year), Emissions = sum(Emissions))

ggplot(baltimore.emissions.motor.by.year, aes(x=factor(year), y=Emissions/1000, fill = year)) +
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions in Kilotons")) +
  ggtitle(expression("Total PM"[2.5]*" Emissions from Motor Vehicle Sources in Kilotons")) +
  theme(plot.title = element_text(size = 11, face="bold"),
        axis.title = element_text(size = 10, face="bold"),
        axis.text.x = element_text(size = 5))
         
dev.copy(png, "plot5.R")
dev.off()
  