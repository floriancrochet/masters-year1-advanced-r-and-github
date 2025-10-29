#' Visualiser la répartition des élus par catégorie socio-professionnelle dans un département
#'
#' @description
#' Cette fonction génère un graphique montrant la répartition des élus d'un département par catégorie
#' socio-professionnelle. Le graphique est un diagramme à barres, où l'axe des x représente les codes
#' des catégories socio-professionnelles et l'axe des y le nombre d'élus dans chaque catégorie.
#' Elle affiche les 10 catégories les plus représentées dans le département.
#'
#' @param df Un DataFrame contenant des informations sur les élus, incluant les colonnes `Code de la catégorie socio-professionnelle`,
#' `Libellé de la catégorie socio-professionnelle`, `Libellé du département`, et `Code de la commune`.
#' @param ... Arguments supplémentaires, non utilisés dans cette méthode.
#'
#' @return Un graphique généré avec `ggplot2` représentant la répartition des élus du département par catégorie socio-professionnelle.
#' Il affiche les 10 catégories socio-professionnelles les plus représentées en fonction du nombre d'élus.
#'
#' @importFrom dplyr filter count
#' @importFrom ggplot2 ggplot aes geom_bar labs theme_bw element_text guides guide_legend theme
#' @importFrom cowplot get_plot_component ggdraw
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

  p <- df |>
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
    theme(
      plot.title = element_text(size = 20.3, face = "bold"), # Titre principal
      axis.title.x = element_text(size = 18, face = "bold"), # Titre axe X
      axis.title.y = element_text(size = 18, face = "bold"), # Titre axe Y
      axis.text = element_text(size = 16),                   # Texte des axes
      legend.title = element_text(size = 20, face = "bold"), # Titre de la légende
      legend.text = element_text(size = 18)                  # Texte de la légende
    ) +
    guides(
      fill = guide_legend(ncol = 1)
    )
  
  # Extraction de la légende
  leg_list <- get_plot_component(p, "guide-box", return_all = TRUE)
  leg <- leg_list[[1]]
  
  # Graphique sans légende
  p_no_legend <- p + theme(legend.position = "none")
  
  # Retourne une liste complète
  res <- list(
    graphique = p, # Graphique complet
    graphique_sans_legende = p_no_legend, # Graphique sans légende
    legende = ggdraw(leg) # Légende seule
  )
  
  res
}
