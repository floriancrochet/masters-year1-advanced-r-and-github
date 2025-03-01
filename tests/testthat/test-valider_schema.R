test_that("valider_schema génère une erreur pour un schéma avec des colonnes manquantes", {
  # Dataframe avec des colonnes manquantes
  df_Gers_Loire_Atlantique_manque <- df_Gers_Loire_Atlantique |>
    dplyr::select(-`Code nationalité`)  # Retirer une colonne

  expect_error(valider_schema(df_Gers_Loire_Atlantique_manque))  # Vérifie qu'une erreur est générée
})

test_that("valider_schema fonctionne avec un schéma correct", {
  # Dataframe avec les colonnes correspondant exactement au schéma attendu
  df_Gers_Loire_Atlantique_valide <- df_Gers_Loire_Atlantique

  expect_silent(valider_schema(df_Gers_Loire_Atlantique_valide))  # Vérifie qu'il n'y a pas d'erreur
})

test_that("valider_schema génère une erreur pour un schéma avec des colonnes supplémentaires", {
  # Dataframe avec des colonnes supplémentaires
  df_Gers_Loire_Atlantique_trop <- df_Gers_Loire_Atlantique |>
    dplyr::mutate(`Nouvelle colonne` = "Valeur")  # Ajouter une colonne supplémentaire

  expect_error(valider_schema(df_Gers_Loire_Atlantique_trop))  # Vérifie qu'une erreur est générée
})
