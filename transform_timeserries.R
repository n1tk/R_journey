# load / install package 
install.packages("rsdmx")
library(rsdmx)
library(dplyr)


# Total 
Assets.PIT <- readSDMX("http://widukind-api.cepremap.org/api/v1/sdmx/IMF/data/IFS/..Q.BFPA-BP6-USD")
Assets.PIT <- as.data.frame(Assets.PIT)
names(Assets.PIT)[10]<-"A.PI.T"
names(Assets.PIT)[6]<-"Code"
AP<-Assets.PIT[c("WIDUKIND_NAME","Code","TIME_PERIOD","A.PI.T")]
AP<-rename(AP, Country=WIDUKIND_NAME, Year=TIME_PERIOD)


head(AP$Year)
install.packages("zoo")
library(zoo)
h <- c(AP$Year)
h
l <- as.Date(format(as.Date(as.yearqtr(h))+40, "%Y-%m"))
l
