#' Donnees des elus des departements du Gers et de la Loire-Atlantique
#'
#' Un sous-ensemble des donnees du repertoire national des elus, representant les elus des departements
#' du Gers et de la Loire-Atlantique. Ces donnees incluent des informations sur les elus, telles que
#' leur nom, sexe, date de naissance, categorie socio-professionnelle, ainsi que des details sur leur
#' mandat et fonction au sein des collectivites locales.
#'
#' @format Un `tibble` avec 9 752 lignes et 16 colonnes :
#' \describe{
#'   \item{Code du departement}{Numero unique du departement, numerique. Par exemple, 32 pour le Gers et 44 pour la Loire-Atlantique.}
#'   \item{Libelle du departement}{Nom du departement sous forme de chaine de caracteres. Exemple : "Gers", "Loire-Atlantique".}
#'   \item{Code de la collectivite a statut particulier}{Indicateur logique (TRUE/FALSE) pour les departements ayant un statut particulier. Certaines collectivites ont un statut particulier qui n'est pas applicable a toutes les collectivites locales. Les valeurs peuvent etre `NA` si le statut particulier n'est pas applicable.}
#'   \item{Libelle de la collectivite a statut particulier}{Nom de la collectivite ayant un statut particulier. Generalement vide (NA) pour la plupart des lignes, sauf si un elu appartient a une collectivite ayant un statut particulier, tel que les DOM-TOM ou certaines collectivites specifiques.}
#'   \item{Code de la commune}{Code numerique unique attribue a chaque commune, par exemple "32001" pour Aignan dans le Gers.}
#'   \item{Libelle de la commune}{Nom de la commune sous forme de chaine de caracteres. Exemple : "Aignan", "Nantes".}
#'   \item{Nom de l'elu}{Nom de famille de l'elu. Exemples : "AURENSAN", "BARATAULT".}
#'   \item{Prenom de l'elu}{Prenom de l'elu. Exemple : "Michel", "Philippe", "Mathieu", "Marie-Pierre".}
#'   \item{Code sexe}{Code de sexe de l'elu, sous forme de chaine de caracteres, avec des valeurs possibles "M" pour masculin et "F" pour feminin. Exemple : "M", "F".}
#'   \item{Date de naissance}{Date de naissance de l'elu au format `jj/mm/aaaa`. Exemple : "09/07/1952", "08/12/1957".}
#'   \item{Code de la categorie socio-professionnelle}{Code numerique representant la categorie socio-professionnelle de l'elu. Il est base sur des classifications standardisees, comme "11" pour "Ancienne profession intermediaire", "12" pour "Cadre de la fonction publique", etc.}
#'   \item{Libelle de la categorie socio-professionnelle}{Nom complet de la categorie socio-professionnelle. Exemple : "Ancienne profession intermediaire", "Cadre de la fonction publique", "Professeur, profession scientifique".}
#'   \item{Date de debut du mandat}{Date de debut du mandat de l'elu, formatee en `jj/mm/aaaa`. Exemple : "28/06/2020".}
#'   \item{Libelle de la fonction}{Fonction actuelle de l'elu au sein de la collectivite locale, comme "Maire", "Adjoint au maire", ou "Conseiller municipal". Certaines valeurs peuvent etre `NA` si la fonction n'est pas definie.}
#'   \item{Date de debut de la fonction}{Date a laquelle l'elu a commence sa fonction, au format `jj/mm/aaaa`. Exemple : "03/07/2020".}
#'   \item{Code nationalite}{Code de la nationalite de l'elu, sous forme de chaine de caracteres. Exemple : "FR" pour France, "US" pour les Etats-Unis, etc.}
#' }
#' @source <https://www.data.gouv.fr/fr/datasets/repertoire-national-des-elus-1/#/resources/d5f400de-ae3f-4966-8cb6-a85c70c6c24a>
#' @export
"df_Gers_Loire_Atlantique"
