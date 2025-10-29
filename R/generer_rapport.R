#' Générer un rapport Quarto et le déplacer vers un chemin spécifié
#'
#' @description
#' Cette fonction génère un rapport Quarto en utilisant les paramètres `commune` et `departement` spécifiés.
#' Après la génération, le fichier est déplacé vers le chemin de destination spécifié par l'utilisateur.
#'
#' @param commune Une chaîne de caractères représentant le numéro de la commune à inclure dans le rapport.
#' @param departement Une chaîne de caractères représentant le numéro du département à inclure dans le rapport.
#' @param output Une chaîne de caractères représentant le chemin de destination où le fichier rapport doit être déplacé.
#' Le fichier généré sera déplacé vers ce chemin sous le nom de spécifié.
#' @param df Un DataFrame contenant des informations sur les élus,
#'
#' @return Aucun retour. Le fichier rapport.html est généré et déplacé vers le chemin spécifié.
#'
#' @importFrom dplyr filter
#' @import quarto
#' @importFrom utils packageName
#' @importFrom tools file_ext
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Données
#'
#' data("df_gers_loire_atlantique")
#'
#'
#' # Utilisation de la fonction
#' 
#' # Générer un rapport pour Nantes (44109) et la Loire-Atlantique (44) en html
#' # generer_rapport("44109", "44", "chemin/absolu/rapport_final.html", df_gers_loire_atlantique)
#'
#' # Générer un rapport pour Nantes (44109) et la Loire-Atlantique (44) en html
#' # generer_rapport("44109", "44", "chemin/absolu/rapport_final.html", df_gers_loire_atlantique)
#'
#' @export


generer_rapport <- function(commune, departement, output, df) {
  
  # Vérifier la présence de Quarto
  qp <- try(quarto::quarto_path(), silent = TRUE)
  if (inherits(qp, "try-error")) {
    stop("Quarto n'est pas disponible sur cette machine (quarto::quarto_path()).")
  }
  
  # Vérifier les arguments
  stopifnot(is.character(commune), length(commune) == 1L)
  stopifnot(is.character(departement), length(departement) == 1L)
  stopifnot(is.character(output), length(output) == 1L)
  
  valider_schema(df)
  
  # Localiser le fichier .qmd dans le package
  pkg <- utils::packageName()
  qmd_path <- system.file("rapport.qmd", package = pkg)
  if (qmd_path == "") {
    stop("Le fichier 'rapport.qmd' est introuvable dans le dossier inst/ du package.")
  }
  
  # Si seul un nom de fichier est donné, on l’écrit dans le répertoire de travail courant
  if (dirname(output) %in% c(".", "")) {
    output <- normalizePath(file.path(getwd(), output),  winslash = "/", mustWork = FALSE)
  }
  
  # Vérifier que le chemin est absolu
  if (!grepl("^(?:/|[A-Za-z]:/|//)", output)) {
    stop("Le chemin doit être absolu (par exemple '/home/...', 'C:/...', ou '//serveur/...').")
  }
  
  # Déterminer le chemin du dossier et le nom du fichier
  out_dir    <- dirname(output)
  out_file   <- basename(output)
  
  # Vérifier que le dossier de sortie existe déjà
  if (!dir.exists(out_dir)) {
    stop(paste0("Le dossier de sortie n'existe pas : ", out_dir,
                "\n(getwd() = ", getwd(), ")"))
  }
  
  # Déterminer le format de sortie à partir de l’extension
  ext <- tolower(tools::file_ext(output))
  valid_formats <- c("html", "pdf")
  out_format <- if (ext %in% valid_formats) ext else NULL
  
  # Sauvegarder le df dans un fichier temporaire (et le nettoyer ensuite)
  df_name <- deparse(substitute(df))
  df_path <- file.path(tempdir(), paste0("temp_", df_name, ".rds"))
  saveRDS(df, df_path)
  on.exit(if (file.exists(df_path)) unlink(df_path), add = TRUE)
  
  # Exécuter le rendu du document Quarto avec les paramètres
  quarto::quarto_render(
    input = qmd_path,
    output_file = out_file,
    output_format = out_format,
    execute_params = list(
      code_commune = commune,
      code_departement = departement,
      dataframe_name = df_name,
      dataframe_path = df_path
    ),
    quarto_args = c("--output-dir", out_dir)
  )
  
  message(sprintf("Le rapport a été généré et enregistré dans : %s", output))
  invisible(NULL)
}
