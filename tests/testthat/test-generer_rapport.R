test_that("generer_rapport() s'exécute sans erreur, avertissement ou message", {
  
  # Définir les paramètres de test
  code_commune <- 44150
  code_departement <- 44
  
  # Exécuter la commande system pour générer le rapport
  system("quarto render inst/rapport.qmd -P code_commune:commune -P code_departement:departement")
  
  # Utiliser la fonction generer_rapport pour vérifier son comportement
  resultat <- tryCatch({
    generer_rapport(commune = code_commune, departement = code_departement, output = "rapport_final.html")
    NULL  # Pas d'erreur
  }, error = function(e) e)
  
  # Vérifier qu'il n'y a pas d'erreur dans l'exécution
  expect_null(resultat)
  
  # Vérifier qu'il n'y a pas d'avertissement ni de message
  expect_warning(generer_rapport(commune = code_commune, departement = code_departement, output = "rapport_final.html"), NA)
  expect_message(generer_rapport(commune = code_commune, departement = code_departement, output = "rapport_final.html"), NA)
})
