
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gsplyr

<!-- badges: start -->
<!-- badges: end -->

The goal of gsplyr is to provide a set of functions designed for the
manipulation of Google Slides. There are functions for obtaining the
presentation ID, constructing a link for exporting image files, and
downloading Google Slides in PPTX format.

## Installation

You can install the development version of gsplyr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("fhdsl/gsplyr")
```

## Example

``` r
library(gsplyr)
example_link <- "https://docs.google.com/presentation/d/1Dw_rBb1hySN_76xh9-x5J2dWF_das9BAUjQigf2fN-E/edit?usp=sharing"

# Download to temp directory
download(link = example_link)

# Derive presentation ID
derive_presentation_id(example_link)
```
