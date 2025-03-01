#' Trouver l'elu le plus age
#'
#' @description
#' Cette fonction identifie l'elu le plus age dans un data frame,
#' en calculant l'age a partir de la date de naissance.
#'
#' @param df Un data frame contenant une colonne `Date de naissance` au format `"jour/mois/année"`,
#' ainsi que les colonnes `Nom de l'élu` et `Prénom de l'élu`.
#'
#' @return Un data frame avec les colonnes :
#' - `Nom de l'élu` : Nom de l'elu le plus age.
#' - `Prénom de l'élu` : Prenom de l'elu le plus age.
#' - `Date de naissance` : Date de naissance de l'elu le plus age.
#' - `âge` : Age en annees de l'elu le plus age.
#'
#' @importFrom dplyr mutate slice select
#' @importFrom lubridate dmy
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
#' trouver_l_elu_le_plus_age(df_Nantes)
#'
#' trouver_l_elu_le_plus_age(df_Aignan)
#'
#' trouver_l_elu_le_plus_age(df_Loire_Atlantique)
#'
#' trouver_l_elu_le_plus_age(df_Gers)


trouver_l_elu_le_plus_age <- function(df) {
  valider_schema(df)

  df |>
    mutate(`Date de naissance` = dmy(`Date de naissance`)) |>
    mutate(
      âge = floor(
        as.numeric(difftime(Sys.Date(), `Date de naissance`, units = "days")) / 365.25
      )
    ) |>
    slice(which.min(`âge`)) |>
    select(
      `Nom de l'élu`,
      `Prénom de l'élu`,
      `Date de naissance`,
      `âge`
    )
}
