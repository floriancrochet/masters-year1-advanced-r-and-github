#' Créer un objet de classe 'departement' à partir d'un data frame
#'
#' @description
#' Cette fonction prend un data frame contenant des informations sur un département et valide que toutes les lignes correspondent
#' à un seul département (en vérifiant que le `Code du département` est unique). Elle transforme ensuite ce data frame en un objet de
#' classe `departement` pour lui attribuer un comportement spécifique lors de son utilisation.
#'
#' @param df Un data frame contenant des informations sur les élus d'un département. Le data frame doit inclure la colonne
#' `Code du département`.
#'
#' @return Un objet de classe `departement` contenant les mêmes informations que le data frame d'entrée, mais avec une nouvelle
#' classe attribuée.
#'
#' @importFrom dplyr filter
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Données (départements)
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
#' df_Loire_Atlantique <- creer_departement(df_Loire_Atlantique)
#'
#' df_Gers <- creer_departement(df_Gers)
#'
#' @export


creer_departement <- function(df) {
  valider_schema(df)

  stopifnot(length(unique(df$`Code du département`)) == 1)

  df <- structure(df, class = c("departement", class(df)))

  return(df)
}
