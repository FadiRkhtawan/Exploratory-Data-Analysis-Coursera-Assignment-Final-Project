
## Selecting the directory

setwd("D:/Fadi_Command/Course 4/Assignment 2")

## Downloading the zip file frim the URL

dir.create("./air_pollution")
urlzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(urlzip, destfile = "./air_pollution.zip" )

## Extracting the files from the compressed one

unzip("./air_pollution.zip", exdir = "./air_pollution" )

## Reading data

NEI <- readRDS("./air_pollution/summarySCC_PM25.rds")
SCC <- readRDS("./air_pollution/Source_Classification_Code.rds")

## Testing Data

str(NEI)
str(SCC)

## 2

baltimore <- subset(NEI, NEI$fips == "24510")
totalBaltimore <- aggregate(Emissions ~ year, baltimore, sum)
plot(totalBaltimore$year, totalBaltimore$Emissions, type = "o", 
     main = expression("Total Baltimore" ~ PM[2.5] ~ "Emissions by Year"), xlab = "Year", 
     ylab = expression("Total Baltimore "~ PM[2.5] ~ "Emissions"), col = "steelblue3")
