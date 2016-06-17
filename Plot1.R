# EXPLANATORY DATA ANALYSIS - PROJECT 1 ~ PLOT 1:
EPC <- unzip('./Electric Power Consumption.zip')                            # Unzip the data.

library(data.table); HPC <- fread(EPC, na.strings= "?")                     # Read the data.
library(pryr); object_size(HPC)                                             # Estimate of memory required.

SubHPC <- HPC[HPC$Date %in% c("1/2/2007","2/2/2007") ,]                     # Extract the data needed.
DateTime <- strptime(paste(SubHPC$Date, SubHPC$Time), "%d/%m/%Y %H:%M:%S")  # Create a column with Date/Time classes.

SubHPC$Date <- NULL; SubHPC$Time <- NULL                                    # Remove columns with no Date/Time classes.
SubHPC_Final <- cbind(Time_and_Date = as.POSIXct(DateTime), SubHPC)         # Add to data the column previously created.

library(datasets)                                                           
with(SubHPC_Final,                                                          # Use the final data for the plot.
     hist(SubHPC_Final$Global_active_power,                                 # Create an histogram.
          col = "red",                                                      # Color it in red.
          xlab = "Global Active Power (kilowatts)",                         # Label the x axis.
          main = "Global Active Power"))                                    # Create a title.
dev.copy(png, file = "Plot_1.png")                                          # Import the histogram to a PNG file.
dev.off()                                                                   # Close.