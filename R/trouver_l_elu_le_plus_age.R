#' Trouver l'élu le plus âgé
#'
#' @description
#' Cette fonction identifie l'élu le plus âgé dans un data frame,
#' en calculant l'âge à partir de la date de naissance.
#'
#' @param df Un data frame contenant une colonne `Date de naissance` au format `"jour/mois/année"`,
#' ainsi que les colonnes `Nom de l'élu` et `Prénom de l'élu`.
#'
#' @return Un data frame avec les colonnes :
#' - `Nom de l'élu` : Nom de l'élu le plus âgé.
#' - `Prénom de l'élu` : Prénom de l'élu le plus âgé.
#' - `Date de naissance` : Date de naissance de l'élu le plus âgé.
#' - `âge` : Âge en années de l'élu le plus âgé.
#'
#' @importFrom dplyr filter mutate slice select
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
#' trouver_l'élu_le_plus_âgé(df_Nantes)
#'
#' trouver_l'élu_le_plus_âgé(df_Aignan)
#'
#' trouver_l'élu_le_plus_âgé(df_Loire_Atlantique)
#'
#' trouver_l'élu_le_plus_âgé(df_Gers)


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
