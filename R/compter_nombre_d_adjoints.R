#' Compter le nombre d'adjoints
#'
#' @description
#' Cette fonction compte le nombre d'occurrences du mot "adjoint"
#' dans la colonne `Libellé de la fonction` d'un data frame.
#'
#' @param df Un data frame contenant une colonne `Libellé de la fonction` (type `character`).
#'
#' @return Un entier représentant le nombre d'occurrences du mot "adjoint".
#'
#' @importFrom stringr str_detect
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Données (villes ou départements)
#'
#' data("df_Gers_Loire_Atlantique")
#'
#' df_Nantes <- df_Gers_Loire_Atlantique |>
#'   filter(`Libellé de la commune` == "Nantes")
#'
#' df_Aignan <- df_Gers_Loire_Atlantique |>
#'   filter(`Libellé de la commune` == "Aignan")
#'
#' df_Loire_Atlantique <- df_Gers_Loire_Atlantique |>
#'   filter(`Libellé du département` == "Loire-Atlantique")
#'
#' df_Gers <- df_Gers_Loire_Atlantique |>
#'   filter(`Libellé du département` == "Gers")
#'
#'
#' # Utilisation de la fonction
#'
#' compter_nombre_d_adjoints(df_Nantes)
#'
#' compter_nombre_d_adjoints(df_Aignan)
#'
#' compter_nombre_d_adjoints(df_Loire_Atlantique)
#'
#' compter_nombre_d_adjoints(df_Gers)


compter_nombre_d_adjoints <- function(df) {
  valider_schema(df)

  sum(str_detect(df$`Libellé de la fonction`, "adjoint"), na.rm = TRUE)
}
