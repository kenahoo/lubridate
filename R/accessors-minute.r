#' @include periods.r
NULL

#' Get/set minutes component of a date-time.
#'
#' Date-time must be a  POSIXct, POSIXlt, Date, chron, yearmon, yearqtr, zoo, 
#' zooreg, timeDate, xts, its, ti, jul, timeSeries, and fts objects. 
#'
#' @export minute "minute<-"
#' @aliases minute minute<-
#' @S3method minute default
#' @param x a date-time object   
#' @keywords utilities manip chron methods
#' @return the minutes element of x as a decimal number
#' @examples
#' x <- now()
#' minute(x)
#' minute(x) <- 1
#' minute(x) <- 61 
#' minute(x) > 2
minute <- function(x) 
  UseMethod("minute")
  
minute.default <- function(x)
  as.POSIXlt(x, tz = tz(x))$min


"minute<-" <- function(x, value)
  x <- x + minutes(value - minute(x))