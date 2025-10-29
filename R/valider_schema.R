#' Valider le schéma des données d'un DataFrame
#'
#' @description
#' Cette fonction vérifie que les colonnes du DataFrame sont conformes à un schéma prédéfini. Le schéma attendu inclut des colonnes spécifiques
#' liées aux informations sur les élus.
#'
#' @param df Un DataFrame, contenant des informations sur les élus, qui doit avoir au minimum les colonnes suivantes :
#' `Code du département`, `Libellé du département`, `Code de la commune`, `Libellé de la commune`,
#' `Nom de l'élu`, `Prénom de l'élu`, `Date de naissance`, `Code de la catégorie socio-professionnelle`,
#' `Libellé de la fonction`.
#' 
#' @return Aucun retour explicite. Un message ou un avertissement est affiché si le schéma n’est pas respecté.
#'
#' @importFrom dplyr filter
#'
#' @keywords internal
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Données (villes ou départements)
#'
#' df_Nantes <- df_gers_loire_atlantique |>
#'   filter(`Libellé de la commune` == "Nantes")
#'
#' df_Aignan <- df_gers_loire_atlantique |>
#'   filter(`Libellé de la commune` == "Aignan")
#'
#' df_Loire_Atlantique <- df_gers_loire_atlantique |>
#'   filter(`Libellé du département` == "Loire-Atlantique")
#'
#' df_Gers <- df_gers_loire_atlantique |>
#'   filter(`Libellé du département` == "Gers")
#'
#'
#' # Utilisation de la fonction
#'
#' valider_schema(df_Nantes)
#'
#' valider_schema(df_Aignan)
#'
#' valider_schema(df_Loire_Atlantique)
#'
#' valider_schema(df_Gers)
#'
#' valider_schema(df_gers_loire_atlantique)


valider_schema <- function(df) {
  # Vérifier si l'objet est bien un data.frame
  if (!is.data.frame(df)) {
    stop("L'objet fourni n'est pas un data.frame.")
  }
  
  # Schéma minimal requis
  schema <- c(
    "Code du département",
    "Libellé du département",
    "Code de la commune",
    "Libellé de la commune",
    "Nom de l'élu",
    "Prénom de l'élu",
    "Date de naissance",
    "Code de la catégorie socio-professionnelle",
    "Libellé de la fonction"
  )
  
  # Colonnes manquantes
  missing_cols <- setdiff(schema, colnames(df))
  
  # Colonnes supplémentaires
  extra_cols <- setdiff(colnames(df), schema)
  
  if (length(missing_cols) > 0) {
    warning(
      paste0(
        "Colonnes manquantes : ", paste(missing_cols, collapse = ", "), "\n",
        "Cela peut entraîner des erreurs dans certaines fonctions du package."
      )
    )
  }
  
  # if (length(extra_cols) > 0) {
  #   message(
  #     paste0(
  #       "Colonnes supplémentaires détectées : ", paste(extra_cols, collapse = ", "), "\n",
  #       "Elles seront ignorées par les fonctions qui utilisent le schéma standard."
  #     )
  #   )
  # }
  
  invisible(df)
}
