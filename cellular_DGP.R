###
library(magrittr)
library(dplyr)
# source(file.path(file.path(Sys.getenv("HOME"), "projects", "afbiz", "code", "conf.R")

callsDGP <- function(nMsisdn, start="2014-01-01", end="2014-05-01") {
   ## create test call files and save into TEST_CALLSDIR
   rDate <- function(n, st="2014-01-01", et="2014-05-01") {
      origin <- ISOdatetime(lubridate::year(st), lubridate::month(st), lubridate::day(st),
                            0,0,0, tz="Asia/Kabul")
      end <- ISOdatetime(lubridate::year(et), lubridate::month(et), lubridate::day(et),
                         0,0,0, tz="Asia/Kabul")
      span <- difftime(end, origin, units="secs")
      as.POSIXct(runif(n, 0, span), origin=origin, tz="America/Los_Angeles")
   }
   msisdnList <- seq(206001, 206000 + nMsisdn)
   nCalls <- 1 + rpois(length(msisdnList),
                       lambda=2*difftime(end, start, units="days"))
                           # in average 1 + 2 calls per day
   ## callingcellid
   
   ##
   calls <- data.frame(callingpartynumber=rep(msisdnList, nCalls),
                       call_date = rDate(sum(nCalls)),
                       callingcellid = cells,
                       district = districts)
}


mRankDGP <- function(nMsisdn) {
   msisdnList <- seq(206001, 206000 + nMsisdn)
                           # msisdns
   ym <- seq(as.Date("2014-04-01"), as.Date("2014-08-01"), by="month") %>%
      format("%Y-%m")
   dMsisdn <- 1 + rpois(nMsisdn, 5)
                           # districts per msisdn. Don't want 0-s
                           # same number of districts each month
   print(dMsisdn)
   expand.grid(msisdn=msisdnList, ym=ym, stringsAsFactors=FALSE) %>%
      group_by(msisdn, ym) %>%
      mutate(district = list(sample(101:199, dMsisdn[match(msisdn, msisdnList)]))) %>%
      tidyr::unnest()
}

mdCountsDGP <- function(mRank) {
   ## mRank: monthly rank data, to speed the process up
   ymd <- seq(as.Date("2014-04-01"), as.Date("2014-08-31"), by="day") %>%
      format("%Y-%m")
   msisdnList <- unique(mRank$msisdn)
   expand.grid(msisdn=msisdnList, ymd=ymd, stringsAsFactors=FALSE) %>%
      group_by(msisdn, ym) %>%
      mutate(district = list(sample(101:199, dMsisdn[match(msisdn, msisdnList)]))) %>%
      tidyr::unnest()
   
}
