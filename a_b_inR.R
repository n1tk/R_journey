install.packages("Matrix")
install.packages("lpSolve")
library("Matrix")
library("lpSolve")


#
# Set up problem: maximize
# x1 + 9 x2 + x3 subject to
# x1 + 2 x2 + 3 x3 <= 9
# 3 x1 + 2 x2 + 2 x3 <= 15
#
f.obj <- c(0,0, 1, 1, 1)
f.con <- matrix (c(-1, 0, -1, 0, 0, 1, 0, -1, 0, 0,-1, -5, 0, -1, 0, 1, 5, 0, -1, 0, -1, -6, 0, 0, -1, 1, 6, 0, -1, -1), nrow=6, byrow=TRUE)
f.con
f.dir <- c("<=", "<=", "<=", "<=", "<=", "<=")
f.rhs <- c(0, 0, -3, 3, -8, 8)
#
# Now run.
#
lp ("min", f.obj, f.con, f.dir, f.rhs)

x <- c(0, 5, 6)
y <- c(0, 3, 8)
plot(x, y)

lines(x, y, pch=22, lty=2, col="red")
## Not run: Success: the objective function is 40.5
a = lp ("min", f.obj, f.con, f.dir, f.rhs)$solution
a
## Not run: [1] 0.0 4.5 0.0
plot(a)
# The same problem using the dense constraint approach:
#
f.obj <- c(0,0, 1)
f.con <- matrix (c(0, -1, -1, 0, 1, -1, -5, -1, -1, 5, 1, -1, -6, -1, -1, 6, 1, -1), nrow=6, byrow=TRUE)
f.con
f.dir <- c("<=", "<=", "<=", "<=", "<=", "<=")
f.rhs <- c(0, 0, -3, 3, -8, 8)
#
# Now run.
#

x <- c(0, 5, 6)
y <- c(0, 3, 8)
plot(x, y)

#lines(x, y, pch=22, lty=2, col="red")
## Not run: Success: the objective function is 40.5
b = lp ("min", f.obj, f.con, f.dir, f.rhs)$solution
b

plot(b)
