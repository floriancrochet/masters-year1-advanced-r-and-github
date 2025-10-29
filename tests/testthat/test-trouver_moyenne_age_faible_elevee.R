test_that("trouver_moyenne_age_faible_elevee renvoie une erreur pour un schéma incorrect", {
  df_Nantes_invalide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes") |>
    dplyr::select(-`Date de naissance`)

  expect_error(trouver_moyenne_age_faible_elevee(df_Nantes_invalide))
})

test_that("trouver_moyenne_age_faible_elevee fonctionne avec un schéma valide", {
  df_Nantes_valide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  expect_silent(trouver_moyenne_age_faible_elevee(df_Nantes_valide))
})



test_that("trouver_moyenne_age_faible_elevee renvoie les bonnes statistiques de la moyenne d'âge", {
  # Utilisation du jeu de données df_Nantes_identique
  df_Nantes_identique <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  # Résultat attendu : une tibble avec les statistiques calculées sur l'âge
  distribution_esperes <- tibble::tibble(
    Nom = rep("Nantes", 2),
    Min = c(28, 28),
    Q1 = c(42, 42),
    Médiane = c(50, 50),
    Moyenne = c(50, 50),
    Q3 = c(58, 58),
    Max = c(73, 73)
  )

  # Vérification que le résultat de trouver_moyenne_age_faible_elevee correspond à distribution_esperes
  expect_identical(trouver_moyenne_age_faible_elevee(df_Nantes_identique), distribution_esperes)
})
