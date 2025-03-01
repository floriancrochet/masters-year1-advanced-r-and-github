#' Visualiser la repartition des elus par categorie socio-professionnelle dans un departement
#'
#' @description
#' Cette fonction genere un graphique montrant la repartition des elus d'un departement par categorie
#' socio-professionnelle. Le graphique est un diagramme a barres, ou l'axe des x represente les codes
#' des categories socio-professionnelles et l'axe des y le nombre d'elus dans chaque categorie.
#' Elle affiche les 10 categories les plus representees dans le departement.
#'
#' @param df Un data frame contenant des informations sur les elus, incluant les colonnes `Code de la catégorie socio-professionnelle`,
#' `Libellé de la catégorie socio-professionnelle`, `Libellé du département`, et `Code de la commune`.
#' @param ... Arguments supplementaires, non utilises dans cette methode.
#'
#' @return Un graphique genere avec `ggplot2` representant la repartition des elus du departement par categorie socio-professionnelle.
#' Il affiche les 10 categories socio-professionnelles les plus representees en fonction du nombre d'elus.
#'
#' @importFrom dplyr filter count arrange
#' @importFrom ggplot2 ggplot aes geom_bar labs theme_bw guides guide_legend
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
#' plot.departement(df_Loire_Atlantique)
#'
#' plot.departement(df_Gers)
#'
#' @export


plot.departement <- function(df, ...) {
  valider_schema(df)

  stopifnot("departement" %in% class(df))

  departement <- df$`Libellé du département`
  nombre_communes <- length(unique(df$`Code de la commune`))

  df |>
    count(
      `Code de la catégorie socio-professionnelle`,
      `Libellé de la catégorie socio-professionnelle`
    ) |>
    arrange(desc(n)) |>  # Trie les données par nombre d'élus décroissant
    head(10) |>  # Garde uniquement les 10 premières lignes
    ggplot() +
    aes(
      x = `Code de la catégorie socio-professionnelle`,
      y = n,
      fill = `Libellé de la catégorie socio-professionnelle`
    ) +
    geom_bar(stat = "identity") +
    labs(
      x = paste(
        "Libellés des 10 codes professionnels les plus représentés pour le département", departement
      ),
      y = "Nombre d'élus",
      title = paste(
        "Répartition des élus de ", departement, " (", nombre_communes, " communes) par catégorie socio-professionnelle",
        sep = ""
      )
    ) +
    theme_bw() +
    guides(
      fill = guide_legend(ncol = 1)
    )  # Force la légende à une seule colonne
}
