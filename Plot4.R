setwd("E:/Descargas/exdata_data_NEI_data/")

library(dplyr)
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

CoalVect<-grepl("Coal",SCC$EI.Sector)
SCC.sub<-SCC[CoalVect,]

NEI.mod<-NEI%>% filter(SCC %in% SCC.sub$SCC)%>%
  group_by(year)%>%summarise(Total.EM=sum(Emissions),)


png("Plot4.png", height=480 ,width =480)

ggplot(NEI.mod,aes(x=factor(year),y=Total.EM/1000,fill=year,label=round(Total.EM/1000)))+geom_bar(stat="identity")+
  xlab("Year")+ylab("Total Emissions (*1000 Tons)")+ggtitle("Total coal-related emissions in the Country")+ theme(legend.position = "none")
    

dev.off()

