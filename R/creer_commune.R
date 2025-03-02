#' Créer un objet de classe 'commune' à partir d'un data frame
#'
#' @description
#' Cette fonction prend un data frame contenant des informations sur une commune et valide que toutes les lignes correspondent
#' à une seule commune (en vérifiant que le `Code de la commune` est unique). Elle transforme ensuite ce data frame en un objet de
#' classe `commune` pour lui attribuer un comportement spécifique lors de son utilisation.
#'
#' @param df Un data frame contenant des informations sur les élus d'une commune. Le data frame doit inclure la colonne
#' `Code de la commune`.
#'
#' @return Un objet de classe `commune` contenant les mêmes informations que le data frame d'entrée, mais avec une nouvelle
#' classe attribuée.
#'
#' @importFrom dplyr filter
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Données (villes)
#'
#' df_Nantes <- df_Gers_Loire_Atlantique |>
#'   filter(`Libellé de la commune` == "Nantes")
#'
#' df_Aignan <- df_Gers_Loire_Atlantique |>
#'   filter(`Libellé de la commune` == "Aignan")
#'
#'
#' # Utilisation de la fonction
#'
#' df_Nantes <- creer_commune(df_Nantes)
#'
#' df_Aignan <- creer_commune(df_Aignan)
#'
#' @export


creer_commune <- function(df) {
  valider_schema(df)

  stopifnot(length(unique(df$`Code de la commune`)) == 1)

  df <- structure(df, class = c("commune", class(df)))

  return(df)
}
