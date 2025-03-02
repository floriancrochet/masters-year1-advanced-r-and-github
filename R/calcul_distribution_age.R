#' Calculer la distribution des âges
#'
#' @description
#' Cette fonction calcule la distribution des âges des individus d'un data frame
#' en renvoyant des statistiques descriptives : minimum, quartiles, médiane, moyenne et maximum.
#'
#' @param df Un data frame contenant une colonne `Date de naissance` et
#' une colonne `Libellé de la commune` ou `Libellé du département`.
#'
#' @param ... Paramètres supplémentaires (non utilisés directement dans cette fonction).
#'
#' @return Un tibble contenant le nom de la commune ou du département, ainsi que
#' les statistiques d'âge : minimum, premier quartile (Q1), médiane, moyenne,
#' troisième quartile (Q3) et maximum.
#'
#' @importFrom dplyr filter
#' @importFrom lubridate dmy
#' @importFrom stats quantile
#' @importFrom tibble tibble
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
#' calcul_distribution_age(df_Nantes)
#'
#' calcul_distribution_age(df_Aignan)
#'
#' calcul_distribution_age(df_Loire_Atlantique)
#'
#' calcul_distribution_age(df_Gers)


calcul_distribution_age <- function(df, ...) {
  valider_schema(df)

  # Nom de la commune ou du département
  nom <- if (length(unique(df$`Libellé de la commune`)) == 1)
    unique(df$`Libellé de la commune`)
  else
    unique(df$`Libellé du département`)

  # Calcul de l'âge
  ages <- floor(
    as.numeric(difftime(Sys.Date(), dmy(df$`Date de naissance`), units = "days")) / 365.25
  )

  stats <- floor(
    unname(
      quantile(ages, probs = c(0, 0.25, 0.5, 0.75, 1))
    )
  )

  # Retourner un tibble
  tibble(
    Nom = nom,
    Min = stats[1],
    Q1 = stats[2],
    Médiane = stats[3],
    Moyenne = floor(mean(ages)),
    Q3 = stats[4],
    Max = stats[5]
  )
}
