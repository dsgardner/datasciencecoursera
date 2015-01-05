

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values) xd = x[which(x$sulfate != "NA"),] t = x3d[c("sulfate")] rt = rbind(r,t)
  
  files = list.files(directory, full.names = TRUE)
  files <- files[id]
  all_data = list() 

  for (i in files) {
    data = read.csv(i)
    data = data[which(data[,pollutant] != "NA"),]
    data = data[c(pollutant)]
    all_data = rbind(all_data,data)
  }
  
  print(mean(all_data[[pollutant]]))
}


