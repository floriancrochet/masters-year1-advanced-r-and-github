test_that("summary.departement renvoie une erreur pour un schéma incorrect", {
  df_Loire_Atlantique_invalide <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")

  df_Loire_Atlantique_invalide <- structure(df_Loire_Atlantique_invalide, class = c("departement", class(df_Loire_Atlantique_invalide)))

  # Suppression d'une colonne
  df_Loire_Atlantique_invalide <- dplyr::select(df_Loire_Atlantique_invalide, -`Libellé du département`)

  expect_error(summary.departement(df_Loire_Atlantique_invalide))
})

test_that("summary.departement fonctionne avec un dataframe de classe 'departement' et un schéma valide", {
  df_Loire_Atlantique_valide <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")

  df_Loire_Atlantique_valide <- structure(df_Loire_Atlantique_valide, class = c("departement", class(df_Loire_Atlantique_valide)))

  # Vérifie que la fonction n'a pas produit de messages d'erreur ou d'avertissement
  expect_message(summary.departement(df_Loire_Atlantique_valide), NA)
})



test_that("summary.departement renvoie une erreur si le dataframe n'est pas de classe 'departement'", {
  df_Loire_Atlantique_pas_departement <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")  # Pas explicitement une classe 'departement'

  expect_error(summary.departement(df_Loire_Atlantique_pas_departement))
})



test_that("summary.departement(df_Loire_Atlantique) s'exécute sans erreur, avertissement ou message", {
  df_Loire_Atlantique <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")  # Sélection d'un seul département

  df_Loire_Atlantique <- structure(df_Loire_Atlantique, class = c("departement", class(df_Loire_Atlantique)))

  # Vérifier qu'il n'y a pas d'erreur, d'avertissement ou de message
  expect_error(summary.departement(df_Loire_Atlantique), NA)
  expect_warning(summary.departement(df_Loire_Atlantique), NA)
  expect_message(summary.departement(df_Loire_Atlantique), NA)
})

