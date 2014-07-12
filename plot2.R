##########################################################
#R script for Coursera Exploratory Data Analysis project 1
#plot2
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

#Combine and convert dates/times
dateTime = strptime(paste(elecSub$Date," ",elecSub$Time),
                    format = "%d/%m/%Y %H:%M:%S");
elecSub = cbind(elecSub,dateTime);


#initialize png graphics device and plot to file rplot1.png
png(file="plot2.png",width=480,height=480);

    plot(elecSub$dateTime,elecSub$Global_active_power,
         ylab = "Global Active Power (kilowatts)",type = "l",
         xlab = "");
#Turn off png device
dev.off();


