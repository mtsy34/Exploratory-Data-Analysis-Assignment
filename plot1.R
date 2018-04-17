source("load_data.R")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all
# sources for each of the years 1999, 2002, 2005, and 2008.

sum25 <- tapply(NEI$Emissions, NEI$year, sum)
barplot(sum25/1000, xlab = "Year", ylab = expression("Total PM"[2.5]*" Emissions in Kilotons", main = expression("Total PM"[2.5]*" Emissions in Kilotons"), ylim = c(0,8000)))

dev.copy(png, file = "plot1.png")
dev.off()