##########################################################
#R script for Coursera Exploratory Data Analysis project 1
#plot4
#Written by Brad Kenny 12 July 2014
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
png(file="plot4.png",width=480,height=480);
par(mfrow = c(2,2));

#first plot of series - modified from plot2.R
plot(elecSub$dateTime,elecSub$Global_active_power,
     ylab = "Global Active Power",type = "l",
     xlab = "");

#Second plot of series

plot(elecSub$dateTime,elecSub$Voltage,,xlab="datetime",ylab="Voltage",type="l");

#third plot of series - modified from plot3.R

plot(elecSub$dateTime,elecSub$Sub_metering_1,type = "l",xlab="",
     ylab = "Energy sub metering");
lines(elecSub$dateTime,elecSub$Sub_metering_2,type = "l",col = "red");
lines(elecSub$dateTime,elecSub$Sub_metering_3,type="l",col = "blue");
legend("topright",lty=1,legend = c("Sub_metering_1","Sub_metering_2",
                                   "Sub_metering_3"),col=c("black","red","blue"),
                                    bty="n");


#fourth plot of series
    #Playing with with()
with(elecSub,
     plot(Global_reactive_power,xlab="datetime",type="l")
     );

#Turn off png device
dev.off();






