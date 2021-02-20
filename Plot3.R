setwd("E:/Descargas/exdata_data_NEI_data/")

library(dplyr)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.mod<-NEI%>% filter(fips=="24510") %>%
  group_by(year,type)%>%summarise(Total.EM=sum(Emissions),)


png("Plot3.png", height=480 ,width =960)

qplot(year,Total.EM, data= NEI.mod, colour=type, geom = c("point", "line"),facets=.~type,
      xlab = "Year", ylab="Total Emissions (Tons)", main = "Total Emissions Baltimore City by Type")

dev.off()

