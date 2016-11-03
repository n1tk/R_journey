p.ordered <- ordered(c("x", "y", "y",
                       "y", "z", "a",
                       "b", "b", "c", 
                       "c", "c", "v"))
p.ordered

a <- sort(p.ordered, method = "radix")
as.matrix(a, ncol(3))

library(MASS)
head(mtcars)

url_data <- "https://github.com/datailluminations/PredictingToyotaPricesBlog/blob/master/ToyotaCorolla.csv"

ds_corrola <- read.csv("/Users/sbuciuma/Desktop/git/PredictingToyotaPricesBlog/ToyotaCorolla.csv")

#splitting data

library(dplyr)
train<-sample_frac(ds_corrola, 0.7)
sid<-as.numeric(rownames(train)) # because rownames() returns character
test<-ds_corrola[-sid,]
str(train)
str(test)

#
# Multiple Linear Regression Example 
fit <- lm(Price ~ Age  +  KM + FuelType + HP + MetColor + Automatic  + CC + Doors + Weight, data=train)


summary(fit) # show results

fit1 <- lm(Price ~ Age  +  KM + FuelType + HP +  CC + Weight, data=train)
summary(fit1)
#fir <- lm(ds_corrola$price ~ ds_corrola$Age+ds_corrola$KM+ds_corrola$FuelType+ds_corrola$HP+ds_corrola$MetColor+ds_corrola$Automatic+ds_corrola$CC+ds_corrola$Doors+ds_corrola$Weight)

coefficients(fit) # model coefficients
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
influence(fit) # regression diagnostics

