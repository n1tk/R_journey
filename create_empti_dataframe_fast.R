starttime = Sys.time()
total_num_lineups = 100000000
lineup = as.data.frame(matrix(nrow = total_num_lineups, ncol = 24))

Sys.time() - starttime


#
install.packages("data.table")
library(data.table)

starttime = Sys.time()
total_num_lineups = 100000000
lineup = as.data.table(matrix(nrow = total_num_lineups, ncol = 24))

Sys.time() - starttime
