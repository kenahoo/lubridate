context("Rounding")

test_that("floor_date works for each time element",{
  x <- as.POSIXct("2009-08-03 12:01:59.23", tz = 
  	"UTC")
  
  expect_identical(floor_date(x, "second"), as.POSIXct(
  	"2009-08-03 12:01:59", tz = "UTC"))
  expect_identical(floor_date(x, "minute"), as.POSIXct(
  	"2009-08-03 12:01:00", tz = "UTC"))
  expect_identical(floor_date(x, "hour"), as.POSIXct(
  	"2009-08-03 12:00:00", tz = "UTC"))
  expect_identical(floor_date(x, "day"), as.POSIXct(
  	"2009-08-03 00:00:00", tz = "UTC"))
  expect_identical(floor_date(x, "week"), as.POSIXct(
  	"2009-08-02 00:00:00", tz = "UTC"))
  expect_identical(floor_date(x, "month"), as.POSIXct(
  	"2009-08-01 00:00:00", tz = "UTC"))
  expect_identical(floor_date(x, "year"), as.POSIXct(
  	"2009-01-01 00:00:00", tz = "UTC"))
})

test_that("ceiling_date works for each time element",{
  x <- as.POSIXct("2009-08-03 12:01:59.23", tz = 	"UTC")
  
  expect_identical(ceiling_date(x, "second"), as.POSIXct(
  	"2009-08-03 12:02:00", tz = "UTC"))
  expect_identical(ceiling_date(x, "minute"), as.POSIXct(
  	"2009-08-03 12:02:00", tz = "UTC"))
  expect_identical(ceiling_date(x, "hour"), as.POSIXct(
  	"2009-08-03 13:00:00", tz = "UTC"))
  expect_identical(ceiling_date(x, "day"), as.POSIXct(
  	"2009-08-04 00:00:00", tz = "UTC"))
  expect_identical(ceiling_date(x, "week"), as.POSIXct(
  	"2009-08-09 00:00:00", tz = "UTC"))
  expect_identical(ceiling_date(x, "month"), as.POSIXct(
  	"2009-09-01 00:00:00", tz = "UTC"))
  expect_identical(ceiling_date(x, "year"), as.POSIXct(
  	"2010-01-01 00:00:00", tz = "UTC"))
})

test_that("ceiling_date works for irregular-sized units",{
  x <- as.POSIXct("2009-01-31")

  expect_that(ceiling_date(x, "month"),
              equals(as.POSIXct("2009-02-01")))

})


test_that("round_date works for each time element",{
  x <- as.POSIXct("2009-08-03 12:01:59.23", tz = 
  	"UTC")
  
  expect_identical(round_date(x, "second"), as.POSIXct(
  	"2009-08-03 12:01:59", tz = "UTC"))
  expect_identical(round_date(x, "minute"), as.POSIXct(
  	"2009-08-03 12:02:00", tz = "UTC"))
  expect_identical(round_date(x, "hour"), as.POSIXct(
  	"2009-08-03 12:00:00", tz = "UTC"))
  expect_identical(round_date(x, "day"), as.POSIXct(
  	"2009-08-04 00:00:00", tz = "UTC"))
  expect_identical(round_date(x, "week"), as.POSIXct(
  	"2009-08-02 00:00:00", tz = "UTC"))
  expect_identical(round_date(x, "month"), as.POSIXct(
  	"2009-08-01 00:00:00", tz = "UTC"))
  expect_identical(round_date(x, "year"), as.POSIXct(
  	"2010-01-01 00:00:00", tz = "UTC"))
})

test_that("floor_date handles vectors",{
  x <- as.POSIXct(c("2009-08-03 12:01:59.23", 
  	"2010-08-03 12:01:59.23"), tz = "UTC") 
  
  expect_identical(floor_date(x, "second"), as.POSIXct(c(
    "2009-08-03 12:01:59", "2010-08-03 12:01:59"), tz = 
    "UTC"))
  expect_identical(floor_date(x, "minute"), as.POSIXct(c(
  	"2009-08-03 12:01:00", "2010-08-03 12:01:00"), tz = 
  	"UTC"))
  expect_identical(floor_date(x, "hour"), as.POSIXct(c(
    "2009-08-03 12:00:00", "2010-08-03 12:00:00"), tz = 
    "UTC"))
  expect_identical(floor_date(x, "day"), as.POSIXct(c(
  	"2009-08-03 00:00:00", "2010-08-03 00:00:00"), tz = 
  	"UTC"))
  expect_identical(floor_date(x, "week"), as.POSIXct(c(
  	"2009-08-02 00:00:00", "2010-08-01 00:00:00"), tz = 
  	"UTC"))
  expect_identical(floor_date(x, "month"), as.POSIXct(c(
  	"2009-08-01 00:00:00", "2010-08-01 00:00:00"), tz = 
  	"UTC"))
  expect_identical(floor_date(x, "year"), as.POSIXct(c(
  	"2009-01-01 00:00:00", "2010-01-01 00:00:00"), tz = 
  	"UTC"))
})

test_that("ceiling_date handles vectors",{
  x <- as.POSIXct(c("2009-08-03 12:01:59.23", 
  	"2010-08-03 12:01:59.23"), tz = "UTC") 
  
  expect_identical(ceiling_date(x, "second"), as.POSIXct(c(
    "2009-08-03 12:02:00", "2010-08-03 12:02:00"), tz = 
    "UTC"))
  expect_identical(ceiling_date(x, "minute"), as.POSIXct(c(
  	"2009-08-03 12:02:00", "2010-08-03 12:02:00"), tz = 
  	"UTC"))
  expect_identical(ceiling_date(x, "hour"), as.POSIXct(c(
  	"2009-08-03 13:00:00", "2010-08-03 13:00:00"), tz = 
  	"UTC"))
  expect_identical(ceiling_date(x, "day"), as.POSIXct(c(
  	"2009-08-04 00:00:00", "2010-08-04 00:00:00"), tz = 
  	"UTC"))
  expect_identical(ceiling_date(x, "week"), as.POSIXct(c(
  	"2009-08-09 00:00:00", "2010-08-08 00:00:00"), tz = 
  	"UTC"))
  expect_identical(ceiling_date(x, "month"), as.POSIXct(c(
  	"2009-09-01 00:00:00", "2010-09-01 00:00:00"), tz = 
  	"UTC"))
  expect_identical(ceiling_date(x, "year"), as.POSIXct(c(
  	"2010-01-01 00:00:00", "2011-01-01 00:00:00"), tz = 
  	"UTC"))
})


test_that("round_date handles vectors",{
  x <- as.POSIXct(c("2009-08-03 12:01:59.23", 
  	"2010-08-03 12:01:59.23"), tz = "UTC") 
  
  expect_identical(round_date(x, "second"), 
    as.POSIXct(c("2009-08-03 12:01:59", 
      "2010-08-03 12:01:59"), tz = "UTC"))
  expect_identical(round_date(x, "minute"),
    as.POSIXct(c("2009-08-03 12:02:00", 
      "2010-08-03 12:02:00"), tz = "UTC"))
  expect_identical(round_date(x, "hour"), 
    as.POSIXct(c("2009-08-03 12:00:00", 
      "2010-08-03 12:00:00"), tz = "UTC"))
  expect_identical(round_date(x, "day"), 
    as.POSIXct(c("2009-08-04 00:00:00", 
      "2010-08-04 00:00:00"), tz = "UTC"))
  expect_identical(round_date(x, "week"), 
    as.POSIXct(c("2009-08-02 00:00:00", 
      "2010-08-01 00:00:00"), tz = "UTC"))
  expect_identical(round_date(x, "month"), 
    as.POSIXct(c("2009-08-01 00:00:00", 
      "2010-08-01 00:00:00"), tz = "UTC"))
  expect_identical(round_date(x, "year"), 
    as.POSIXct(c("2010-01-01 00:00:00", 
      "2011-01-01 00:00:00"), tz = "UTC"))
})

test_that("floor_date works for a variety of formats",{
  x <- as.POSIXct("2009-08-03 12:01:59", tz = "UTC")
  
  expect_identical(floor_date(x, "minute"), 
    as.POSIXct("2009-08-03 12:01:00", tz = "UTC"))
  expect_identical(floor_date(as.Date(x), "month"), 
    as.Date("2009-08-01"))
  expect_identical(floor_date(as.POSIXlt(x), "minute"), 
    as.POSIXlt(as.POSIXct("2009-08-03 12:01:00", tz = "UTC")))
})

test_that("ceiling_date works for a variety of formats",{
  x <- as.POSIXct("2009-08-03 12:01:59", tz = "UTC")
  
  expect_identical(ceiling_date(x, "minute"), 
    as.POSIXct("2009-08-03 12:02:00", tz = "UTC"))
  expect_identical(ceiling_date(as.Date(x), "month"), 
    as.Date("2009-09-01"))
  expect_identical(ceiling_date(as.POSIXlt(x), "minute"), 
    as.POSIXlt(as.POSIXct("2009-08-03 12:02:00", tz = 
    "UTC")))
})

test_that("round_date works for a variety of formats",{
  x <- as.POSIXct("2009-08-03 12:01:59", tz = "UTC")
  
  expect_identical(round_date(x, "minute"), 
    as.POSIXct("2009-08-03 12:02:00", tz = "UTC"))
  expect_identical(round_date(as.Date(x), "month"), 
    as.Date("2009-08-01"))
  expect_identical(round_date(as.POSIXlt(x), "minute"), 
    as.POSIXlt(as.POSIXct("2009-08-03 12:02:00", tz = 
    "UTC")))
})

test_that("ceiling_date does not round up dates that are already on a boundary",{
  expect_equal(ceiling_date(as.Date("2012-09-27"), 'day'), as.Date("2012-09-27"))
})

test_that("floor_date does not round down dates that are already on a boundary",{
  expect_equal(floor_date(as.Date("2012-09-27"), 'day'), as.Date("2012-09-27"))
})

test_that("round_date does not round dates that are already on a boundary",{
  expect_equal(round_date(as.Date("2012-09-27"), 'day'), as.Date("2012-09-27"))
})