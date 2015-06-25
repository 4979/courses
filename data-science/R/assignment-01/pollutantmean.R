# R Programming - by Johns Hopkins University
# Week - 02
# Programming Assignment [1]: Air Pollution
# User Name: Prabhat Kumar
# =========================================
# It calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors.
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'.
# =======================================================================================
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  files <- (Sys.glob("specdata//*.csv"))[id];
  
  combined_data <- c()
  
  for (file in files) {
    data_from_file <- read.csv(file, sep = ",");
    pollutant_data <- data_from_file[,pollutant];
    pollutant_data <- pollutant_data[!is.na(pollutant_data)]
    combined_data <- c(combined_data, pollutant_data)
  }
  
  return(mean(combined_data));
}