#' Visualiser la repartition des elus par categorie socio-professionnelle dans une commune
#'
#' @description
#' Cette fonction genere un graphique montrant la repartition des elus d'une commune par categorie
#' socio-professionnelle. Le graphique est un diagramme a barres, ou l'axe des x represente les codes
#' des categories socio-professionnelles et l'axe des y le nombre d'elus dans chaque categorie.
#' La fonction utilise `ggplot2` pour afficher les resultats.
#'
#' @param df Un data frame contenant des informations sur les elus, incluant les colonnes `Code de la catégorie socio-professionnelle`,
#' `Libellé de la catégorie socio-professionnelle`, `Libellé de la commune` et `Libellé du département`.
#' @param ... Arguments supplementaires, non utilises dans cette methode.
#'
#' @return Un graphique genere avec `ggplot2` representant la repartition des elus de la commune par categorie socio-professionnelle.
#' Il affiche les codes professionnels en x et le nombre d'elus par categorie sur l'axe y.
#'
#' @importFrom dplyr count
#' @importFrom ggplot2 ggplot aes geom_bar labs theme_bw guides guide_legend
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Donnees (villes)
#'
#' data("df_Gers_Loire_Atlantique")
#'
#' df_Nantes <- df_Gers_Loire_Atlantique |>
#'   filter(`Libellé de la commune` == "Nantes")
#'
#' df_Aignan <- df_Gers_Loire_Atlantique |>
#'   filter(`Libellé de la commune` == "Aignan")
#'
#'
#' # Utilisation de la fonction
#'
#' plot.commune(df_Nantes)
#'
#' plot.commune(df_Aignan)
#'
#' @export


plot.commune <- function(df, ...) {
  valider_schema(df)

  stopifnot("commune" %in% class(df))

  nombre_elus <- nrow(df)
  commune <- unique(df$`Libellé de la commune`)
  departement <- df$`Libellé du département`

  df |>
    count(
      `Code de la catégorie socio-professionnelle`,
      `Libellé de la catégorie socio-professionnelle`
    ) |>
    ggplot() +
    aes(
      x = `Code de la catégorie socio-professionnelle`,
      y = n,
      fill = `Libellé de la catégorie socio-professionnelle`
    ) +
    geom_bar(stat = "identity") +
    labs(
      x = paste(
        "Libellés des codes professionnels pour les", nombre_elus, "élus"
      ),
      y = "Nombre d'élus",
      title = paste(
        "Répartition des élus de ", commune, " (", departement, ") par catégorie socio-professionnelle",
        sep = ""
      )
    ) +
    theme_bw() +
    guides(
      fill = guide_legend(ncol = 1)
    )  # Force la légende à une seule colonne
}
