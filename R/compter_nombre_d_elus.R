#' Compter le nombre d'élus
#'
#' @description
#' Cette fonction compte le nombre d'élus distincts dans un DataFrame en se basant
#' sur les colonnes `Nom de l'élu`, `Prénom de l'élu`, et `Date de naissance`.
#'
#' @param df Un DataFrame contenant les colonnes `Nom de l'élu`, `Prénom de l'élu`, et `Date de naissance` (type `character` pour les deux premières et `Date` pour la dernière).
#'
#' @return Un entier représentant le nombre d'élus distincts dans le DataFrame.
#'
#' @importFrom dplyr filter select distinct
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
#' compter_nombre_d_elus(df_Nantes)
#'
#' compter_nombre_d_elus(df_Aignan)
#'
#' compter_nombre_d_elus(df_Loire_Atlantique)
#'
#' compter_nombre_d_elus(df_Gers)



compter_nombre_d_elus <- function(df) {
  valider_schema(df)

  df |>
    select(`Nom de l'élu`, `Prénom de l'élu`, `Date de naissance`) |>
    distinct() |>
    nrow()
}
