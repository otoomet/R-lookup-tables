DGP <- function(n1=120000, n2=50) {
   ## create matrix of n1 msisdns by n2 dates
   ## content is random integers
   numbers <- sample(1e9, n1)
   dates <- seq(from=as.Date("2011-08-01"), by="month", length=n2)
   tab <- matrix(sample(1000, n1*n2, replace=TRUE), n1, n2)
   attr(tab, "rows") <- numbers
   attr(tab, "cols") <- dates
   tab
}

matrixMatch <- function(data) {
   rows <- attr(data, "rows")
   numbers <- sample(rows)
   cols <- attr(data, "cols")
   dates <- sample(cols)
   for(number in numbers) {
      for(date in dates) {
         i <- match(number, rows)
         j <- match(date, cols)
         a <- data[i,j]
      }
   }
}
