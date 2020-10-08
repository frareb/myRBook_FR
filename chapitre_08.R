# Gestion d'un projet avec R

## Gestion des fichiers et des répertoires de travail

cat("-myProject
|-myFiles
|-|-data01.csv
|-|-data02.csv
|-myScripts
|-|-myFirstScript.R
|-myOutputs
|-|-dataOut01.csv
|-|-figure01.pdf")

## Gestion des versions de script

cat("-myProject
|-myFiles
|-|-data01.csv
|-|-data02.csv
|-myScripts
|-|-myFirstScript04.R
|-|-ARCHIVES
|-|-|-myFirstScript01.R
|-|-|-myFirstScript02.R
|-|-|-myFirstScript03.R
|-myOutputs
|-|-dataOut01.csv
|-|-figure01.pdf")

## Gestion de la documentation

# ------------------------------------------------------------
# Voici un script pour acquérir les concepts de base 
# avec R
# date de création : 25/06/2018
# date de modification : 23/06/2020
# auteur : François Rebaudo
# ------------------------------------------------------------

# [1] création de l'objet nombre de répétitions
# ------------------------------------------------------------

nbrRep <- 5

# [2] calculs simples
# ------------------------------------------------------------

pi * nbrRep^2

# ------------------------------------------------------------
# Voici un script pour acquérir les concepts de base 
# avec R
# date de création : 25/06/2018
# date de modification : 23/06/2020
# auteur : François Rebaudo
# ------------------------------------------------------------

nbrRep <- 5
pi * nbrRep^2

#' Add together two numbers
#'
#' @param x A number
#' @param y A number
#' @return The sum of \code{x} and \code{y}
#' @examples
#' add(1, 1)
#' add(10, 1)
add <- function(x, y) {
  x + y
}

#' Sum of vector elements.
#'
#' `sum` returns the sum of all the values present 
#' in its arguments.
#'
#' This is a generic function: methods can be defined 
#' for it directly or via the [Summary()] group generic. 
#' For this to work properly, the arguments `...` should 
#' be unnamed, and dispatch is on the first argument.
sum <- function(..., na.rm = TRUE) {}

## Communiquer avec rmarkdown

pkgCheck <- function(x){ 
  if (!require(x, character.only = TRUE)){
    install.packages(x, dependencies = TRUE)
    if(!require(x, character.only = TRUE)) {
      stop()
    }
  }
}
pkgCheck("rmarkdown")

## Conclusion
