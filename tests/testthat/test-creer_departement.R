test_that("creer_departement renvoie une erreur pour un schéma incorrect", {
  df_Loire_Atlantique_invalide <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique") |>
    dplyr::select(-`Code du département`)  # Retrait de la colonne utilisée par la fonction

  expect_error(creer_departement(df_Loire_Atlantique_invalide))
})

test_that("creer_departement fonctionne avec un schéma valide", {
  df_Loire_Atlantique_valide <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")

  expect_silent(creer_departement(df_Loire_Atlantique_valide))  # Vérifie qu'il n'y a pas d'erreur
})



test_that("creer_departement échoue lorsque 'Code du département' n'est pas unique", {
  df_Loire_Atlantique_pas_unique <- df_Gers_Loire_Atlantique

  expect_error(creer_departement(df_Loire_Atlantique_pas_unique))
})

test_that("creer_departement fonctionne lorsque 'Code du département' est unique", {
  df_Loire_Atlantique_unique <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")  # Sélection d'un seul département

  expect_silent(creer_departement(df_Loire_Atlantique_unique))  # Vérifie qu'il n'y a pas d'erreur
})


test_that("creer_departement affecte la bonne classe", {

  df_Loire_Atlantique <- df_Gers_Loire_Atlantique |>
    dplyr::filter(`Libellé du département` == "Loire-Atlantique")  # Sélection d'un seul département

  resultat <- creer_departement(df_Loire_Atlantique)

  # Vérifier que la classe retournée inclut "departement"
  expect_true("departement" %in% class(resultat))

  # Vérifier que l'objet retourne les classes initiales de df_Loire_Atlantique
  expect_true(all(class(resultat) %in% c("departement", class(df_Loire_Atlantique))))
})
