#' Trouver l'élu(e) le plus âgé(e) et le/la plus jeune
#'
#' @description
#' Cette fonction permet de trouver l'élu(e) le plus âgé(e) et le/la plus jeune
#' dans un DataFrame d'élus. Elle calcule l'âge des élus à partir de leur date de naissance,
#' puis retourne les informations concernant l'élu(e) le/la plus âgé(e) et le/la plus jeune.
#' La fonction trie les élus par date de naissance et sélectionne le premier et le dernier élu.
#'
#' @param df Un DataFrame contenant les informations sur les élus,
#' incluant les colonnes `Nom de l'élu`, `Prénom de l'élu`, `Date de naissance`,
#' et `Libellé de la commune`.
#'
#' @return Un tibble avec les informations de l'élu(e) le/la plus âgé(e)
#' et de l'élu(e) le/la plus jeune. Les colonnes retournées incluent :
#' - `Nom de l'élu` : Le nom de l'élu,
#' - `Prénom de l'élu` : Le prénom de l'élu,
#' - `Date de naissance` : La date de naissance de l'élu,
#' - `âge` : L'âge calculé de l'élu,
#' - `Libellé de la commune` : La commune à laquelle appartient l'élu.
#'
#' @importFrom dplyr filter mutate arrange slice n select
#' @importFrom lubridate dmy
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
#' trouver_elu_le_plus_age_jeune(df_Nantes)
#'
#' trouver_elu_le_plus_age_jeune(df_Aignan)
#'
#' trouver_elu_le_plus_age_jeune(df_Loire_Atlantique)
#'
#' trouver_elu_le_plus_age_jeune(df_Gers)


trouver_elu_le_plus_age_jeune <- function(df) {
  valider_schema(df)

  df |>
    mutate(`Date de naissance` = dmy(`Date de naissance`)) |>
    mutate(
      âge = floor(
        as.numeric(difftime(Sys.Date(), `Date de naissance`, units = "days")) / 365.25
      )
    ) |>
    arrange(`Date de naissance`) |>
    slice(c(1, n())) |>
    select(
      `Nom de l'élu`,
      `Prénom de l'élu`,
      `Date de naissance`,
      `âge`,
      `Libellé de la commune`
    )
}
