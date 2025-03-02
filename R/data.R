#' Données des élus des départements du Gers et de la Loire-Atlantique
#'
#' Un sous-ensemble des données du répertoire national des élus, représentant les élus des départements
#' du Gers et de la Loire-Atlantique. Ces données incluent des informations sur les élus, telles que
#' leur nom, sexe, date de naissance, catégorie socio-professionnelle, ainsi que des détails sur leur
#' mandat et fonction au sein des collectivités locales.
#'
#' @format Un `tibble` avec 9 752 lignes et 16 colonnes :
#' \describe{
#'   \item{Code du département}{Numéro unique du département, numérique. Par exemple, 32 pour le Gers et 44 pour la Loire-Atlantique.}
#'   \item{Libellé du département}{Nom du département sous forme de chaîne de caractères. Exemple : "Gers", "Loire-Atlantique".}
#'   \item{Code de la collectivité à statut particulier}{Indicateur logique (TRUE/FALSE) pour les départements ayant un statut particulier. Certaines collectivités ont un statut particulier qui n'est pas applicable à toutes les collectivités locales. Les valeurs peuvent être `NA` si le statut particulier n'est pas applicable.}
#'   \item{Libellé de la collectivité à statut particulier}{Nom de la collectivité ayant un statut particulier. Généralement vide (NA) pour la plupart des lignes, sauf si un élu appartient à une collectivité ayant un statut particulier, tel que les DOM-TOM ou certaines collectivités spécifiques.}
#'   \item{Code de la commune}{Code numérique unique attribué à chaque commune, par exemple "32001" pour Aignan dans le Gers.}
#'   \item{Libellé de la commune}{Nom de la commune sous forme de chaîne de caractères. Exemple : "Aignan", "Nantes".}
#'   \item{Nom de l'élu}{Nom de famille de l'élu. Exemples : "AURENSAN", "BARATAULT".}
#'   \item{Prénom de l'élu}{Prénom de l'élu. Exemple : "Michel", "Philippe", "Mathieu", "Marie-Pierre".}
#'   \item{Code sexe}{Code de sexe de l'élu, sous forme de chaîne de caractères, avec des valeurs possibles "M" pour masculin et "F" pour féminin. Exemple : "M", "F".}
#'   \item{Date de naissance}{Date de naissance de l'élu au format `jj/mm/aaaa`. Exemple : "09/07/1952", "08/12/1957".}
#'   \item{Code de la catégorie socio-professionnelle}{Code numérique représentant la catégorie socio-professionnelle de l'élu. Il est basé sur des classifications standardisées, comme "11" pour "Ancienne profession intermédiaire", "12" pour "Cadre de la fonction publique", etc.}
#'   \item{Libellé de la catégorie socio-professionnelle}{Nom complet de la catégorie socio-professionnelle. Exemple : "Ancienne profession intermédiaire", "Cadre de la fonction publique", "Professeur, profession scientifique".}
#'   \item{Date de début du mandat}{Date de début du mandat de l'élu, formatée en `jj/mm/aaaa`. Exemple : "28/06/2020".}
#'   \item{Libellé de la fonction}{Fonction actuelle de l'élu au sein de la collectivité locale, comme "Maire", "Adjoint au maire", ou "Conseiller municipal". Certaines valeurs peuvent être `NA` si la fonction n'est pas définie.}
#'   \item{Date de début de la fonction}{Date à laquelle l'élu a commencé sa fonction, au format `jj/mm/aaaa`. Exemple : "03/07/2020".}
#'   \item{Code nationalité}{Code de la nationalité de l'élu, sous forme de chaîne de caractères. Exemple : "FR" pour France, "US" pour les États-Unis, etc.}
#' }
#' @source <https://www.data.gouv.fr/fr/datasets/repertoire-national-des-elus-1/#/resources/d5f400de-ae3f-4966-8cb6-a85c70c6c24a>
"df_Gers_Loire_Atlantique"
