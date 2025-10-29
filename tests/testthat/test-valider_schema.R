test_that("valider_schema génère une erreur pour un schéma avec des colonnes manquantes", {
  # Dataframe avec des colonnes manquantes
  df_gers_loire_atlantique_manque <- df_gers_loire_atlantique |>
    dplyr::select(-`Code du département`)  # Retirer une colonne

  expect_error(valider_schema(df_gers_loire_atlantique_manque), "Certaines colonnes essentielles sont absentes.")  # Vérifie qu'une erreur est générée
})

test_that("valider_schema fonctionne avec un schéma correct", {
  # Dataframe avec les colonnes correspondant exactement au schéma attendu
  df_gers_loire_atlantique_valide <- df_gers_loire_atlantique

  expect_silent(valider_schema(df_gers_loire_atlantique_valide), "Le schéma est compatible.")  # Vérifie qu'il n'y a pas d'erreur
})

test_that("validate_schema génère une erreur si l'entrée n'est pas un data.frame", {
  # Création d'un vecteur de test
  vec_test <- c(1,6,1,8,0,3,3,9,8,8)

  expect_error(validate_schema(vec_test), "L'objet fourni n'est pas un data.frame.")
})

test_that("validate_schema émet un avertissement avec un DataFrame vide", {
  # Création d'un DataFrame de test
  df_test <- data.frame()
  
  expect_warning(
    validate_schema(df_test),
    "Certaines colonnes essentielles sont absentes."
  )
})
