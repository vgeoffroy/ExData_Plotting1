# EXPLANATORY DATA ANALYSIS - PROJECT 1 ~ PLOT 2:
EPC <- unzip('./Electric Power Consumption.zip')                            # Unzip the data.

library(data.table); HPC <- fread(EPC, na.strings= "?")                     # Read the data.
library(pryr); object_size(HPC)                                             # Estimate of memory required.

SubHPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007") ,]                     # Extract the data needed.
DateTime <- strptime(paste(SubHPC$Date, SubHPC$Time), "%d/%m/%Y %H:%M:%S")  # Create a column with Date/Time classes.

SubHPC$Date <- NULL; SubHPC$Time <- NULL                                    # Remove columns with no Date/Time classes.
SubHPC_Final <- cbind(Time_and_Date = as.POSIXct(DateTime), SubHPC)         # Add to data the column previously created.

library(datasets)
with(SubHPC_Final,                                                          # Use the final data for the plot.
     plot(SubHPC_Final$Time_and_Date,                                       # Create a plot - First variable.
          SubHPC_Final$Global_active_power,                                 # Create a plot - Second variable.
          type = "l",                                                       # Change the type of the plot.
          xlab = "",                                                        # Label the x axis.
          ylab = "Global Active Power (kilowatts)"))                        # Label the y axis.
dev.copy(png, file = "Plot_2.png")                                          # Import the plot to a PNG file.
dev.off()                                                                   # Close.