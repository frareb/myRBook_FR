# Les fonctions

## Qu'est-ce qu'une fonction

5 + 2
'+'(5, 2)

## Les fonctions les plus courantes

### L'accès à la documentation

#### `help()`

help(matrix) # équivalent à ?matrix

# Description
# matrix creates a matrix from the given set of values.
# as.matrix attempts to turn its argument into a matrix.
# is.matrix tests if its argument is a (strict) matrix.

# Usage
# matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE,
#        dimnames = NULL)

# Arguments
# data      an optional data vector (including a list or 
#           expression vector). Non-atomic classed R 
#           objects are coerced by as.vector and all 
#           attributes discarded.
# nrow      the desired number of rows.
# ncol      the desired number of columns.
# byrow     logical. If FALSE (the default) the matrix is 
#           filled by columns, otherwise the matrix is 
#           filled by rows.
# dimnames  A dimnames attribute for the matrix: NULL or 
#           a list of length 2 giving the row and column 
#           names respectively. An empty list is treated as 
#           NULL, and a list of length one as row names. The 
#           list can be named, and the list names will be 
#           used as names for the dimensions.

## Example of setting row and column names
mdat <- matrix(
  c(1,2,3, 11,12,13), 
  nrow = 2, ncol = 3, byrow = TRUE,
  dimnames = list(
    c("row1", "row2"),
    c("C.1", "C.2", "C.3")))
print(mdat)

# bon exemple
mdat <- matrix(
  c(1, 2, 3, 11, 12, 13), 
  nrow = 2, ncol = 3, 
  byrow = TRUE)
# mauvais exemple
mdat <- matrix(
  c(1, 2, 3, 11, 12, 13), 
  nr = 2, nc = 3, 
  byr = T)
# très mauvais exemple
mdat <- matrix(c(1,2,3,11,12,13),2,3,T)

#### `help.search()`

help.search("average")

### Visualiser les données

#### `str()`

str(iris)

#### `head()` et `tail()`

head(iris)
tail(iris)
head(iris, n = 2)

#### `names()`

names(iris)
irisCopy <- iris
names(irisCopy) <- c("a", "b", "c", "d", "e")
names(irisCopy)

#### `cat()` et `print()`

cat(names(iris))
print(names(iris))
cat(iris[1, 1])
print(iris[1, 1])
print(iris[1, 1], digits = 0)

### Manipuler les données 

#### `rank()`

vecManip <- c(10, 20, 30, 70, 60, 50, 40)
rank(vecManip)
vecManip2 <- c(10, 20, 30, 10, 50, 10, 40)
rank(vecManip2)
rank(vecManip2, ties.method = "first")
rank(vecManip2, ties.method = "min")
print(iris[, 1])
rank(iris[, 1], ties.method = "average")
# help(rank)
# ...
# Usage
# rank(x, na.last = TRUE,
#     ties.method = c("average", "first", "last", 
#       "random", "max", "min"))

#### `order()`

print(vecManip2)
rank(vecManip2)
# il y a 3 éléments en première position : 1, 4 et 6 (10)
# qui vont prendre avec rank la valeur 2. Puis vient
# l'élément 2 (20) qui prend avec rank la valeur 4, ...
order(vecManip2)
# le premier élément est en position 1, le deuxième
# élément en position 4, le troisième en position 6, 
# le quatrième en position 2, ...
print(iris[, 1])
rank(iris[, 1])
order(iris[, 1])
head(iris, n = 10)
# tri du data.frame iris en fonction de la colonne 1 :
head(iris[order(iris[, 1]),], n = 10)

#### `sort()`

print(vecManip2)
sort(vecManip2)
print(iris[, 1])
sort(iris[, 1])

#### `append()`

print(vecManip2)
append(vecManip2, 5)
append(vecManip2, 5, after = 2)

#### `cbind()` et `rbind()`

cbind(vecManip2, vecManip2)
rbind(vecManip2, vecManip2)

#### `paste()` et `paste0()`

paste(1, "a")
paste0(1, "a")
paste(1, "a", sep = "_")
paste0("prefix_", vecManip2, "_suffix")
paste(vecManip2, rank(vecManip2), sep = "_")

#### `rev()`

print(vecManip2)
rev(vecManip2)

#### `%in%`

print(vecManip)
print(vecManip2)
vecManip %in% vecManip2
vecManip2 %in% vecManip

### Fonctions mathématiques

print(vecManip2)
exp(vecManip2)
sqrt(vecManip2)
abs(-vecManip2)
sin(vecManip2)
cos(vecManip2)
tan(vecManip2)
log(vecManip2)
log10(vecManip2)
acos(vecManip2/100)
asin(vecManip2/100)
atan(vecManip2/100)

### Statistiques descriptives

#### `mean()`

mean(iris[, 1])
vecManip3 <- c(1, 5, 6, 8, NA, 45, NA, 14)
mean(vecManip3)
mean(vecManip3, na.rm = TRUE)

#### `sd()` et `var()`

sd(iris[, 1])
sqrt(var(iris[, 1]))
print(vecManip3)
sd(vecManip3)
sd(vecManip3, na.rm = TRUE)

#### `max()` et `min()`

max(iris[, 1])
print(vecManip3)
max(vecManip3)
max(vecManip3, na.rm = TRUE)

min(iris[, 1])
min(vecManip3)
min(vecManip3, na.rm = TRUE)

#### `quantile()`

quantile(iris[, 1])
quantile(iris[, 1], probs = c(0, 0.25, 0.5, 0.75, 1))
quantile(iris[, 1], probs = c(0, 0.1, 0.5, 0.9, 1))

#### `summary()`

summary(iris[, 1])

summary(
  sample(
    x = c(1:5, NA), 
    size = 100, 
    replace = TRUE
  )
)

#### `median()`

median(iris[, 1])
print(vecManip3)
median(vecManip3)
median(vecManip3, na.rm = TRUE)

#### `length()`

length(iris[, 1])
print(vecManip3)
length(vecManip3)

#### `nrow()` et `ncol()`

nrow(iris)
ncol(iris)

#### `round()`, `ceiling()`, `floor()`, et `trunc()`

round(5.56874258564)
round(5.56874258564, digits = 2)

ceiling(5.9999)
ceiling(5.0001)

floor(5.9999)
floor(5.0001)

trunc(5.9999)
trunc(5.0001)

#### `rowSums()` et `colSums()`

rowSums(iris[, c(1, 2, 3, 4)])
colSums(iris[, c(1, 2, 3, 4)])

#### `rowMeans()` et `colMeans()`

rowMeans(iris[, c(1, 2, 3, 4)])
colMeans(iris[, c(1, 2, 3, 4)])

#### `aggregate()`

aggregate(
  iris[, c(1, 2, 3, 4)], 
  by = list(iris$Species), 
  FUN = mean)
aggregate(
  iris[, c(1, 2)], 
  by = list(iris$Species), 
  FUN = summary)

#### `range()`

range(iris[, 1])
print(vecManip3)
range(vecManip3)
range(vecManip3, na.rm = TRUE)

#### `unique()`

unique(iris[, 1])
print(vecManip3)
unique(vecManip3)

## Autres fonctions utiles

### `seq_along()`

print(vecManip3)
seq_along(vecManip3)

### `:`

5:10
head(iris[, c(1, 2, 3, 4)])
head(iris[, 1:4]) # ;-)
miVec01 <- c(1, 2, 3, 4)
miVec01 <- 1:4 # ;-)
-10:12
5:-5
paste("X", 1:10, sep = "_")

### `rep()`

miVec12 <- c(1, 1, 1, 1, 1, 1, 1, 1, 1)
miVec12 <- rep(1, times = 9) # ;-)
rep("Hola", times = 3)
rep(1:3, time = 3)
rep(1:3, length.out = 10)
rep(1:3, each = 3)

### `seq()`

seq(from = 0, to = 1, by = 0.2)
seq(from = 20, to = 10, length.out = 10)
letters[seq(from = 1, to = 26, by = 2)]
rep(seq(from = 1, to = 2, by = 0.5), times = 3)

### `getwd()`

getwd()

### `setwd()`

oldWd <- getwd()
print(oldWd)
setwd("..")
getwd()
setwd(oldWd)
getwd()

### `list.files()`

list.files(pattern = "(html)$") # html
list.files(pattern = "(pdf)$") # pdf

### `ls()`

ls()
zzz <- "a new object"
ls()

### `rm()`

rm(zzz)
ls()

### Statistiques descriptives

length(iris$Sepal.Width[iris$Sepal.Width > 3])
length(iris$Sepal.Width[iris$Sepal.Width > 2.8 & 
  iris$Sepal.Width < 3.2])
table(iris$Sepal.Width)
table(round(iris$Sepal.Width))
irisSepWCopy <- iris$Sepal.Width
irisSepWCopy <- irisSepWCopy[order(irisSepWCopy)]
head(irisSepWCopy, n = 10)
quantile(irisSepWCopy, probs = c(0.05, 0.95))
qnorm(
  p = c(0.05, 0.95), 
  mean = mean(irisSepWCopy), 
  sd = sd(irisSepWCopy)
)

## Ecrire une fonction

35 + 20
758 + 20
862 + 20
782 + 20

addX <- function(x){
  return(x + 20)
}

addX(35)
addX(758)
addX(862)
addX(782)

addX <- function(x){
  return(x + 45)
}
addX(35)
addX(758)
addX(862)
addX(782)

c(35, 758, 862, 782) + 20

countVowelConso <- function(word){
  wordSplit <- strsplit(word, split = "")[[1]]
  vowels <- c("a", "e", "i", "o", "u", "y")
  numVowel <- length(wordSplit[wordSplit %in% vowels])
  consonants <- letters[!letters %in% vowels]
  numConso <- length(wordSplit[wordSplit %in% consonants])
  return(c(numVowel, numConso))
}

countVowelConso(word = "qwertyuiop azertyuiop")

countVowelConso <- function(word){
  wordSplit <- strsplit(word, split = "")[[1]]
  vowels <- c("a", "e", "i", "o", "u", "y")
  numVowel <- length(wordSplit[wordSplit %in% vowels])
  consonants <- letters[!letters %in% vowels]
  numConso <- length(wordSplit[wordSplit %in% consonants])
  print(paste0("Il y a ", numVowel, " voyelles et ", 
    numConso, " consonnes dans le mot '", word, "'."))
  return(c(numVowel, numConso))
}
countVowelConso(word = "qwertyuiop azertyuiop")

countVowelConso <- function(word){ # compte les voyelles 
                                   # et les consonnes
  if(is.vector(word) & is.character(word) & length(word) == 1){
    wordSplit <- strsplit(word, split = "")[[1]]
    vowels <- c("a", "e", "i", "o", "u", "y")
    numVowel <- length(wordSplit[wordSplit %in% vowels])
    consonants <- letters[!letters %in% vowels]
    numConso <- length(wordSplit[wordSplit %in% consonants])
    return(c(numVowel, numConso))
  } else {
    print(paste0("Erreur dans la fonction countVowelConso, ", 
      "argument 'word' incorrect (", word, ")"))
  }
} 
countVowelConso(word = "qwertyuiop azertyuiop")
countVowelConso(word = 5)

countVowelConsoAlt <- function(word){ # compte les voyelles 
                                      # et les consonnes
  if(is.vector(word) & is.character(word) & length(word) == 1){
    wordSplit <- strsplit(word, split = "")[[1]]
    vowels <- c("a", "e", "i", "o", "u", "y")
    numVowel <- sum(wordSplit %in% vowels)
    consonants <- letters[!letters %in% vowels]
    numConso <- sum(wordSplit %in% consonants)
    return(c(numVowel, numConso))
  } else {
    print(paste0("Erreur dans la fonction countVowelConso, ", 
      "argument 'word' incorrect (", word, ")"))
  }
} 
countVowelConsoAlt(word = "qwertyuiop azertyuiop")

system.time(replicate(
  n = 100000, 
  countVowelConso(word = "qwertyuiop azertyuiop")))
system.time(replicate(
  n = 100000, 
  countVowelConsoAlt(word = "qwertyuiop azertyuiop")))

countVowelConsoAlt <- function(word = "qwerty"){ 
  if(is.vector(word) & is.character(word) & length(word) == 1){
    wordSplit <- strsplit(word, split = "")[[1]]
    vowels <- c("a", "e", "i", "o", "u", "y")
    numVowel <- sum(wordSplit %in% vowels)
    consonants <- letters[!letters %in% vowels]
    numConso <- sum(wordSplit %in% consonants)
    return(c(numVowel, numConso))
  } else {
    print(paste0("Erreur dans la fonction countVowelConso, ", 
      "argument 'word' incorrect (", word, ")"))
  }
} 
countVowelConsoAlt()

## Les packages

### Installer un package

install.packages("stats") # R statistical functions

### Charger un package

library("stats")

### Portabilité du code

pkgCheck <- function(packages){
  for(x in packages){
    try(if(!require(x, character.only = TRUE)){
      install.packages(x, dependencies = TRUE)
      if(!require(x, character.only = TRUE)){
        stop()
      }
    })
  }
}
pkgCheck(c("stats", "graphics"))

head(.packages(all.available = TRUE), n = 30)

## Conclusion
