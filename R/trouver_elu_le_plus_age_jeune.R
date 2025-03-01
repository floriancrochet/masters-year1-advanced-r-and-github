#' Trouver l'elu(e) le plus age(e) et le/la plus jeune
#'
#' @description
#' Cette fonction permet de trouver l'elu(e) le plus age(e) et le/la plus jeune
#' dans un data frame d'elus. Elle calcule l'age des elus a partir de leur date de naissance,
#' puis retourne les informations concernant l'elu(e) le/la plus age(e) et le/la plus jeune.
#' La fonction trie les elus par date de naissance et selectionne le premier et le dernier elu.
#'
#' @param df Un data frame contenant les informations sur les elus,
#' incluant les colonnes `Nom de l'élu`, `Prénom de l'élu`, `Date de naissance`,
#' et `Libellé de la commune`.
#'
#' @return Un tibble avec les informations de l'elu(e) le/la plus age(e)
#' et de l'elu(e) le/la plus jeune. Les colonnes retournees incluent :
#' - `Nom de l'élu` : Le nom de l'elu,
#' - `Prénom de l'élu` : Le prenom de l'elu,
#' - `Date de naissance` : La date de naissance de l'elu,
#' - `âge` : L'age calculé de l'elu,
#' - `Libellé de la commune` : La commune a laquelle appartient l'elu.
#'
#' @importFrom dplyr filter mutate arrange slice n select
#' @importFrom lubridate dmy
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Donnees (villes ou departements)
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
