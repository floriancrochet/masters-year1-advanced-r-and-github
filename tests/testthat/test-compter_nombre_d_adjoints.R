test_that("compter_nombre_d_adjoints renvoie une erreur pour un schéma incorrect", {
  df_Nantes_invalide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes") |>
    dplyr::select(-`Libellé de la fonction`)  # Retrait de la colonne utilisée par la fonction

  expect_error(compter_nombre_d_adjoints(df_Nantes_invalide))
})

test_that("compter_nombre_d_adjoints fonctionne avec un schéma valide", {
  df_Nantes_valide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  expect_silent(compter_nombre_d_adjoints(df_Nantes_valide))  # Vérifie qu'il n'y a pas d'erreur
})



test_that("compter_nombre_d_adjoints renvoie le nombre correct d'adjoints", {
  # Utilisation du jeu de données df_Nantes_identique
  df_Nantes_identique <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  # Vérification que le résultat de compter_nombre_d_adjoints est identique à 26
  expect_identical(compter_nombre_d_adjoints(df_Nantes_identique), as.integer(26))
})
