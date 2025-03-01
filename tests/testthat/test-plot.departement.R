test_that("plot.departement renvoie une erreur pour un schéma incorrect", {
  df_Loire_Atlantique_invalide <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")

  df_Loire_Atlantique_invalide <- structure(df_Loire_Atlantique_invalide, class = c("departement", class(df_Loire_Atlantique_invalide)))

  # Suppression d'une colonne
  df_Loire_Atlantique_invalide <- dplyr::select(df_Loire_Atlantique_invalide, -`Libellé du département`)

  expect_error(plot.departement(df_Loire_Atlantique_invalide))
})

test_that("plot.departement fonctionne avec un schéma valide", {
  df_Loire_Atlantique_valide <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")

  df_Loire_Atlantique_valide <- structure(df_Loire_Atlantique_valide, class = c("departement", class(df_Loire_Atlantique_valide)))

  expect_silent(plot.departement(df_Loire_Atlantique_valide))  # Vérifie qu'il n'y a pas d'erreur
})



test_that("plot.departement renvoie une erreur si le dataframe n'est pas de classe 'departement'", {
  df_Loire_Atlantique_pas_departement <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")  # Pas explicitement une classe 'departement'

  expect_error(plot.departement(df_Loire_Atlantique_pas_departement))
})

test_that("plot.departement fonctionne avec un dataframe de classe 'departement'", {
  df_Loire_Atlantique_departement <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")

  df_Loire_Atlantique_departement <- structure(df_Loire_Atlantique_departement, class = c("departement", class(df_Loire_Atlantique_departement)))

  expect_silent(plot.departement(df_Loire_Atlantique_departement))  # Vérifie qu'il n'y a pas d'erreur
})



test_that("plot.departement fonctionne sans erreur et génère un graphique ggplot", {
  df_Loire_Atlantique <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")  # Sélection d'un seul département

  df_Loire_Atlantique <- structure(df_Loire_Atlantique, class = c("departement", class(df_Loire_Atlantique)))

  # Vérifier qu'il n'y a pas d'erreurs, d'avertissements ou de messages pendant l'exécution de la fonction
  expect_error(plot.departement(df_Loire_Atlantique), NA)  # Aucune erreur ne doit être générée
  expect_warning(plot.departement(df_Loire_Atlantique), NA)  # Aucun avertissement ne doit être généré
  expect_message(plot.departement(df_Loire_Atlantique), NA)  # Aucun autre message ne doit être généré

  # Vérifier que le résultat est un objet ggplot
  resultat <- plot.departement(df_Loire_Atlantique)
  expect_s3_class(resultat, "gg")  # Vérifier que c'est un objet ggplot

  # Vérifier qu'un graphique est effectivement généré sans message
  expect_silent(plot.departement(df_Loire_Atlantique))  # Vérifier qu'aucun message n'est affiché lors du rendu du graphique
})
