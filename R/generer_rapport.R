#' Générer un rapport Quarto et le déplacer vers un chemin spécifié
#'
#' @description
#' Cette fonction génère un rapport Quarto en utilisant les paramètres `commune` et `departement` spécifiés.
#' Après la génération, le fichier `rapport.html` est déplacé vers le chemin de destination spécifié par l'utilisateur.
#'
#' @param commune Un entier représentant le numéro de la commune à inclure dans le rapport.
#' @param departement Un entier représentant le numéro du département à inclure dans le rapport.
#' @param output Une chaîne de caractères représentant le chemin de destination où le fichier rapport doit être déplacé. Le fichier généré sera déplacé vers ce chemin sous le nom de `rapport.html`.
#'
#' @return Aucun retour explicite. Le fichier `rapport.html` est généré et déplacé vers le chemin spécifié.
#'
#' @import quarto
#'
#' @examples
#' # Utilisation de la fonction pour générer un rapport pour la commune de Nantes (44109) et le département de Loire-Atlantique (44)
#'
#' generer_rapport(44109, 44, "<votre chemin>/rapport_final.html")
#'
#' @export


generer_rapport <- function(commune, departement, output) {
  
  # Vérifier si Quarto est installé et accessible
  if (system("which quarto", intern = TRUE) == "") {
    stop("Quarto n'est pas installé ou accessible dans le système.")
  }
  
  # Générer le rapport avec Quarto
  chemin_qmd <- system.file("rapport.qmd", package = "firstlibFlorian")
  
  # Vérifier si le fichier .qmd existe
  if (chemin_qmd == "") {
    stop("Le fichier rapport.qmd est introuvable dans le package.")
  }
  
  # Exécuter la commande system pour générer le rapport
  system("quarto render inst/rapport.qmd -P code_commune:commune -P code_departement:departement")
  
  # Vérifier si le fichier rapport.html a bien été généré
  chemin_html <- system.file("rapport.html", package = "firstlibFlorian")
  
  if (!file.exists(chemin_html)) {
    stop("Le fichier rapport.html n'a pas été généré.")
  }
  
  
  # Déplacer le fichier généré vers le nouveau chemin
  if (file.rename(chemin_html, output)) {
    message("Le fichier a été déplacé avec succès vers ", output)
  } else {
    stop("Erreur lors du déplacement du fichier.")
  }
}
