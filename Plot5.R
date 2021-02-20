setwd("E:/Descargas/exdata_data_NEI_data/")

library(dplyr)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

VehicleVect<-grepl("Vehicle",SCC$SCC.Level.Two)
SCC.sub<-SCC[VehicleVect,]

NEI.mod<-NEI%>% filter(SCC %in% SCC.sub$SCC, fips=="24510")%>%
  group_by(year)%>%summarise(Total.EM=sum(Emissions),)


png("Plot5.png", height=480 ,width =480)

ggplot(NEI.mod,aes(x=factor(year),y=Total.EM,fill=year,label=round(Total.EM)))+geom_bar(stat="identity")+
  xlab("Year")+ylab("Total Emissions ( Tons)")+ggtitle("Total Vehicle-related emissions in Baltimore")+ theme(legend.position = "none")


dev.off()

