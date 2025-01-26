
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
al. Hum Mol Gen 2018 sumstats. You can see that BMI explains a small
amount of genetic correlation MDD and CAD.

``` r
library(adjgencor)
library(tidyverse)
gen_cor_unadjusted <- adjgencor("CAD", "MDD", NULL, "Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt", "Data/MDDAls2023.sumstats.gz", NULL, 0.15, 0.15, NULL, 0.15, 0.15, NULL, "REF/eur_w_ld_chr/")
#> Multivariate ld-score regression of 2 traits (Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt Data/MDDAls2023.sumstats.gz) began at: 2025-01-26 12:33:37
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
#> LDSC finished running at 2025-01-26 12:34:02
#> Running LDSC for all files took 0 minutes and 24 seconds
#> [1] "Running primary model"
#> [1] "Calculating CFI"
#> [1] "Calculating Standardized Results"
#> [1] "Calculating SRMR"
#> elapsed 
#>    0.36 
#> [1] "Model fit statistics are all printed as NA as you have specified a fully saturated model (i.e., df = 0)"
gen_cor_adjusted <- adjgencor("CAD", "MDD", "BMI", "Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt", "Data/MDDAls2023.sumstats.gz", "Data/GIANT_UKB_2018_BMI_munged.txt", 0.15, 0.15, NA, 0.15, 0.15, NA, "REF/eur_w_ld_chr/")
#> Multivariate ld-score regression of 3 traits (Data/CARDIoGRAMplusC4D_2022_CAD_EUR_munged.txt Data/MDDAls2023.sumstats.gz Data/GIANT_UKB_2018_BMI_munged.txt) began at: 2025-01-26 12:34:02
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
#> LDSC finished running at 2025-01-26 12:34:46
#> Running LDSC for all files took 0 minutes and 43 seconds
#> [1] "Running primary model"
#> [1] "Calculating CFI"
#> [1] "Calculating Standardized Results"
#> [1] "Calculating SRMR"
#> elapsed 
#>    0.41 
#> [1] "Model fit statistics are all printed as NA as you have specified a fully saturated model (i.e., df = 0)"
bind_rows(gen_cor_unadjusted, gen_cor_adjusted)
#> # A tibble: 2 x 6
#>   TraitX TraitY    rg  rg_se        P Adjust_for
#>   <chr>  <chr>  <dbl>  <dbl>    <dbl> <chr>     
#> 1 CAD    MDD    0.246 0.0186 3.85e-40 Nothing   
#> 2 CAD    MDD    0.217 0.0196 1.15e-28 BMI
```
