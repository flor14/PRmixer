---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# PRmixer

<!-- badges: start -->
<!-- badges: end -->

The package **P**eer **R**eview **Mixer** (PRMixer) goal is to assign randomly students from one group as reviewers of another group. The function ` PRmixer::assign_reviewers()` considers that: (1) students cannot be assigned as reviewers of their same group, (2) all groups must have reviewers.

## Installation

You can install the released version of PRmixer from [CRAN](https://CRAN.R-project.org) with:

```r
install.packages("PRmixer")
```

And the development version from [GitHub](https://github.com/) with:

```r
# install.packages("devtools")
devtools::install_github("flor14/PRmixer")
```
## Example

This is a basic example which shows you how to solve a common problem:


```r
library(PRmixer)

## basic example code
assign_reviewer(seed = 2021,
                dataset = PRmixer::students,
                groups_rw = 30,
                reviewers = 4)
#> # A tibble: 116 x 6
#>     name surname     preferred_name lab   group_num group_to_review
#>    <dbl> <chr>       <chr>          <chr>     <dbl>           <int>
#>  1     1 Riley       My-Phuong      L01           1               8
#>  2     2 Thompson    Leon           L01           1               7
#>  3     3 Cordero     Claudio        L01           1              15
#>  4     4 el-Nasser   Zaid           L01           1              27
#>  5     5 Lomeli      Lauren         L01           2               8
#>  6     6 Maestas     Shriya         L01           2              13
#>  7     7 Acosta      Jacqueline     L01           2              21
#>  8     8 Simmons     Alyssa         L01           2               7
#>  9     9 Dilka-Garza Carolina       L01           3               7
#> 10    10 Delong      Tiffany        L01           3              28
#> # ... with 106 more rows
```
**Note:** The students names for this example have been created by `randomNames` package.
