# Getting data 

URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
filename_zip <- "exdata%2Fdata%2FNEI_data.zip"
filename_NEI <- "summarySCC_PM25.rds"
filename_SCC <- "Source_Classification_Code.rds"

if(!file.exists(filename_zip)) {
  download.file(URL, filename_zip, mode="wb")
}

if(!file.exists(filename_NEI) | !file.exists(filename_SCC)) {
  unzip(filename_zip)
}

# Reading data

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")