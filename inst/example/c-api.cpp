#include <Rcpp.h>
// [[Rcpp::depends(swephR)]]
#include <swephapi.h>

// [[Rcpp::export]]
std::array<double, 6> foo(double tjd, int ipl, int iflag = 0) {
    std::array<char, 256> serr;
    std::array<double, 6> xx;
    int rc = swe_calc(tjd, ipl, iflag, &xx[0], &serr[0]);
    
    if (rc < 0)
      Rcpp::stop("Error");

    return xx;
}


/*** R
foo(123.456, 1)
*/
