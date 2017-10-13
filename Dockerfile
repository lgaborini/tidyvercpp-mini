FROM rocker/r-base:latest
LABEL maintainer="lorenzo.gaborini@gmail.com"

## tidyveRcpp
## rocker/r-base:latest with devtools, tidyverse, Rcpp, RcppArmadillo and dependencies
## 
## Base Dockerfile from rocker-versioned/tidyverse

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libcurl4-openssl-dev \
  libxml2-dev \
  libssh2-1-dev \
  libssl-dev
RUN R -e "source('https://bioconductor.org/biocLite.R')" && install2.r --error --deps TRUE \
    Rcpp \
    RcppArmadillo \
    tidyverse \
    dplyr \
    ggplot2 \
    devtools \
    remotes

## Notes: Above install2.r uses --deps TRUE to get Suggests dependencies as well,
## dplyr and ggplot are already part of tidyverse, but listed explicitly to get their (many) suggested dependencies.
## In addition to the the title 'tidyverse' packages, devtools is included for package development.
## remotes included for installation from heterogenous sources including git/svn, local, url, and specific cran versions
