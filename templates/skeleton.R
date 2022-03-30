#!~/mambaforge/envs/r/bin/Rscript

# about:

# options
options(stringsAsFactors = FALSE, dplyr.summarise.inform = FALSE)

# libraries
library(tidyverse)
library(cowplot)
library(fs)
library(DBI)
library(dbplyr)

# config
