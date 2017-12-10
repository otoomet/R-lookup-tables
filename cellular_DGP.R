###
library(magrittr)
library(dplyr)

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
   ymd <- seq(as.Date("2014-04-01"), as.Date("2014-08-31"), by="day") %>%
      format("%Y-%m")
   msisdnList <- unique(
   expand.grid(msisdn=msisdnList, ymd=ymd, stringsAsFactors=FALSE) %>%
      group_by(msisdn, ym) %>%
      mutate(district = list(sample(101:199, dMsisdn[match(msisdn, msisdnList)]))) %>%
      tidyr::unnest()
   
}
