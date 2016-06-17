# EXPLANATORY DATA ANALYSIS - PROJECT 1 ~ PLOT 4:
EPC <- unzip('./Electric Power Consumption.zip')                            # Unzip the data.

library(data.table); HPC <- fread(EPC, na.strings= "?")                     # Read the data.
library(pryr); object_size(HPC)                                             # Estimate of memory required.

SubHPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007") ,]                     # Extract the data needed.
DateTime <- strptime(paste(SubHPC$Date, SubHPC$Time), "%d/%m/%Y %H:%M:%S")  # Create a column with Date/Time classes.

SubHPC$Date <- NULL; SubHPC$Time <- NULL                                    # Remove columns with no Date/Time classes.
SubHPC_Final <- cbind(Time_and_Date = as.POSIXct(DateTime), SubHPC)         # Add to data the column previously created.

library(datasets)
par(mfrow = c(2, 2))                                                        # Split panel into four areas.
# Plot 1:
with(SubHPC_Final,                                                          # Use the final data for the plot.
     plot(SubHPC_Final$Time_and_Date,                                       # Create a plot - First variable.
          SubHPC_Final$Global_active_power,                                 # Create a plot - Second variable.
          type = "l",                                                       # Change the type of the plot.
          xlab = "",                                                        # Label the x axis.
          ylab = "Global Active Power"))                                    # Label the y axis.
# Plot 2:
plot(SubHPC_Final$Time_and_Date,                                            # Create a plot - First variable.
     SubHPC_Final$Voltage,                                                  # Create a plot - Second variable.
     type = "l",                                                            # Change the type of the plot.
     xlab = "datetime",                                                     # Label the x axis.
     ylab = "Voltage")                                                      # Label the y axis.
# Plot 3:
plot(SubHPC_Final$Time_and_Date,                                            # Check Plot3.R for comments.
     SubHPC_Final$Sub_metering_1,                                           
     type = "l",                                                                              
     xlab = "",                                                           
     ylab = "Energy sub metering")                                          
lines(SubHPC_Final$Time_and_Date,                                           
      SubHPC_Final$Sub_metering_2,
      col = "red",
      type = "l")
lines(SubHPC_Final$Time_and_Date,
      SubHPC_Final$Sub_metering_3,
      col = "blue",
      type = "l")
legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       col = c("black", "red", "blue"),
       cex = 0.6)                                                           # Change the size of the legend.

plot(SubHPC_Final$Time_and_Date,                                            # Create a plot - First variable.
     SubHPC_Final$Global_reactive_power,                                    # Create a plot - Second variable.
     type = "l",                                                            # Change the type of the plot.
     xlab = "datetime",                                                     # Label the x axis.
     ylab = "Global_reactive_power",)                                       # Label the y axis.
dev.copy(png, file = "Plot_4.png")                                          # Import plots to PNG file.
dev.off()                                                                   # Close.