test_that("compter_nombre_d_elus renvoie une erreur pour un schéma incorrect", {
  df_Nantes_invalide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes") |>
    dplyr::select(-`Nom de l'élu`, -`Prénom de l'élu`, -`Date de naissance`)  # Retrait des colonnes utilisées par la fonction

  expect_error(compter_nombre_d_elus(df_Nantes_invalide))
})

test_that("compter_nombre_d_elus fonctionne avec un schéma valide", {
  df_Nantes_valide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  expect_silent(compter_nombre_d_elus(df_Nantes_valide))  # Vérifie qu'il n'y a pas d'erreur
})



test_that("compter_nombre_d_elus renvoie le nombre correct d'élus", {
  # Utilisation du jeu de données df_Nantes_identique
  df_Nantes_identique <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  # Vérification que le résultat de compter_nombre_d_elus est identique à 66
  expect_identical(compter_nombre_d_elus(df_Nantes_identique), as.integer(66))
})
