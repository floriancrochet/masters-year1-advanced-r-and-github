test_that("calcul_distribution_age renvoie une erreur pour un schéma incorrect", {
  df_Nantes_invalide <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes") |>
    dplyr::select(-`Date de naissance`)

  expect_error(calcul_distribution_age(df_Nantes_invalide))
})

test_that("calcul_distribution_age fonctionne avec un schéma valide", {
  df_Nantes_valide <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  expect_silent(calcul_distribution_age(df_Nantes_valide))
})



test_that("calcul_distribution_age renvoie la distribution des âges correcte", {
  # Utilisation du jeu de données df_Nantes_identique
  df_Nantes_identique <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  # Résultat attendu : une tibble avec les statistiques de distribution des âges
  distribution_esperee <- tibble::tibble(
    Nom = "Nantes",
    Min = 28,
    Q1 = 42,
    Médiane = 50,
    Moyenne = 50,
    Q3 = 58,
    Max = 73
  )

  # Vérification que le résultat de calcul_distribution_age correspond à distribution_esperee
  expect_identical(calcul_distribution_age(df_Nantes_identique), distribution_esperee)
})
