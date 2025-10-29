#' Visualiser la répartition des élus par catégorie socio-professionnelle
#'
#' @description
#' Cette fonction génère un graphique en barres représentant la répartition
#' des élus selon leur catégorie socio-professionnelle.
#'
#' @param df Un DataFrame contenant une colonne `Code de la catégorie socio-professionnelle`.
#'
#' @return Un objet ggplot affichant un diagramme en barres de la distribution des élus
#' par catégorie socio-professionnelle.
#'
#' @importFrom dplyr filter count
#' @importFrom ggplot2 ggplot aes geom_bar labs theme_bw
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
#' plot_code_professions(df_Nantes)
#'
#' plot_code_professions(df_Aignan)
#'
#' plot_code_professions(df_Loire_Atlantique)
#'
#' plot_code_professions(df_Gers)


plot_code_professions <- function(df) {
  valider_schema(df)

  df |>
    count(`Code de la catégorie socio-professionnelle`) |>
    ggplot() +
    aes(
      x = `Code de la catégorie socio-professionnelle`,
      y = n
    ) +
    geom_bar(stat = "identity") +
    labs(
      x = "Catégorie socio-professionnelle",
      y = "Nombre d'élus",
      title = "Répartition des élus par catégorie socio-professionnelle"
    ) +
    theme_bw()
}
