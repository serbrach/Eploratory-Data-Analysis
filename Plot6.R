setwd("E:/Descargas/exdata_data_NEI_data/")

library(dplyr)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

VehicleVect<-grepl("Vehicle",SCC$SCC.Level.Two)
SCC.sub<-SCC[VehicleVect,]

NEI.mod<-NEI%>% filter(SCC %in% SCC.sub$SCC, fips=="24510"|fips=="06037")%>%
  group_by(year, fips)%>%summarise(Total.EM=sum(Emissions))

NEI.mod$fips<-gsub("06037", "Los Angeles County", NEI.mod$fips)
NEI.mod$fips<-gsub("24510", "Baltimore City", NEI.mod$fips)


png("Plot6.png", height=960 ,width =960)

ggplot(NEI.mod,aes(x=factor(year),y=Total.EM,fill=year,label=round(Total.EM)))+geom_bar(stat="identity")+ 
  xlab("Year")+ylab("Total Emissions (Tons)")+ggtitle("Total Vehicle-related emissions")+ theme(legend.position = "none")+
  facet_grid(.~fips)


dev.off()
