test_that("summary.commune renvoie une erreur pour un schéma incorrect", {
  df_Nantes_invalide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes") |>
    dplyr::select(-`Libellé de la commune`)  # Retrait de la colonne utilisée par la fonction

  df_Nantes_invalide <- structure(df_Nantes_invalide, class = c("commune", class(df_Nantes_invalide)))

  expect_error(summary.commune(df_Nantes_invalide))
})

test_that("summary.commune fonctionne avec un dataframe de classe 'commune' et un schéma valide", {
  df_Nantes_valide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  df_Nantes_valide <- structure(df_Nantes_valide, class = c("commune", class(df_Nantes_valide)))

  # Vérifie que la fonction n'a pas produit de messages d'erreur ou d'avertissement
  expect_message(summary.commune(df_Nantes_valide), NA)
})


test_that("summary.commune renvoie une erreur si le dataframe n'est pas de classe 'commune'", {
  df_Nantes_pas_commune <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")  # Pas explicitement une classe 'commune'

  expect_error(summary.commune(df_Nantes_pas_commune))
})



test_that("summary.commune(df_Nantes) s'exécute sans erreur, avertissement ou message", {
  df_Nantes <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")  # Sélection d'une seule commune

  df_Nantes <- structure(df_Nantes, class = c("commune", class(df_Nantes)))

  # Vérifier qu'il n'y a pas d'erreur, d'avertissement ou de message
  expect_error(summary.commune(df_Nantes), NA)
  expect_warning(summary.commune(df_Nantes), NA)
  expect_message(summary.commune(df_Nantes), NA)
})

