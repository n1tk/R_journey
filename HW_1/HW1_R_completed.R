# ex1
install.packages("gdata")
install.packages("RCurl")
require(RCurl)
require(gdata)
url <- "http://datadryad.org/bitstream/handle/10255/dryad.316/LA_data_Hereford.xls?sequence=1"

data <- read.xls(url, header = T)
str(data)

class(data)
#b
dim(data)
#c_a
publication_year_ordered <- data[order(data$pub_year),]
head(publication_year_ordered)

#c_b
author_ordered <- data[order(data$Author),]
head(author_ordered)

#c_c by descending site mean (site_mean).
site_mean_descending <- data[order(-site_mean),]
head(publication_year_ordered)
#c_d
attach(data)
colnames(data)
a <- data[800,"site_mean"]
a
#D
min_site_mean <- min(site_mean)
min_site_mean
median_site_mean <- median(site_mean)
median_site_mean
max_site_mean <- max(site_mean)
max_site_mean

#E Create a new variable named   that is defined as follows: sm_magnitude 

data$sm_magnitude <-cut(data$site_mean, c(0,10,100,1000,10000,100000), right=F, labels=c(1:5))
data$sm_magnitude
str(data) ### check structure of the dataframe and in our case we have now 38 variebles

#F Determine the distinct values of the site variable can be done with unique()
###using column site vrom the dataframe
head(data)
unique(data$site)
###by creating a vector with values from dataframe
xs <- data$site
xs ### print on scree value of vector
unique(xs) ### provide list with distinc value

length(xs) ### check lenght of vector
length(unique(xs)) ### print on screen lenght of unique/distinct values

#G Determine how many missing values of life_cycle there are.
### creating a vector to work with and chech if are missing values, True mean thqt location is present missing value, FALSE meaning that is not present missing value
alv<- data$life_cycle
is.na(alv)
sum(is.na(alv))
table(is.na(data$life_cycle))

#H Create the data set
new_data <- subset(data,regexpr('etal',data$Author)>0 | regexpr('_et_al',data$Author)>0)
new_data <- new_data[order(new_data$Author,decreasing = F,new_data$rel_fit, new_data$sm_magnitude),c("Author","rel_fit","sm_magnitude")]
head(new_data)

#I write to csv file
write.csv(new_data, file = "HW1_data.csv")

#J read csv file just created

hw1_data <- read.csv("HW1_data.csv")
head(hw1_data)
