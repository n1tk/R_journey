freq <- c(489, 2, 1, 333, 1, 222, 709, 11, 654, 1, 5)

df <- data.frame(freq)
print(df)
str(df)
df <- mutate(df, group = df$freq / 100)
print(df)


v <- seq(100)# example data
v
f <- gl(10,10)# generate factor for grouping
f
v_sums <- as(f,"sparseMatrix") %*% v
