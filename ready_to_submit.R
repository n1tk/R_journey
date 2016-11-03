#take home portion

#Change the working directory to be the same as the folder that contains the downloaded csv file
setwd('/Users/sbuciuma/Desktop/take_home')

# Read in the data set as an R data frame with the following name: midData

midData <- read.csv("Midterm.csv")
head(midData)

# For all variable names in midData that begin with “X”, add “_v1” to the end of the variable name. If the variable name does not begin with “X”, don’t change the variable’s name
names(midData)

names(midData) <- ifelse(grepl("^X",names(midData)), paste0(names(midData),"_v1"), names(midData))
names(midData)

#For each of the first 300 variables in midData, find the maximum value for the variable. 
#Then plot these maximum values versus the variable order. 
#(That is, the first point would be at (1, maximum of V1), the second point would be at (2, maximum of V2), etc.)
length(midData)
str(midData)

new_midData <- midData[,1:300] #sliced original dataframe, all rows and collumns 1 to 300.
str(new_midData) #output 400 observations and 300 columns.

colMax_data <- function(data) sapply(data, max, na.rm = TRUE) #function to calculate max of the columns
max_colmidData <- colMax_data(new_midData)
str(max_colmidData)
max_colmidData
#plotting

#plot regular
#y <- max_colmidData
#plot(y, axis(1, at = v1$ix, label = names(v1$x))) #plotting data, will provide point of the data 

#lines(y) # adding lines in case of need in case required lines for graph

plot(max_colmidData, main="plot these maximum values versus the variable order", sub="bellow is variable and we have 300") #required one plot.

#
library(dplyr)
test <- c (-0.0799 ,  0.0003 , -0.0063 ,  0.0000 , -3.3180 ,  0.0000 ,  0.0000)
v1 <- as.numeric(test)
v1

l <- split(v1, 1)
l

a <- -0.0799
cd <- as.numeric(strsplit(as.character(a), "")[[1]])
cd
cd.clean <- cd[!is.na(cd)]
cd.clean
cd.clean1 <- cd.clean[which(cd.clean >0)] #get everything what is greater than 0
cd.clean1[1] #get firs element from the list

library(foreach)


for (i in 1:5) {
  print(i^2)
}



for (i in length(cd.clean)){
  print(cd.clean[i])
  if(cd.clean[i] == 0){
    cd.clean1[i] <- NA
  }else{
    cd.clean1[i] <- cd.clean[i]
  } 
}
cd.clean1

a1 <- as.character(a) ;
a2 <- strsplit(a1, "") ;
a3 <- unlist(a2) ;
a4 <- as.vector(as.numeric(a3)) ;
a4



























#abs of the column, removing negative sign.
midData$vals1first <- abs(midData$vals1)
midData$vals1first

#converting missing to NA
midData$vals1first[midData$vals1first==0] <- NA
midData$vals1first

#splitting each colum value in our data midData$vals1first, all data are positive, "NA" is the dot in our value.
mybiglist <- list()
for(i in 1:length(midData$vals1first)){
  print(midData$vals1first[i])
  f.split <- as.numeric(strsplit(as.character(midData$vals1first[i]), "")[[1]])
  print(f.split)
  mybiglist[[i]] <- f.split
}
mybiglist[400]

str(mybiglist)


