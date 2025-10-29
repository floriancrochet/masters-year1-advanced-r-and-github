#' Résumer les informations d'un département
#'
#' @description
#' Cette fonction affiche un résumé des informations d'un département,
#' notamment le nom du département, le nombre de communes, le nombre d'élus,
#' la distribution des âges des élus, ainsi que le nom et l'âge de l'élu(e) le/la plus âgé(e)
#' et de l'élu(e) le/la plus jeune. Elle affiche également les communes ayant la moyenne d’âge
#' la plus faible et la plus élevée, avec la distribution des âges des élus pour ces communes.
#'
#' @param df Un DataFrame contenant des informations sur les élus,
#' incluant les colonnes `Libellé du département`, `Code de la commune`, et les informations nécessaires
#' pour calculer la distribution des âges, trouver l’élu(e) le/la plus âgé(e) et le/la plus jeune,
#' ainsi que la moyenne d’âge par commune.
#' @param ... Arguments supplémentaires, non utilisés dans cette méthode.
#'
#' @return Aucun retour explicite. La fonction affiche dans la console :
#' - Le nom du département,
#' - Le nombre de communes dans le département,
#' - Le nombre d’élus dans le département,
#' - La distribution des âges des élus sous forme de tibble,
#' - Le nom, le prénom, la date de naissance et l'âge de l’élu(e) le/la plus âgé(e),
#'   ainsi que celui/ceux de l’élu(e) le/la plus jeune, sous forme de tibble,
#' - Les noms des communes avec la moyenne d’âge la plus faible et la plus élevée,
#'   ainsi que la distribution des âges des élus pour ces communes.
#'
#' @importFrom dplyr filter
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Données (départements)
#'
#' df_Loire_Atlantique <- df_gers_loire_atlantique |>
#'   filter(`Libellé du département` == "Loire-Atlantique")
#'
#' df_Gers <- df_gers_loire_atlantique |>
#'   filter(`Libellé du département` == "Gers")
#'
#'
#' # DataFrames appartenant à la classe departement
#'
#' df_Loire_Atlantique <- structure(df_Loire_Atlantique, class = c("departement", class(df_Loire_Atlantique)))
#'
#' df_Gers <- structure(df_Gers, class = c("df_Gers", class(df_Gers)))
#'
#'
#' # Utilisation de la fonction
#'
#' summary.departement(df_Loire_Atlantique)
#'
#' summary.departement(df_Gers)
#'
#' @export


summary.departement <- function(df, ...) {
  valider_schema(df)

  stopifnot("departement" %in% class(df))

  departement <- unique(df$`Libellé du département`)
  nombre_communes <- length(unique(df$`Code de la commune`))
  nombre_elus <- nrow(df)
  distribution_age <- calcul_distribution_age(df)
  elu_le_plus_age_jeune <- trouver_elu_le_plus_age_jeune(df)
  moyenne_age_faible_elevee <- trouver_moyenne_age_faible_elevee(df)

  cat("Nom du département : ", departement, ".\n")
  cat("\nNombre de communes dans le département : ", nombre_communes, ".\n")
  cat("\nNombre d’élu.e.s dans le département : ", nombre_elus, ".\n")
  cat("\nDistribution des âges des élu.e.s du département :\n")
  print(distribution_age)
  cat("\nNom et âge de l’élu.e le ou la plus âgé.e et de l’élu.e le ou la plus jeune, ainsi que leur commune :\n")
  print(elu_le_plus_age_jeune)
  cat("\nNoms des communes avec la moyenne d’âge la plus faible et la plus élevée, ainsi que la distribution des âges des élu.e.s pour ces communes :\n")
  print(moyenne_age_faible_elevee)
}
