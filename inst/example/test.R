library(swephR)

SEtest <- function(date = Sys.Date()) {
    SE <- SEConstants()
    iflag <- SE$FLG_SPEED
    date  <- as.Date(date)
    year <- as.integer(format(date, "%Y"))
    month <- as.integer(format(date, "%m"))
    day <- as.integer(format(date, "%d"))
    hour <- 12
    #determine julian day number (at 12:00 GMT)
    tjd_ut <- swe_julday(year, month, day, hour, SE$GREG_CAL)

    planets <- SE$SUN:SE$OSCU_APOG
    
    result <- swe_calc(tjd_ut, planets, iflag)

    result$xx <- as.data.frame(result$xx[1:5,])
    names(result$xx) <- c("longitude", "latitude", "distance", "long. speed", "lat. speed")
    result$xx$palnetname <- swe_get_planet_name(planets)
    result$xx
}

SEtest()



 com=Rcpp::cppFunction("
        NumericVector comp(NumericVector x, NumericVector y) {
            R_xlen_t m = x.size();
            R_xlen_t n = y.size();
            double sp = sqrt(((m-1)*pow(sd(x),2) + (n-1)*pow(sd(y),2))/ (m+n-2));
            double tstat = (mean(x) - mean(y)) / (sp*sqrt(1/m + 1/n));
            return R::pt( abs(tstat), n+m-2, 1, 0);
        }")
