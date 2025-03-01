#' Resumer les informations d'un departement
#'
#' @description
#' Cette fonction affiche un resume des informations d'un departement,
#' notamment le nom du departement, le nombre de communes, le nombre d'elus,
#' la distribution des ages des elus, ainsi que le nom et l'age de l'elu(e) le/la plus age(e)
#' et de l'elu(e) le/la plus jeune. Elle affiche egalement les communes ayant la moyenne d’age
#' la plus faible et la plus elevee, avec la distribution des ages des elus pour ces communes.
#'
#' @param df Un data frame contenant des informations sur les elus,
#' incluant les colonnes `Libellé du département`, `Code de la commune`, et les informations necessaires
#' pour calculer la distribution des ages, trouver l’elu(e) le/la plus age(e) et le/la plus jeune,
#' ainsi que la moyenne d’age par commune.
#' @param ... Arguments supplementaires, non utilises dans cette methode.
#'
#' @return Aucun retour explicite. La fonction affiche dans la console :
#' - Le nom du departement,
#' - Le nombre de communes dans le departement,
#' - Le nombre d’elus dans le departement,
#' - La distribution des ages des elus sous forme de tibble,
#' - Le nom, le prenom, la date de naissance et l'age de l’elu(e) le/la plus age(e),
#'   ainsi que celui/ceux de l’elu(e) le/la plus jeune, sous forme de tibble,
#' - Les noms des communes avec la moyenne d’age la plus faible et la plus elevee,
#'   ainsi que la distribution des ages des elus pour ces communes.
#'
#' @importFrom dplyr filter
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Donnees (departements)
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
