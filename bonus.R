#HW2 part 1
install.packages("dplyr")
install.packages("stringr")
#1.	Find the average physical component score (variable name is pcs) for homeless females (that is, for observations with homeless=1 and female=1).

ds = read.csv("http://www3.amherst.edu/~nhorton/r2/datasets/help.csv")

head(ds)

mean.pcs <- mean(ds$pcs[ds$homeless==1 & ds$female==1], na.rm = T)
mean.pcs

#or we can use dplyr library  using and operator "&"

library(dplyr)
homeless.females = (ds$pcs[ds$homeless==1 & ds$female==1])
head(homeless.females)
#with(homeless.females, mean(pcs))

#2.Test whether the average pcs for homeless females is different from the average pcs for homeless males. Use alpha=.05 to report your findings.
#create female homeless variable
#homeless.females = filter(ds, homeless==1 & female==1)
#head(homeless.females)
#pcs.female <- with(homeless.females, mean(pcs))

#create male homeless variable
homeless.male <- (ds$pcs[ds$homeless==1 & ds$female==0])
homeless.male 

#head(homeless.male)
#pcs.male <- with(homeless.male, mean(pcs))


t.test(homeless.females , homeless.male, mu = 0.95)
t.test(homeless.females , homeless.male)
#t.test(formula = homeless.females ~ homeless.male)


# 3. Include a graphic, properly formatted, that compares 
#the distribution of pcs for homeless females to the distribution 
#of pcs for homeless males. side by side boxplot
boxplot(homeless.females , homeless.male, ylab="the distribution of pcs",
        names=c("Female","Male"), 
        main="distribution of pcs for homeless females to the distribution")

# 4.Create a properly formatted graphic that demonstrates whether pcs and mcs scores are associated. Also, 
#report a number that characterizes the strength of their relationship to each other. Cor scatter plot too

plot(ds$pcs, ds$mcs, main="pcs and mcs scores correlation", 
     xlab="pcs ", ylab="mcs")
#Explanation: weak correlation between pcs and mcs because  0.1104571
cor(ds$pcs, ds$mcs)

#part2 
library(stringr)

minchar 
maxchar
numMiss
minvalue
maxvalue


summInfo <- function(x){
  while (length(x)> 0) {
    if (is.character(x)){
      temp.character <- x[!is.na(x)]
      numMiss <- sum(is.na(x)) 
      maxchar <- max(nchar(temp.character))
      minchar <- min(nchar(temp.character))
      outlist.character <- list(minchar = minchar, maxchar = maxchar, numMiss = numMiss)
      return(outlist.character)
    } else if (is.numeric(x)){
      num.vect <- as.numeric(x)
      minvalue <- min(num.vect, na.rm = T)
      maxvalue <- max(num.vect, na.rm = T)
      numMiss <- sum(is.na(x))
      outlist.numeric <- list(minvalue = minvalue, maxvalue = maxvalue, numMiss = numMiss)
      return(outlist.numeric)
    } else if (is.factor(x)){
      temp.unique <- x[!is.na(x)]
      tempUnique <- unique(temp.unique, incomparables = T)
      numUnique <- length(tempUnique)
      outlist.factor <- list(numUnique = numUnique)
      return(outlist.factor)
    } else {
      print("Please inserT character, numerc or factor vector!")
    }
  }
}
#test numeric
summInfo(c(3,4,5.9,NA,3.4))

#2
summInfo(c("Yes","Maybe","No",NA,NA))

#3
summInfo(as.factor(c("Yes","YES","YES","YES",NA)))

#number vector
#vec.ser <- c(3,4,5.9,NA,4.2, 1.1, "anton")
summInfo(c(3,4,5.9,NA,4.2, 1.1))
#character vector

#part3 Numerical Optimization and Statistical Computing
set.seed(224)
pois.sample <- rpois(500, lambda = 3.4)
pois.sample
#remove 0 and 1 from pois
#new.pois <- pois[1:100]
p <-  pois.sample[! pois.sample %in% c(0,1)]
p

pois <- p[1:100]
pois
mean(pois)
sd(pois)

#2 


ds2 = read.csv("/Users/sbuciuma/Desktop/School/School_fall_2016/R_prog/Assignments/HW2/TruncPoisson.csv")
head(ds2, 5)

## for one-dimensional problems use optimize()
## takes a function to be optimized and a range over which to search

## Note that a likelihood is typically a very small number (since we
## are multiplying probabilities which must be bounded by [0,1].  We
## therefore usually work with the log-likelihood.  Since likelihoods
## are very small numbers, log-likelihoods are very large negative
## numbers.  To get the maximum likelihood, we want the minimum of the
## negative log-likelihood. what in our case is 2.571431

#bonus for take home will be finished but this is so far what I completed.

f <- function(x,lambda) -sum(log(dpois(x,lambda)))
aaa <- optimize(f, c(1,20), x=ds2$observed)
aaa$min


library(MASS)
parms <- fitdistr(ds2$observed, "poisson")
parms 
summary(parms)
parms
lambda <- parms$estimate
lambda
sd_x     <- parms$sd    

#Estimate the 95%CI
ci <- c(lambda + c(-1,1) * 1.96 * sd_x)
ci

##########

str(ds)
library(MASS)
parms <- fitdistr(ds2, "Poisson")
parms 


#Read in Poisson data 
p.data<-read.csv("/Users/sbuciuma/Desktop/School/School_fall_2016/R_prog/Assignments/HW2/TruncPoisson.csv")
n<-length(p.data)

#Write a function that calculates the likelihood
llhood <- function(lambda){
  log(lambda)*sum(p.data)-n*lambda-sum(log(factorial(p.data)))
}

#Plot the likelihood for lambda between 0 and 10
curve(llhood, from=0, to=10)

#Maximize the likelihood numerically
#Minimizing the negative log likelihood
fit<-nlminb(3, function(x) -1*llhood(x))

#Maximum likelihood estimate
fit$par

nLL <- function(lambda) -sum(stats::dpois(p.data, lambda, log = TRUE))
fit0 <- mle(nLL, start = list(lambda = 2 ), nobs = NROW(p.data))


#2 bonus'

#Read in Poisson data 
p.data2<-read.csv("/Users/sbuciuma/Desktop/School/School_fall_2016/R_prog/Assignments/HW2/DataSwamp.csv")
n<-length(p.data2)

#Write a function that calculates the likelihood
llhood2 <- function(lambda){
  log(lambda)*sum(p.data2)-n*lambda-sum(log(factorial(p.data2)))
}

#Plot the likelihood for lambda between 0 and 10
curve(llhood2, from=0, to=10)

#Maximize the likelihood numerically
#Minimizing the negative log likelihood
fit<-nlminb(3, function(x) -1*llhood(x))

#Maximum likelihood estimate
fit$par

