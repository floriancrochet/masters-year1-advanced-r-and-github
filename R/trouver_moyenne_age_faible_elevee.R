#' Trouver les communes avec la moyenne d'âge la plus faible et la plus élevée
#'
#' @description
#' Cette fonction permet de trouver les communes avec la moyenne d’âge des élus la plus faible
#' et la plus élevée. Elle regroupe les données par commune, applique une fonction de calcul
#' de la distribution des âges des élus à chaque groupe, puis sélectionne les communes avec
#' les moyennes d’âge les plus basses et les plus élevées.
#'
#' @param df Un data frame contenant les informations sur les élus,
#' incluant les colonnes `Libellé de la commune` et les informations nécessaires
#' pour calculer la moyenne d’âge des élus par commune.
#'
#' @return Un tibble contenant les informations des communes avec la moyenne d’âge
#' la plus faible et la plus élevée. Les colonnes retournées incluent :
#' - `Libellé de la commune` : Le nom de la commune,
#' - `Moyenne` : La moyenne d’âge des élus dans la commune.
#'
#' @importFrom dplyr filter group_by group_split arrange slice bind_rows
#' @importFrom purrr map
#'
#' @keywords internal
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Données (villes ou départements)
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
#' trouver_moyenne_age_faible_elevee(df_Nantes)
#'
#' trouver_moyenne_age_faible_elevee(df_Aignan)
#'
#' trouver_moyenne_age_faible_elevee(df_Loire_Atlantique)
#'
#' trouver_moyenne_age_faible_elevee(df_Gers)


trouver_moyenne_age_faible_elevee <- function(df) {
  valider_schema(df)

  df |>
    group_by(`Libellé de la commune`) |>
    group_split() |>
    map(calcul_distribution_age) |>
    bind_rows() |>
    arrange(Moyenne) |>
    slice(c(1, n()))
}
