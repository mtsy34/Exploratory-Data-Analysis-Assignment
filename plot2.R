source("load_data.R")

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.

baltimore <- subset(NEI, fips == "24510")
baltimore_tm <- tapply(baltimore$Emissions, baltimore$year, sum)
barplot(baltimore_tm/1000, xlab = "Year", ylab = expression("Total PM"[2.5]*" Emissions in Kilotons"), main = expression("Total PM"[2.5]*" Emissions in Baltimore in Kilotons"), ylim = c(0, 4))

dev.copy(png, file = "plot2.png")
dev.off()