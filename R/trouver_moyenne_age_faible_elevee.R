#' Trouver les communes avec la moyenne d'age la plus faible et la plus elevee
#'
#' @description
#' Cette fonction permet de trouver les communes avec la moyenne d’age des elus la plus faible
#' et la plus elevee. Elle regroupe les donnees par commune, applique une fonction de calcul
#' de la distribution des ages des elus à chaque groupe, puis selectionne les communes avec
#' les moyennes d'age les plus basses et les plus elevees.
#'
#' @param df Un data frame contenant les informations sur les elus,
#' incluant les colonnes `Libellé de la commune` et les informations necessaires
#' pour calculer la moyenne d'age des elus par commune.
#'
#' @return Un tibble contenant les informations des communes avec la moyenne d'age
#' la plus faible et la plus elevee. Les colonnes retournees incluent :
#' - `Libellé de la commune` : Le nom de la commune,
#' - `Moyenne` : La moyenne d'age des elus dans la commune.
#'
#' @importFrom dplyr group_by group_split arrange slice bind_rows
#' @importFrom purrr map
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Donnees (villes ou departements)
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
