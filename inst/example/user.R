deg2time <- function(x) {
    hour <- x * 24 / 360
    minute <- (hour - floor(hour)) * 60
    second <- (minute - floor(minute)) * 60
    paste0(floor(hour), "h ", floor(minute), "m ", second, "s")
}
new_year_1990 <- 2447892.5
positions <- swe_calc(tjd_et=new_year_1990, ipl=2:6, 2048)
data.frame(a = positions$xx[,1],
           A = deg2time(positions$xx[,1]))


