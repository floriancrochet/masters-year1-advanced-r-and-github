#' Valider le schema des donnees d'un data frame
#'
#' @description
#' Cette fonction verifie que les colonnes du data frame sont conformes à un schema predefini. Le schema attendu inclut des colonnes specifiques
#' liees aux informations sur les elus, telles que le code et le libelle du département, le code sexe, les dates de naissance, et d'autres informations
#' sur les elus et leurs fonctions.
#'
#' @param df Un data frame contenant des informations sur les elus, qui doit avoir les colonnes suivantes :
#' `Code du département`, `Libellé du département`, `Code de la collectivité à statut particulier`,
#' `Libellé de la collectivité à statut particulier`, `Code de la commune`, `Libellé de la commune`,
#' `Nom de l'élu`, `Prénom de l'élu`, `Code sexe`, `Date de naissance`, `Code de la catégorie socio-professionnelle`,
#' `Libellé de la catégorie socio-professionnelle`, `Date de début du mandat`, `Libellé de la fonction`,
#' `Date de début de la fonction`, et `Code nationalité`.
#'
#' @return Aucun retour explicite. Si les colonnes du data frame ne correspondent pas au schema, une erreur sera levee.
#'
#' @importFrom dplyr filter
#'
#' @examples
#' # Exemples d'utilisation
#'
#'
#' # Donnees (villes ou departements)
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
#' valider_schema(df_Nantes)
#'
#' valider_schema(df_Aignan)
#'
#' valider_schema(df_Loire_Atlantique)
#'
#' valider_schema(df_Gers)
#'
#' valider_schema(df_Gers_Loire_Atlantique)


valider_schema <- function(df) {
  schema <- c(
    "Code du département",
    "Libellé du département",
    "Code de la collectivité à statut particulier",
    "Libellé de la collectivité à statut particulier",
    "Code de la commune",
    "Libellé de la commune",
    "Nom de l'élu",
    "Prénom de l'élu",
    "Code sexe",
    "Date de naissance",
    "Code de la catégorie socio-professionnelle",
    "Libellé de la catégorie socio-professionnelle",
    "Date de début du mandat",
    "Libellé de la fonction",
    "Date de début de la fonction",
    "Code nationalité"
  )

  stopifnot(identical(colnames(df), schema))
}
