##########################################################
#R script for Coursera Exploratory Data Analysis project 1
#plot1
#Written by Brad Kenny 11 July 2014
#################################################
setwd("/home/brad/Documents/Classes/Coursera/ExplDataAnalysis/Project1/");

#Read in Data
elecDat = read.table(file="household_power_consumption.txt",sep=";",
                     ,stringsAsFactors=F,    header = T,na.strings = "?");
#elecDat$Date = as.Date(elecDat$Date);

#Subset
subVec = c("1/2/2007","2/2/2007");
elecSub = subset(elecDat,elecDat$Date %in% subVec);

#initialize png graphics device and plot to file rplot1.png
png(file="plot1.png",width=480,height=480);
    hist(elecSub$Global_active_power,col="red",
         xlab = "Global Active Power (kilowatts)",
        main = "Global Active Power");
#Turn off png device
dev.off();

