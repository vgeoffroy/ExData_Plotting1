# EXPLANATORY DATA ANALYSIS - PROJECT 1 ~ PLOT 3:
EPC <- unzip('./Electric Power Consumption.zip')                            # Unzip the data.

library(data.table); HPC <- fread(EPC, na.strings= "?")                     # Read the data.
library(pryr); object_size(HPC)                                             # Estimate of memory required.

SubHPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007") ,]                     # Extract the data needed.
DateTime <- strptime(paste(SubHPC$Date, SubHPC$Time), "%d/%m/%Y %H:%M:%S")  # Create a column with Date/Time classes.

SubHPC$Date <- NULL; SubHPC$Time <- NULL                                    # Remove columns with no Date/Time classes.
SubHPC_Final <- cbind(Time_and_Date = as.POSIXct(DateTime), SubHPC)         # Add to data the column previously created.

library(datasets)                                                           
# Plot 1:
with(SubHPC_Final,                                                          # Use the final data for the plot.
     plot(SubHPC_Final$Time_and_Date,                                       # Create a plot - First variable.
          SubHPC_Final$Sub_metering_1,                                      # Create a plot - Second variable.
          type = "l",                                                       # Change the type of the plot.
          xlab = "",                                                        # Label the x axis.
          ylab = "Energy sub metering"))                                    # Label the y axis
# Plot 2:
lines(SubHPC_Final$Time_and_Date,                                           # Create a plot - First variable.
      SubHPC_Final$Sub_metering_2,                                          # Create a plot - Second variable.
      col = "red",                                                          # Color it in red.
      type = "l")                                                           # Change the typ of the plot.
# PLot 3:
lines(SubHPC_Final$Time_and_Date,                                           # Create a plot - First variable.
      SubHPC_Final$Sub_metering_3,                                          # Create a plot - second variable.
      col = "blue",                                                         # Color it in blue.
      type = "l")                                                           # Change the type of the plot.
legend("topright",                                                          # Add a legend on the top right corner.
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),             # Text for the legend.
       lty = 1, 
       col = c("black", "red", "blue"))                                     # Color the legend.
dev.copy(png, file = "Plot_3.png")                                          # Import plots to a PNG file.
dev.off()                                                                   # Close.
