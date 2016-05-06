##################
## Name: plot2.R
## Author: RHorth
## Date: 04/05/2016
## Data files needed: household_power_consumption.txt
## Data file available from: https://github.com/rdpeng/ExData_Plotting1
## Output file produced: plot2.png
##################

##################
## Step 1: Read, clean and subset data
## Summary: 
##    - 1.1 Set working directory
##    - 1.2 Read data
##    - 1.3 Convert date and time formats

## Step 1.1 ##
setwd("C:/Coursera/Exploratory Data Analysis/Week 1/Project/") 

## Step 1.2 ##
df <- read.table("household_power_consumption.txt", 
                 sep=";",
                 skip=66637, 
                 nrows=2880) 
colnames(df) <- colnames(read.table("household_power_consumption.txt", 
                                    header=T, 
                                    sep=";",
                                    nrows=1))
## Step 1.3 ##
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time2 <- as.POSIXlt(paste(df$Date, df$Time))

##################
## Step 2: Create the plot in png
## Summary: 
##    - 2.1 Open png connection
##    - 2.2 Create plot
##    - 2.3 Close the connection

## Step 2.1 ##
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

## Step 2.2 ##
plot(df$Time2,df$Global_active_power,
     type="n",
     ylab="Global Active Power (kilowatts)",
     xlab="")
lines(df$Time2,df$Global_active_power) 

## Step 2.3 ##
dev.off()
