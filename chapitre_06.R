# Importer et exporter des données 

## Lire des données depuis un fichier 

### Transformer ses données au format TXT ou CSV

### Lire un fichier CSV 

oldWd <- getwd()
print(oldWd)
setwd("..")
getwd()
setwd(oldWd)
getwd()

cat("-myProject
|-myFiles
|-|-data01.csv
|-|-data02.csv
|-myScripts
|-|-myFirstScript.R")

myWD <- "../myFiles/"
setwd(myWd)
getwd() # pour vérifier que nous sommes dans le bon répertoire
list.files() # pour vérifier que le fichier se trouve bien ici

cat("Error in setwd(\"../myFiles/\") : 
impossible de changer de répertoire de travail")

myWD <- "../myFiles/"
setwd(myWd)
read.table(file = "data01.csv")

read.table(file = "../myFiles/data01.csv")

cat("Error in file(file, \"rt\") : impossible d'ouvrir la connexion
De plus : Warning message:
In file(file, \"rt\") :
  impossible d'ouvrir le fichier '../myFiles/data01.csv' : 
  No such file or directory")

myWD <- "../myFiles/"
setwd(myWd)
data01 <- read.table(file = "data01.csv")
str(data01) # vérifier le format des données
head(data01) # vérifier les premières données

# Affichage du fichier brut (10 premières lignes)
readLines("myFiles/E05C13.csv", n = 10)
# lecture du fichier avec R
bdd <- read.table("myFiles/E05C13.csv", skip = 1, header = TRUE, 
  sep = ",", dec = ".", stringsAsFactors = FALSE)
colnames(bdd) <- c("id", "date", "temp")
head(bdd)
tail(bdd)
str(bdd)

### Lire un fichier texte 

# découpage de l'URL puis collage avec paste0() 
# pour tenir sur plusieurs lignes
readmeGitHub <- paste0(
  "https://raw.githubusercontent.com/", 
  "frareb/myRBook_FR/master/_bookdown.yml")
readLines(readmeGitHub)

scan(readmeGitHub, what = "character")

## Exporter ou charger des données pour R

# Création de l'objet myObject
myObject <- 5
# Vérification de l'existence de l'objet
ls(pattern = "myObject")
# Sauvegarde de l'objet dans un fichier RData
save(myObject, file = "myFiles/myObject.RData")
# Suppression de l'objet dans R
rm(myObject)
# Vérification de la suppression
ls(pattern = "myObject")

ls(pattern = "myObject")
load("myFiles/myObject.RData")
ls(pattern = "myObject")
print(myObject)

## Exporter des données

# Création de l'objet dfLetters
dfLetters <- data.frame(num = 1:26, letters = letters)
# Ecriture du contenu dans un fichier CSV
write.table(dfLetters, file = "myFiles/dfLetters.csv", 
  sep = ",", col.names = TRUE, row.names = FALSE)
# Suppression de l'objet dfLetters
rm(dfLetters)
# Lecture du fichier CSV
read.table(
  file = "myFiles/dfLetters.csv", 
  header = TRUE, 
  sep = ",")

## Conclusion
