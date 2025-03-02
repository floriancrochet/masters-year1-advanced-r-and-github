#' Visualiser la répartition des élus par catégorie socio-professionnelle dans une commune
#'
#' @description
#' Cette fonction génère un graphique montrant la répartition des élus d'une commune par catégorie
#' socio-professionnelle. Le graphique est un diagramme à barres, où l'axe des x représente les codes
#' des catégories socio-professionnelles et l'axe des y le nombre d'élus dans chaque catégorie.
#' La fonction utilise `ggplot2` pour afficher les résultats.
#'
#' @param df Un data frame contenant des informations sur les élus, incluant les colonnes `Code de la catégorie socio-professionnelle`,
#' `Libellé de la catégorie socio-professionnelle`, `Libellé de la commune` et `Libellé du département`.
#' @param ... Arguments supplémentaires, non utilisés dans cette méthode.
#'
#' @return Un graphique généré avec `ggplot2` représentant la répartition des élus de la commune par catégorie socio-professionnelle.
#' Il affiche les codes professionnels en x et le nombre d'élus par catégorie sur l'axe y.
#'
#' @importFrom dplyr filter count
#' @importFrom ggplot2 ggplot aes geom_bar labs theme_bw guides guide_legend
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Données (villes)
#'
#' df_Nantes <- df_Gers_Loire_Atlantique |>
#'   filter(`Libellé de la commune` == "Nantes")
#'
#' df_Aignan <- df_Gers_Loire_Atlantique |>
#'   filter(`Libellé de la commune` == "Aignan")
#'
#'
#' # Data frames appartenant à la classe commune
#'
#' df_Nantes <- structure(df_Nantes, class = c("commune", class(df_Nantes)))
#'
#' df_Aignan <- structure(df_Aignan, class = c("commune", class(df_Aignan)))
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
