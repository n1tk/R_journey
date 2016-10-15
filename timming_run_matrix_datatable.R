install.packages("data.table", "psych")

library(data.table)
#library(bigmemory)

library(psych)
ptm <- proc.time()
y = matrix(1:16, nrow=4) 
y

x = matrix(16:31, nrow=4) 
x

corr.test(y,x)
proc.time() - ptm

ptm <- proc.time()
ptm <- proc.time()
data.y <- as.data.table(y)
data.y
data.x <- as.data.table(x)

print(corr.test(data.y,data.x))
proc.time() - ptm
