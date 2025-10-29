#' Résumer les informations d'une commune
#'
#' @description
#' Cette fonction affiche un résumé des informations d'une commune,
#' notamment le nom de la commune, le nombre d'élus, la distribution des âges
#' des élus, ainsi que le nom et l'âge de l'élu(e) le/la plus âgé(e).
#'
#' @param df Un DataFrame contenant des informations sur les élus d'une commune,
#' incluant les colonnes `Libellé de la commune` et `Date de naissance`.
#' @param ... Arguments supplémentaires, non utilisés dans cette méthode.
#'
#' @return Aucun retour explicite. La fonction affiche dans la console :
#' - Le nom de la commune,
#' - Le nombre d’élus,
#' - La distribution des âges des élus sous forme de tibble,
#' - Le nom, le prénom, la date de naissance et l'âge de l’élu(e) le/la plus âgé(e), sous forme de tibble.
#'
#' @importFrom dplyr filter
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Données (villes)
#'
#' df_Nantes <- df_gers_loire_atlantique |>
#'   filter(`Libellé de la commune` == "Nantes")
#'
#' df_Aignan <- df_gers_loire_atlantique |>
#'   filter(`Libellé de la commune` == "Aignan")
#'
#'
#' # DataFrames appartenant à la classe commune
#'
#' df_Nantes <- structure(df_Nantes, class = c("commune", class(df_Nantes)))
#'
#' df_Aignan <- structure(df_Aignan, class = c("commune", class(df_Aignan)))
#'
#'
#' # Utilisation de la fonction
#'
#' summary.commune(df_Nantes)
#'
#' summary.commune(df_Aignan)
#'
#' @export


summary.commune <- function(df, ...) {
  valider_schema(df)

  stopifnot("commune" %in% class(df))

  commune <- unique(df$`Libellé de la commune`)
  nombre_elus <- nrow(df)
  distribution_age <- calcul_distribution_age(df)
  elu_le_plus_age <- trouver_l_elu_le_plus_age(df)

  cat("Nom de la commune : ", commune, ".\n")
  cat("\nNombre d’élu.e.s de la commune : ", nombre_elus, ".\n")
  cat("\nDistribution des âges des élu.e.s :\n")
  print(distribution_age)
  cat("\nNom et âge de l’élu.e le ou la plus âgé.e :\n")
  print(elu_le_plus_age)

invisible(NULL)
}
