head(mtcars)
var_label <- numeric(ncol(mtcars))
var_label
for(i in 1:length(mtcars)){
print(i)
  tempvar <- var(mtcars[,i])
print(mtcars[,i])
print(tempvar)
  var_label[i] <- tempvar

}

var_label

var(mtcars[,8])