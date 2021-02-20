setwd("E:/Descargas/exdata_data_NEI_data/")

library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI.mod<-NEI%>% group_by(year)%>%summarise(Total.EM=sum(Emissions))

png("Plot1.png", height=480 ,width =480)

plot(NEI.mod$year,NEI.mod$Total.EM/10^06, type ="l",
     ylab = "Total PM2.5 emmisions from all sources (*10^6)",  xlab= "Year", ylim = c(0,8))

dev.off()
