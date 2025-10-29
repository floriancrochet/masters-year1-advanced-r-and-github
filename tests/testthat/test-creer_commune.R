test_that("creer_commune renvoie une erreur pour un schéma incorrect", {
  df_Nantes_invalide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes") |>
    dplyr::select(-`Code de la commune`)  # Retrait de la colonne utilisée par la fonction

  expect_error(creer_commune(df_Nantes_invalide))
})

test_that("creer_commune fonctionne avec un schéma valide", {
  df_Nantes_valide <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")

  expect_silent(creer_commune(df_Nantes_valide))  # Vérifie qu'il n'y a pas d'erreur
})



test_that("creer_commune échoue lorsque 'Code de la commune' n'est pas unique", {
  df_Nantes_pas_unique <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` %in% c("Nantes", "Aignan"))

  expect_error(creer_commune(df_Nantes_pas_unique))
})

test_that("creer_commune fonctionne lorsque 'Code de la commune' est unique", {
  df_Nantes_unique <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")  # Sélection d'une seule commune

  expect_silent(creer_commune(df_Nantes_unique))  # Vérifie qu'il n'y a pas d'erreur
})



test_that("creer_commune affecte la bonne classe", {

  df_Nantes <- df_gers_loire_atlantique |>
    dplyr::filter(`Libellé de la commune` == "Nantes")  # Sélection d'une seule commune

  resultat <- creer_commune(df_Nantes)

  # Vérifier que la classe retournée inclut "commune"
  expect_true("commune" %in% class(resultat))

  # Vérifier que l'objet retourne les classes initiales de df_Nantes
  expect_true(all(class(resultat) %in% c("commune", class(df_Nantes))))
})
