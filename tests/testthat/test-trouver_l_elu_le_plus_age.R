test_that("trouver_l_elu_le_plus_age renvoie une erreur pour un schéma incorrect", {
  df_Nantes_invalide <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes") |>
    dplyr::select(-`Date de naissance`)  # Retrait de la colonne utilisée par la fonction

  expect_error(trouver_l_elu_le_plus_age(df_Nantes_invalide))
})

test_that("trouver_l_elu_le_plus_age fonctionne avec un schéma valide", {
  df_Nantes_valide <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  expect_silent(trouver_l_elu_le_plus_age(df_Nantes_valide))  # Vérifie qu'il n'y a pas d'erreur
})



test_that("trouver_l_elu_le_plus_age renvoie l'élu le plus âgé", {
  # Utilisation du jeu de données df_Nantes_identique
  df_Nantes_identique <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  # Résultat attendu : un tibble avec l'élu le plus âgé
  elu_esperé <- tibble::tibble(
    `Nom de l'élu` = "BOURDON",
    `Prénom de l'élu` = "Emilie",
    `Date de naissance` = as.Date("1996-12-22"),
    âge = 28
  )

  resultat <- tibble::as_tibble(trouver_l_elu_le_plus_age(df_Nantes_identique))

  # Supprimer les attributs 'spec' et 'problems' du résultat
  attr(resultat, "spec") <- NULL
  attr(resultat, "problems") <- NULL

  # Vérification que le résultat de trouver_l_elu_le_plus_age correspond à l'elu_esperé
  expect_identical(resultat, elu_esperé)
})
