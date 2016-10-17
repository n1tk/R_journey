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
#test <- c (-0.0799 ,  0.0003 , -0.0063 ,  0.0000 , -3.3180 ,  0.0000 ,  0.0000)
#v1 <- as.numeric(test)
#v1

#l <- split(v1, 1)
l

#a <- -0.0799
#cd <- as.numeric(strsplit(as.character(a), "")[[1]])
#cd
#cd.clean <- cd[!is.na(cd)]
#cd.clean
#cd.clean1 <- cd.clean[which(cd.clean >0)] #get everything what is greater than 0
#cd.clean1[1] #get firs element from the list

library(foreach)


#for (i in 1:5) {
  #print(i^2)
#}



#for (i in length(cd.clean)){
  #print(cd.clean[i])
  #if(cd.clean[i] == 0){
    #cd.clean1[i] <- NA
 # }else{
   # cd.clean1[i] <- cd.clean[i]
   # } 
#}
#cd.clean1

#a1 <- as.character(a) ;
#a2 <- strsplit(a1, "") ;
#a3 <- unlist(a2) ;
#a4 <- as.vector(as.numeric(a3)) ;
#a4
#regexpr(a, "(?<=(^|\s+)[\-\.0]*)[1-9](?=[\d\.]*)")
#b <- midData$vals1first
#lapply(b, as.character(a)) 

#working the cleanup for vector
#as.vector(b)
#simple_vect <- c()
#missing_v <- c()
#b
#missing_b <- c()
#for (i in 1:length(midData$vals1)) {
  #b[b == 0] <- NA
  #ifelse(b[b[i] > 0], simple_vect[i] <- b[i], NA )
#}

#col.vect <- c()
#b
#completed abs and new column and anything freather than 0 are recorded else NA

midData$vals1first <- c()
midData$vals1first
a <- abs(midData$vals1)
for (i in 1:length(a)) {
  #a <-midData$vals1[i]
  #print(midData$vals1[i])
  print(a[i])
  ifelse(a[i] > 0, midData$vals1first[i] <- a[i], midData$vals1first[i] <- NA )
}

midData$vals1first

#for slicing midData$vals1first

#b <- midData$vals1first
#test1 <- c()
#for (i in 1:length(b)){
  #a1 <- as.character(b[i]) ;
  #a2 <- strsplit(a1, "") ;
  #a3 <- unlist(a2) ;
  #temp.val <- as.vector(as.numeric(a3)) ;
  #print(temp.val);
  #non.naval <- temp.val[!is.na(temp.val)]
  #print(non.naval)
  #test1[i] <- non.naval[1]
#}

#test1
#cd <- c()
#cd.clean <- c()
#cd.clean1 <- c()

#a <- midData$vals1first

#for (i in 1:length(a)){
 # cd[i] <- as.numeric(strsplit(as.character(i), "")[[1]])
 # cd.clean[i] <- cd[!is.na(cd)]
 # cd.clean1 <- cd.clean[which(cd.clean >0)]
 # print(cd.clean1)
 # cd.cleared <- cd.clean1[1]
 # cd.cleared
#}

#cd.cleared

#cd <- as.numeric(strsplit(as.character(a), "")[[1]])
#cd
#cd.clean <- cd[!is.na(cd)]
#cd.clean
#cd.clean1 <- cd.clean[which(cd.clean >0)] #get everything what is greater than 0
#cd.clean1[1] #get firs element from the list


#class(a)
#ifelse(midData$vals1[abs(midData$vals1[i]) != 0], midData$vals1first <- b[i], NA )

#midData$vals1first

colnames(midData)

#temp_data <- cbind(midData$vals1, midData$vals2)
#temp_data

#colnames(temp_data) <- c("X","Y")
#colnames(temp_data)


#sample_data <- temp_data[1:10, ]
#sample_data

#write.csv(sample_data, file = "test.csv")












#abs of the column, removing negative sign.
midData$vals1first <- abs(midData$vals1)
midData$vals1first

#converting missing to NA
midData$vals1first[midData$vals1first==0] <- NA
midData$vals1first


#f <- as.numeric(strsplit(as.character(a), "")[[1]])
#f
#tapply(midData$vals1first, 1, function = f)


#a <- 0.0799

#splitting each colum value in our data midData$vals1first, all data are positive, "NA" is the dot in our value.
mybiglist <- list()
for(i in 1:length(midData$vals1first)){
  print(midData$vals1first[i])
  f.split <- as.numeric(strsplit(as.character(midData$vals1first[i]), "")[[1]])
  print(f.split)
  mybiglist[[i]] <- f.split
}
mybiglist[400]

#str(mybiglist)

#extract each value in list of lists
class(mybiglist)
#cd.final <- c()
#for (i in 1:length(mybiglist)){
  #if (is.na(i)){
    #cd.final[i] <- NA
  #}else{
    #cd.clean <- cd[!is.na(mybiglist[[i]])]
    #print(cd.clean)
    #cd.clean
    #cd.clean1[i] <- cd.clean[which(cd.clean > 0)] #get everything what is greater than 0
    #cd.final[i] <- cd.clean1[1]
  #}
#}

#cd.final
length(mybiglist)
mybiglist #the list with all values and NA
new_vector <- c()
for (i in 1:length(mybiglist)){
  if (length(mybiglist[[i]]) > 1) {
    print(i)
    new_vector[[i]] <- subset(mybiglist[[i]], mybiglist[[i]] > 0)
  } else {
    new_vector[[i]] <- NA
  }
}
new_vector

  #list1<-c(1,2,3)
  #list2<-c(1,2,6)
  #sergiu<-list(list1,list2)
#sergiu[[2]]
  #sergiu2<- subset(sergiu[[2]],sergiu[[2]]>1)
  #sergiu2
#new_vector
 
final_var <- lapply(new_vector, `[`, 1) #completed 
final_var

vals1first_data <- unlist(final_var, use.names = F)
table(vals1first_data, useNA = "always")
summary(final_var) #

#lapply( mybiglist, `[[`, 1)  ### select each first element from the list        
#lapply(mybiglist, mean)

##########################################################################



#abs of the column, removing negative sign.
midData$vals1first <- abs(midData$vals2)
midData$vals1first

#converting missing to NA
midData$vals1first[midData$vals1first==0] <- NA
midData$vals1first


#f <- as.numeric(strsplit(as.character(a), "")[[1]])
#f
#tapply(midData$vals1first, 1, function = f)


#a <- 0.0799

#splitting each colum value in our data midData$vals1first, all data are positive, "NA" is the dot in our value.
mybiglist <- list()
for(i in 1:length(midData$vals1first)){
  print(midData$vals1first[i])
  f.split <- as.numeric(strsplit(as.character(midData$vals1first[i]), "")[[1]])
  print(f.split)
  mybiglist[[i]] <- f.split
}
mybiglist[400]

#str(mybiglist)

#extract each value in list of lists
class(mybiglist)
#cd.final <- c()
#for (i in 1:length(mybiglist)){
#if (is.na(i)){
#cd.final[i] <- NA
#}else{
#cd.clean <- cd[!is.na(mybiglist[[i]])]
#print(cd.clean)
#cd.clean
#cd.clean1[i] <- cd.clean[which(cd.clean > 0)] #get everything what is greater than 0
#cd.final[i] <- cd.clean1[1]
#}
#}

#cd.final
length(mybiglist)
mybiglist #the list with all values and NA
new_vector <- c()
for (i in 1:length(mybiglist)){
  if (length(mybiglist[[i]]) > 1) {
    print(i)
    new_vector[[i]] <- subset(mybiglist[[i]], mybiglist[[i]] > 0)
  } else {
    new_vector[[i]] <- NA
  }
}
new_vector

#list1<-c(1,2,3)
#list2<-c(1,2,6)
#sergiu<-list(list1,list2)
#sergiu[[2]]
#sergiu2<- subset(sergiu[[2]],sergiu[[2]]>1)
#sergiu2
#new_vector

final_var <- lapply(new_vector, `[`, 1) #completed 
final_var

vals1first_data <- unlist(final_var, use.names = F)
table(vals1first_data, useNA = "always")
summary(final_var) #









####################
midData$vals2firstt <- abs(midData$vals2)
midData$vals2first
#converting missing to NA
midData$vals2first[midData$vals2first==0] <- NA
midData$vals2first

#mybiglist <- list()
#my_biglist <- function(x){
  #for(i in 1:length(x)){
  #print(midData$x[i])
  #f.split <- as.numeric(strsplit(as.character(x[i]), "")[[1]])
  #print(f.split)
  #mybiglist[[i]] <- f.split
  #}
#}

#my_biglist(midData$vals2first)

mybiglist2 <- list()
for(i in 1:length(midData$vals2first)){
  print(midData$vals2first[i])
  f.split <- as.numeric(strsplit(as.character(midData$vals2first[i]), "")[[1]])
  print(f.split)
  mybiglist2[[i]] <- f.split
}

mybiglist2[394]

#Nonzero1(mybiglist2)
class(mybiglist2)
mybiglist2
#new_vector2 <- c()
Nonzero1 <- function(a_vect){
  new_vector2 <- c()
  for (i in 1:length(a_vect)){
  if (length(a_vect[[i]]) > 0) {
    #print(i)
    new_vector2[[i]] <- subset(a_vect[[i]], a_vect[[i]] > 0)
    
  } else {
    new_vector2[[i]] <- NA
  }
  }
}
#new_vector2

Nonzero1(mybiglist2)
new_vector2

final_var2 <- lapply(new_vector2, `[`, 1) #completed 
final_var2

final_var2_data <- unlist(final_var2, use.names = F)
table(final_var2_data, useNA = "always")
#summary(final_var) #
