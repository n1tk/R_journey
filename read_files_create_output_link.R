install.packages("ddply")
install.packages("plyr", dependencies = TRUE)
library(plyr)
library(ddply)
link = 'https://catalog.data.gov/dataset/housing-affordability-data-system-hads/resource/80bb33ff-2306-4fce-b812-3f9718f493e6'
download.file(link, destfile = paste("abcd",substring(link,25,31),'.csv'))


paste("abcd", substring(link,25,31), sep = "", ".csv")
paste("abcd", substring(link,25,32),  ".csv")


library(data.table)
mydat <- fread(link, destfile = paste("abcd",substring(link,25,31), sep = "",'.csv'))
head(mydat)


data <- download.file(link, destfile = paste("abcd",substring(link,25,31), sep = "", '.csv'))
data                 

