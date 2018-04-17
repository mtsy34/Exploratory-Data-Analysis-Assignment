source("load_data.R")

# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?

library(ggplot2)

combustion.coal <- grepl("Coal", SCC$EI.Sector)
combustion.coal.sources <- SCC[combustion.coal,]

emissions.coal.combustion <- NEI[(NEI$SCC %in% combustion.coal.sources$SCC),]

emissions.coal.by.year <- summarise(group_by(emissions.coal.combustion, year), Emissions=sum(Emissions))

ggplot(emissions.coal.by.year, aes(x=factor(year), y=Emissions/1000, fill=year)) +
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions in Kilotons")) +
  ggtitle(expression("Total PM"[2.5]*" Emissions from Coal Combustion-Related Sources in Kilotons")) +
  theme(plot.title = element_text(size = 11, face="bold"),
        axis.title = element_text(size = 10, face="bold"),
        axis.text.x = element_text(size = 5))

dev.copy(png, "plot4.png")
dev.off()