
setwd("C:/Users/Chris/datasciencecoursera/ExploritoryDataAnalysis")
quizdata <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)

#Create a datetime column for plotting
quizdata$datetime<-strptime(paste(as.Date(quizdata$Date,"%d/%m/%Y"),quizdata$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")

#Clean & flter the data to just what we need
q<-quizdata[quizdata$Global_active_power !="?",]
q<-q[q$datetime >="2007-02-01 00:00:00" & q$datetime < "2007-02-03 00:00:00",]
q<-q[!is.na(q$datetime),]

#Fix up the column types
q$Global_active_power=as.numeric(as.character(q$Global_active_power))
q$Global_reactive_power=as.numeric(as.character(q$Global_reactive_power))
q$Voltage=as.numeric(as.character(q$Voltage))
q$Sub_metering_1=as.numeric(as.character(q$Sub_metering_1))
q$Sub_metering_2=as.numeric(as.character(q$Sub_metering_2))


setwd("C:/Users/Chris/datasciencecoursera/ExploritoryDataAnalysis/ExData_Plotting1")

#Create plots and send to device
png(file="Plot1.png")
par(cex=0.8,cex.axis=0.8)
hist(q$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowats)")
dev.off()

