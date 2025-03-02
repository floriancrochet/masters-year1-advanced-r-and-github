## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)


## ----setup--------------------------------------------------------------------
library(firstlibFlorian)


## -----------------------------------------------------------------------------
# Données (villes)

df_Nantes <- df_Gers_Loire_Atlantique |>
  dplyr::filter(`Libellé de la commune` == "Nantes")

df_Aignan <- df_Gers_Loire_Atlantique |>
  dplyr::filter(`Libellé de la commune` == "Aignan")


# Data frames appartenant à la classe commune

df_Nantes <- structure(df_Nantes, class = c("commune", class(df_Nantes)))

df_Aignan <- structure(df_Aignan, class = c("commune", class(df_Aignan)))


# Utilisation de la fonction

summary(df_Nantes)

summary(df_Aignan)


## -----------------------------------------------------------------------------
# Données (départements)

df_Loire_Atlantique <- df_Gers_Loire_Atlantique |>
  dplyr::filter(`Libellé du département` == "Loire-Atlantique")

df_Gers <- df_Gers_Loire_Atlantique |>
  dplyr::filter(`Libellé du département` == "Gers")


# Data frames appartenant à la classe departement

df_Loire_Atlantique <- structure(df_Loire_Atlantique, class = c("departement", class(df_Loire_Atlantique)))

df_Gers <- structure(df_Gers, class = c("df_Gers", class(df_Gers)))


# Utilisation de la fonction

summary(df_Loire_Atlantique)

summary(df_Gers)


## -----------------------------------------------------------------------------
# Utilisation de la fonction pour générer un rapport pour la commune de Nantes (44109) et le département de Loire-Atlantique (44)

# generer_rapport(44109, 44, "<votre chemin>/<nom du fichier>.html")

