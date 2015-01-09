corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  files = list.files(directory, full.names = TRUE)
  corrs = vector()
  index = 0
  
    for (i in files) {    
      data = read.csv(i)
      data = data[which(data[,"sulfate"] != "NA"),]
      data = data[which(data[,"nitrate"] != "NA"),]
      obs = length(data[["sulfate"]])
    
    if (obs >= threshold) 
    {
      data = data[c("sulfate","nitrate")]
      obs_corr = cor(data)
      if (!is.na(obs_corr[1,2])) {
        corrs = c(corrs, obs_corr[1,2])
      }     
    }
  }
  return(corrs)
}