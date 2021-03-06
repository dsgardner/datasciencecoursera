complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  files = list.files(directory, full.names = TRUE)
  files <- files[id]
  all_stats = data.frame()
  index = 1
  
  for (i in files) {
    data = read.csv(i)
    data = data[which(data[,"sulfate"] != "NA"),]
    data = data[which(data[,"nitrate"] != "NA"),]
    stats = c(id[index],length(data[["sulfate"]]))
    all_stats = rbind(all_stats,stats)
    index = index + 1
  }
  
  colnames(all_stats) = c("id","nobs")
  return(all_stats)
}