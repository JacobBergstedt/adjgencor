
<!-- README.md is generated from README.Rmd. Please edit that file -->

# adjgencor

<!-- badges: start -->
<!-- badges: end -->

adjgencor is an R package to compute GWAS-based genetic correlation
between two traits adjusted for the genetic component of other traits.

## Installation

You can install the development version of adjgencor from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("JacobBergstedt/adjgencor")
```

## Example

We compute genetic correlation of major depressive disorder (MDD) with
coronary artery disease (CAD) using the Als et al. Nature medicine 2023
and Aragam et al. Nature genetics 2022 summary statistics. We then
compute the genetic correlation adjusted on BMI using the Yengo et
al. Hum Mol Gen 2018 sumstats.

``` r
library(adjgencor)
library(tidyverse)
#> -- Attaching core tidyverse packages ------------------------ tidyverse 2.0.0 --
#> v dplyr     1.1.4     v readr     2.1.5
#> v forcats   1.0.0     v stringr   1.5.1
#> v ggplot2   3.5.1     v tibble    3.2.1
#> v lubridate 1.9.3     v tidyr     1.3.1
#> v purrr     1.0.2     
#> -- Conflicts ------------------------------------------ tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
#> i Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
gen_cor_unadjusted <- adjgencor("CAD", "MDD", NULL, "Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt", "Data/MDDAls2023.sumstats.gz", NULL, 0.15, 0.15, NULL, 0.15, 0.15, NULL, "REF/eur_w_ld_chr/")
#> Warning: replacing previous import 'gdata::nobs' by 'lavaan::nobs' when loading
#> 'GenomicSEM'
#> Warning: replacing previous import 'gdata::last' by 'data.table::last' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'gdata::first' by 'data.table::first' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'gdata::env' by 'R.utils::env' when loading
#> 'GenomicSEM'
#> Warning: replacing previous import 'gdata::resample' by 'R.utils::resample' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'data.table::last' by 'dplyr::last' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'plyr::summarize' by 'dplyr::summarize' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'plyr::mutate' by 'dplyr::mutate' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'plyr::id' by 'dplyr::id' when loading
#> 'GenomicSEM'
#> Warning: replacing previous import 'plyr::arrange' by 'dplyr::arrange' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'plyr::summarise' by 'dplyr::summarise' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'data.table::first' by 'dplyr::first' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'plyr::rename' by 'dplyr::rename' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'plyr::desc' by 'dplyr::desc' when loading
#> 'GenomicSEM'
#> Warning: replacing previous import 'plyr::count' by 'dplyr::count' when loading
#> 'GenomicSEM'
#> Warning: replacing previous import 'gdata::combine' by 'dplyr::combine' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'data.table::between' by 'dplyr::between'
#> when loading 'GenomicSEM'
#> Warning: replacing previous import 'plyr::failwith' by 'dplyr::failwith' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'Matrix::tail' by 'utils::tail' when loading
#> 'GenomicSEM'
#> Warning: replacing previous import 'Rcpp::.DollarNames' by 'utils::.DollarNames'
#> when loading 'GenomicSEM'
#> Warning: replacing previous import 'Rcpp::prompt' by 'utils::prompt' when
#> loading 'GenomicSEM'
#> Warning: replacing previous import 'Matrix::head' by 'utils::head' when loading
#> 'GenomicSEM'
#> Warning: replacing previous import 'R.utils::timestamp' by 'utils::timestamp'
#> when loading 'GenomicSEM'
#> Warning: replacing previous import 'gdata::object.size' by 'utils::object.size'
#> when loading 'GenomicSEM'
#> Multivariate ld-score regression of 2 traits (Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt Data/MDDAls2023.sumstats.gz) began at: 2025-01-26 12:20:22
#> Reading in LD scores
#> Read in summary statistics [1/2] from: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt
#> Out of 1198398 SNPs, 1180102 remain after merging with LD-score files
#> Removing 3 SNPs with Chi^2 > 1165.72; 1180099 remain
#> Read in summary statistics [2/2] from: Data/MDDAls2023.sumstats.gz
#> Out of 1128260 SNPs, 1124313 remain after merging with LD-score files
#> Removing 0 SNPs with Chi^2 > 1035.76; 1124313 remain
#> Estimating heritability [1/3] for: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt
#> Please note that the results initially printed to the screen and log file reflect the NON-liability h2 and cov_g. However, a liability conversion is being used for trait Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt when creating the genetic covariance matrix used as input for Genomic SEM and liability scale results are printed at the end of the log file.
#> Heritability Results for trait: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt
#> Mean Chi^2 across remaining SNPs: 1.752
#> Lambda GC: 1.4138
#> Intercept: 1.0045 (0.0197)
#> Ratio: 0.006 (0.0262)
#> Total Observed Scale h2: 0.0333 (0.0022)
#> h2 Z: 15
#> Calculating genetic covariance [2/3] for traits: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt and Data/MDDAls2023.sumstats.gz
#> 1123123 SNPs remain after merging Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt and Data/MDDAls2023.sumstats.gz summary statistics
#> Results for genetic covariance between: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt and Data/MDDAls2023.sumstats.gz
#> Mean Z*Z: 0.2156
#> Cross trait Intercept: 0.0184 (0.0069)
#> Total Observed Scale Genetic Covariance (g_cov): 0.0095 (7e-04)
#> g_cov Z: 13.1
#> g_cov P-value: 2.7812e-39
#> Estimating heritability [3/3] for: Data/MDDAls2023.sumstats.gz
#> Please note that the results initially printed to the screen and log file reflect the NON-liability h2 and cov_g. However, a liability conversion is being used for trait Data/MDDAls2023.sumstats.gz when creating the genetic covariance matrix used as input for Genomic SEM and liability scale results are printed at the end of the log file.
#> Heritability Results for trait: Data/MDDAls2023.sumstats.gz
#> Mean Chi^2 across remaining SNPs: 1.9348
#> Lambda GC: 1.668
#> Intercept: 1.0174 (0.0128)
#> Ratio: 0.0186 (0.0137)
#> Total Observed Scale h2: 0.0451 (0.0016)
#> h2 Z: 27.9
#> Liability Scale Results
#> Liability scale results for: CAD
#> Total Liability Scale h2: 0.078 (0.0052)
#> Total Liability Scale Genetic Covariance between CAD and MDD: 0.0224 (0.0017)
#> Liability scale results for: MDD
#> Total Liability Scale h2: 0.1057 (0.0038)
#> Genetic Correlation Results
#> Genetic Correlation between CAD and MDD: 0.2462 (0.0188)
#> LDSC finished running at 2025-01-26 12:20:45
#> Running LDSC for all files took 0 minutes and 22 seconds
#> [1] "Running primary model"
#> [1] "Calculating CFI"
#> [1] "Calculating Standardized Results"
#> [1] "Calculating SRMR"
#> elapsed 
#>    0.35 
#> [1] "Model fit statistics are all printed as NA as you have specified a fully saturated model (i.e., df = 0)"
gen_cor_adjusted <- adjgencor("CAD", "MDD", "BMI", "Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt", "Data/MDDAls2023.sumstats.gz", "Data/GIANT_UKB_2018_BMI_munged.txt", 0.15, 0.15, NA, 0.15, 0.15, NA, "REF/eur_w_ld_chr/")
#> Multivariate ld-score regression of 3 traits (Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt Data/MDDAls2023.sumstats.gz Data/GIANT_UKB_2018_BMI_munged.txt) began at: 2025-01-26 12:20:45
#> Reading in LD scores
#> Read in summary statistics [1/3] from: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt
#> Out of 1198398 SNPs, 1180102 remain after merging with LD-score files
#> Removing 3 SNPs with Chi^2 > 1165.72; 1180099 remain
#> Read in summary statistics [2/3] from: Data/MDDAls2023.sumstats.gz
#> Out of 1128260 SNPs, 1124313 remain after merging with LD-score files
#> Removing 0 SNPs with Chi^2 > 1035.76; 1124313 remain
#> Read in summary statistics [3/3] from: Data/GIANT_UKB_2018_BMI_munged.txt
#> Out of 1019729 SNPs, 1014859 remain after merging with LD-score files
#> Removing 6 SNPs with Chi^2 > 795.64; 1014853 remain
#> Estimating heritability [1/6] for: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt
#> Please note that the results initially printed to the screen and log file reflect the NON-liability h2 and cov_g. However, a liability conversion is being used for trait Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt when creating the genetic covariance matrix used as input for Genomic SEM and liability scale results are printed at the end of the log file.
#> Heritability Results for trait: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt
#> Mean Chi^2 across remaining SNPs: 1.752
#> Lambda GC: 1.4138
#> Intercept: 1.0045 (0.0197)
#> Ratio: 0.006 (0.0262)
#> Total Observed Scale h2: 0.0333 (0.0022)
#> h2 Z: 15
#> Calculating genetic covariance [2/6] for traits: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt and Data/MDDAls2023.sumstats.gz
#> 1123123 SNPs remain after merging Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt and Data/MDDAls2023.sumstats.gz summary statistics
#> Results for genetic covariance between: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt and Data/MDDAls2023.sumstats.gz
#> Mean Z*Z: 0.2156
#> Cross trait Intercept: 0.0184 (0.0069)
#> Total Observed Scale Genetic Covariance (g_cov): 0.0095 (7e-04)
#> g_cov Z: 13.1
#> g_cov P-value: 2.7812e-39
#> Calculating genetic covariance [3/6] for traits: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt and Data/GIANT_UKB_2018_BMI_munged.txt
#> 1014101 SNPs remain after merging Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt and Data/GIANT_UKB_2018_BMI_munged.txt summary statistics
#> Results for genetic covariance between: Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt and Data/GIANT_UKB_2018_BMI_munged.txt
#> Mean Z*Z: 0.4618
#> Cross trait Intercept: 0.027 (0.0106)
#> Total Observed Scale Genetic Covariance (g_cov): 0.0242 (0.0015)
#> g_cov Z: 15.8
#> g_cov P-value: 3.352e-56
#> Estimating heritability [4/6] for: Data/MDDAls2023.sumstats.gz
#> Please note that the results initially printed to the screen and log file reflect the NON-liability h2 and cov_g. However, a liability conversion is being used for trait Data/MDDAls2023.sumstats.gz when creating the genetic covariance matrix used as input for Genomic SEM and liability scale results are printed at the end of the log file.
#> Heritability Results for trait: Data/MDDAls2023.sumstats.gz
#> Mean Chi^2 across remaining SNPs: 1.9348
#> Lambda GC: 1.668
#> Intercept: 1.0174 (0.0128)
#> Ratio: 0.0186 (0.0137)
#> Total Observed Scale h2: 0.0451 (0.0016)
#> h2 Z: 27.9
#> Calculating genetic covariance [5/6] for traits: Data/MDDAls2023.sumstats.gz and Data/GIANT_UKB_2018_BMI_munged.txt
#> 977274 SNPs remain after merging Data/MDDAls2023.sumstats.gz and Data/GIANT_UKB_2018_BMI_munged.txt summary statistics
#> Results for genetic covariance between: Data/MDDAls2023.sumstats.gz and Data/GIANT_UKB_2018_BMI_munged.txt
#> Mean Z*Z: 0.2473
#> Cross trait Intercept: 0.0241 (0.0105)
#> Total Observed Scale Genetic Covariance (g_cov): 0.0134 (0.0016)
#> g_cov Z: 8.64
#> g_cov P-value: 5.3816e-18
#> Estimating heritability [6/6] for: Data/GIANT_UKB_2018_BMI_munged.txt
#> Heritability Results for trait: Data/GIANT_UKB_2018_BMI_munged.txt
#> Mean Chi^2 across remaining SNPs: 3.9345
#> Lambda GC: 2.7869
#> Intercept: 1.02 (0.0276)
#> Ratio: 0.0068 (0.0094)
#> Total Observed Scale h2: 0.2091 (0.0061)
#> h2 Z: 34.2
#> Liability Scale Results
#> Liability scale results for: CAD
#> Total Liability Scale h2: 0.078 (0.0052)
#> Total Liability Scale Genetic Covariance between CAD and MDD: 0.0224 (0.0017)
#> Total Liability Scale Genetic Covariance between CAD and BMI: 0.0371 (0.0023)
#> Liability scale results for: MDD
#> Total Liability Scale h2: 0.1057 (0.0038)
#> Total Liability Scale Genetic Covariance between MDD and BMI: 0.0206 (0.0024)
#> Liability scale results for: BMI
#> Total Liability Scale h2: 0.2091 (0.0061)
#> Genetic Correlation Results
#> Genetic Correlation between CAD and MDD: 0.2462 (0.0188)
#> Genetic Correlation between CAD and BMI: 0.2906 (0.0184)
#> Genetic Correlation between MDD and BMI: 0.1385 (0.016)
#> LDSC finished running at 2025-01-26 12:21:12
#> Running LDSC for all files took 0 minutes and 26 seconds
#> [1] "Running primary model"
#> [1] "Calculating CFI"
#> [1] "Calculating Standardized Results"
#> [1] "Calculating SRMR"
#> elapsed 
#>    0.58 
#> [1] "Model fit statistics are all printed as NA as you have specified a fully saturated model (i.e., df = 0)"
bind_rows(gen_cor_unadjusted,gen_cor_unadjusted)
#> # A tibble: 2 x 6
#>   TraitX TraitY    rg  rg_se        P Adjust_for
#>   <chr>  <chr>  <dbl>  <dbl>    <dbl> <chr>     
#> 1 CAD    MDD    0.246 0.0186 3.85e-40 Nothing   
#> 2 CAD    MDD    0.246 0.0186 3.85e-40 Nothing
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
