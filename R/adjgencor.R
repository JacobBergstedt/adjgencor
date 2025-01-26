

get_cor <- function(m) {

  res <- m[grepl("T1~~T2", paste0(m$lhs, m$op, m$rhs)), c("STD_Genotype" , "STD_Genotype_SE", "p_value")]
  tibble::tibble(rg = res[[1]], rg_se = as.numeric(res[[2]]), P = as.numeric(res[[3]]))

}

fit_gen_cov <- function(TraitX,
                        TraitY,
                        Traits_to_adjust_for,
                        Trait_X_path,
                        Trait_Y_path,
                        Traits_to_adjust_for_paths,
                        Trait_X_sample_prev,
                        Trait_Y_sample_prev,
                        Traits_to_adjust_for_sample_prev,
                        Trait_X_pop_prev,
                        Trait_Y_pop_prev,
                        Traits_to_adjust_for_pop_prev,
                        path_to_LD_scores) {

  var_list <- c(TraitX, TraitY, Traits_to_adjust_for)
  var_paths <- c(Trait_X_path, Trait_Y_path, Traits_to_adjust_for_paths)
  sample_prev <- c(Trait_X_sample_prev, Trait_Y_sample_prev, Traits_to_adjust_for_sample_prev)
  pop_prev <- c(Trait_X_pop_prev, Trait_Y_pop_prev, Traits_to_adjust_for_pop_prev)



  keys <- tibble::tibble(Output_munged = var_paths,
                         Sample_prev = sample_prev,
                         Pop_prev = pop_prev,
                         Trait = var_list)

  ld <- paste0(path_to_LD_scores, "/eur_w_ld_chr/")
  wld <- ld
  gen_cov <- GenomicSEM::ldsc(keys$Output_munged,
                  sample.prev = keys$Sample_prev,
                  population.prev = keys$Pop_prev,
                  ld = path_to_LD_scores,
                  wld = path_to_LD_scores,
                  trait.names = keys$Trait)


}

fit_adjusted_model <- function(TraitX, TraitY, Traits_to_adjust_for, gen_cov) {

  adjust <- paste0(Traits_to_adjust_for, collapse = " + ")
  res_traits <- tibble::tibble(TraitX = TraitX, TraitY = TraitY)
  spec <- glue::glue("T1 =~ {TraitX}",
                     "T2 =~ {TraitY}",
                     "T1 ~ {adjust}",
                     "T2 ~ {adjust}",
                     .sep = "\n")

  m <- GenomicSEM::usermodel(gen_cov,
                 estimation = "DWLS",
                 model = spec,
                 CFIcalc = TRUE,
                 std.lv = TRUE,
                 imp_cov = FALSE)

  res <- get_cor(m$results)
  res$Adjust_for <- adjust
  dplyr::bind_cols(res_traits, res)



}

fit_unadjusted_model <- function(TraitX, TraitY, gen_cov = gen_cov) {

  res_traits <- tibble::tibble(TraitX = TraitX, TraitY = TraitY)
  spec <- glue::glue("T1 =~ {TraitX}", "T2 =~ {TraitY}", .sep = "\n")
  m <- GenomicSEM::usermodel(gen_cov,
                 estimation = "DWLS",
                 model = spec,
                 CFIcalc = TRUE,
                 std.lv = TRUE,
                 imp_cov = FALSE)
  res <- get_cor(m$results)
  res$Adjust_for <- "Nothing"
  dplyr::bind_cols(res_traits, res)


}


#' @export
adjgencor <- function(TraitX,
                      TraitY,
                      Traits_to_adjust_for,
                      Trait_X_path,
                      Trait_Y_path,
                      Traits_to_adjust_for_paths = NULL,
                      Trait_X_sample_prev,
                      Trait_Y_sample_prev,
                      Traits_to_adjust_for_sample_prev = NULL,
                      Trait_X_pop_prev,
                      Trait_Y_pop_prev,
                      Traits_to_adjust_for_pop_prev = NULL,
                      path_to_LD_scores) {



  gen_cov <- fit_gen_cov(TraitX,
                         TraitY,
                         Traits_to_adjust_for,
                         Trait_X_path,
                         Trait_Y_path,
                         Traits_to_adjust_for_paths,
                         Trait_X_sample_prev,
                         Trait_Y_sample_prev,
                         Traits_to_adjust_for_sample_prev,
                         Trait_X_pop_prev,
                         Trait_Y_pop_prev,
                         Traits_to_adjust_for_pop_prev,
                         path_to_LD_scores)

  if (is.null(Traits_to_adjust_for_paths) & is.null(Traits_to_adjust_for_sample_prev) & is.null(Traits_to_adjust_for_pop_prev)) {

    fit_unadjusted_model(TraitX, TraitY, gen_cov)

  } else {

    fit_adjusted_model(TraitX, TraitY, Traits_to_adjust_for = Traits_to_adjust_for, gen_cov = gen_cov)

  }


}
