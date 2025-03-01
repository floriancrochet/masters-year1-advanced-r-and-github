#' Générer un rapport personnalisé pour une commune et un département
#'
#' @description
#' Cette fonction génère un rapport personnalisé au format PDF en utilisant un fichier Quarto (.qmd).
#' Elle prend en paramètre les informations sur la commune (identifiée par son code) et le département
#' (identifié par son code) et génère un rapport en utilisant un modèle défini dans le fichier `rapport.qmd`
#' situé dans le dossier `inst` du package.
#'
#' @param commune Un entier spécifiant le code INSEE ou postal de la commune pour laquelle le rapport sera généré.
#' @param departement Un entier spécifiant le code du département pour lequel le rapport sera généré.
#' @param output Le chemin de sortie où le fichier généré (par exemple, PDF) sera enregistré. Ce doit être un
#'   chemin de fichier valide.
#'
#' @return Aucun retour explicite. Le rapport est généré et enregistré à l'emplacement spécifié dans `output`.
#'
#' @importFrom rmarkdown render
#'
#' @examples
#' # Exemple d'utilisation pour générer un rapport pour Nantes (commune 44109) et Loire-Atlantique (département 44)
#' generer_rapport(commune = 44109, departement = 44, output = "rapport_nantes.pdf")
#'
#' # Exemple avec un autre département et commune
#' generer_rapport(commune = 75056, departement = 75, output = "rapport_paris.pdf")
#'
#' @export


generer_rapport <- function(commune, departement, output) {
  # Localiser le fichier .qmd dans le package installé via system.file
  fichier_qmd <- system.file("rapport.qmd", package = "firstlibFlorian")

  # Vérifier si le fichier .qmd existe
  if (fichier_qmd == "") {
    stop("Le fichier rapport.qmd n'a pas été trouvé dans le package.")
  }

  # Construire la commande quarto render avec les paramètres passés
  command <- paste(
    "quarto render", fichier_qmd,
    "-P commune:", commune,
    "-P departement:", departement,
    "--output", output
  )

  # Exécuter la commande
  system(command)

  # Retourner un message de confirmation
  message("Le rapport a été généré avec succès : ", output)
}
