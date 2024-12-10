adjgencor <- function(spec, inv) {



  gen_cov <- fit_gen_cov(spec, inv)

  if (is.na(spec$Adjustment)) {

    fit_unadjusted_model(spec$Trait1, spec$Trait2, gen_cov = gen_cov)

  }


  else {

    fit_adjusted_model(spec$Trait1, spec$Trait2, adjust = spec$Adjustment, gen_cov = gen_cov)

  }

}
