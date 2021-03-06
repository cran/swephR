% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RcppExports.R
\name{Section1}
\alias{Section1}
\alias{swe_set_ephe_path}
\alias{swe_close}
\alias{swe_set_jpl_file}
\alias{swe_version}
\alias{swe_get_library_path}
\title{Section 1: The Ephemeris file related functions}
\usage{
swe_set_ephe_path(path)

swe_close()

swe_set_jpl_file(fname)

swe_version()

swe_get_library_path()
}
\arguments{
\item{path}{Directory for the sefstars.txt, swe_deltat.txt and jpl files}

\item{fname}{JPL ephemeris name as string (JPL ephemeris file, e.g. de431.eph)}
}
\value{
\code{swe_version} returns Swiss Ephemeris software version as string

\code{swe_get_library_path} returns the path in which the executable resides as string
}
\description{
Several initialization functions
}
\details{
\describe{
  \item{swe_set_ephe_path()}{This is the first function that should be called
       before any other function of the Swiss Ephemeris. Even if you don't
       want to set an ephemeris path and use the Moshier ephemeris, it is
       nevertheless recommended to call swe_set_ephe_path(NULL), because this
       function makes important initializations. If you don't do that, the
       Swiss Ephemeris may work, but the results may be not 100\% consistent.}
  \item{swe_close()}{At the end of your computations this function releases most
       resources (open files and allocated memory) used by Swiss Ephemeris.}
  \item{swe_set_jpl_file()}{Set name of JPL ephemeris file.}
  \item{swe_version()}{The function provides the version number of the Swiss Ephemeris software.}
  \item{swe_get_library_path()}{The function provides the path where the executable resides.}
}
}
\examples{
\dontrun{swe_set_ephe_path("c:\\\\sweph\\\\ephe")}
swe_close()
swe_set_jpl_file("de431.eph")
swe_version()
swe_get_library_path()
}
\seealso{
Section 1 in \url{http://www.astro.com/swisseph/swephprg.htm}. Remember that array indices start in R at 1, while in C they start at 0!
}
