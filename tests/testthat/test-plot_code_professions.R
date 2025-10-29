test_that("plot_code_professions renvoie une erreur pour un schéma incorrect", {
  df_Nantes_invalide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes") |>
    dplyr::select(-`Code de la catégorie socio-professionnelle`)

  expect_error(plot_code_professions(df_Nantes_invalide))
})

test_that("plot_code_professions fonctionne avec un schéma valide", {
  df_Nantes_valide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  expect_silent(plot_code_professions(df_Nantes_valide))
})



test_that("plot_code_professions fonctionne sans erreur et génère un graphique ggplot", {
  df_Nantes <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")  # Sélection d'une seule commune

  # Vérifier qu'il n'y a pas d'erreurs, d'avertissements ou de messages pendant l'exécution de la fonction
  expect_error(plot_code_professions(df_Nantes), NA)  # Aucune erreur ne doit être générée
  expect_warning(plot_code_professions(df_Nantes), NA)  # Aucun avertissement ne doit être généré
  expect_message(plot_code_professions(df_Nantes), NA)  # Aucun autre message ne doit être généré

  # Vérifier que le résultat est un objet ggplot
  resultat <- plot_code_professions(df_Nantes)
  expect_s3_class(resultat, "gg")  # Vérifier que c'est un objet ggplot

  # Vérifier qu'un graphique est effectivement généré sans message
  expect_silent(plot_code_professions(df_Nantes))  # Vérifier qu'aucun message n'est affiché lors du rendu du graphique
})
