setwd("E:/Descargas/exdata_data_NEI_data/")

library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.mod<-NEI%>% filter(fips=="24510") %>%
  group_by(year)%>%summarise(Total.EM=sum(Emissions))


png("Plot2.png", height=480 ,width =480)

plot(NEI.mod$year,NEI.mod$Total.EM/1000, type = "b",
     ylab = "Total PM2.5 emmisions from all sources (*10^3)",  xlab= "Year",
     ylim = c(0,4),main = "Baltimore City")

dev.off()

