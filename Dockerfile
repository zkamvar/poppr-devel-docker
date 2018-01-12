# Start with R-devel with Address Sanitizer
FROM rocker/r-devel-ubsan-clang:latest

RUN apt-get -y update -qq \ 
&&  apt-get -y install -t unstable libxml2-dev libssl-dev \
&&  apt-get -y install pandoc pandoc-citeproc \
&&  ASAN_OPTIONS=detect_leaks=0 RD -e "install.packages(c('MASS', 'lattice', 'nlme', 'mgcv', 'Matrix', 'boot', 'cluster'), .Library, repos = 'http://cran.rstudio.org')" \
&&  ASAN_OPTIONS=detect_leaks=0 RD -e 'source("http://bioconductor.org/biocLite.R"); biocLite("Biostrings");' \
&&  ASAN_OPTIONS=detect_leaks=0 RD -e 'install.packages(c("devtools", "poppr"), dep = TRUE, repos= "http://cran.rstudio.org");';
