# Algorithmique
## Tests logiques avec `if`

myVar <- 2
if(myVar < 3) print("myVar < 3")
if(myVar < 3) print("myVar < 3") else print("myVar > 3")

myVar <- 2
myResult <- 0
if(myVar < 3){
  print("myVar < 3")
  myResult <- myVar + 10
} else {
  print("myVar > 3")
  myResult <- myVar - 10
}
print(myResult)

myVar <- "qwerty"
if(is.character(myVar)){
  print("ok")
} else {
  print("error")
}

myVar <- TRUE
if(is.character(myVar)){
  print("myVar: character")
} else {
  if(is.numeric(myVar)){
    print("myVar: numeric")
  } else {
    if(is.logical(myVar)){
      print("myVar: logical")
    } else {
      print("myVar: ...")
    }
  }
}

myVar <- 2
if(myVar > 1 & myVar < 50){
  print("ok")
}

myVar <- "azerty"
limInit <- 1
limEnd <- 50
if(myVar > limInit & myVar < limEnd){
  print(paste0(myVar, " is between ", 
    limInit, " and ", limEnd, "."))
} else {
  print(paste0(myVar, " not between ", 
    limInit, " and ", limEnd, "."))
}
myVar <- "2azerty"
if(myVar > limInit & myVar < limEnd){
  print(paste0(myVar, " is between ", 
    limInit, " and ", limEnd, "."))
} else {
  print(paste0(myVar, " not between ", 
    limInit, " and ", limEnd, "."))
}

myVar <- "2azerty"
if(is.numeric(myVar)){
  if(myVar > limInit & myVar < limEnd){
    print(paste0(myVar, " is between ", 
      limInit, " and ", limEnd, "."))
  } else {
    print(paste0(myVar, " not between ", 
      limInit, " and ", limEnd, "."))
  }
} else {
  print(paste0("Object ", myVar, " is not numeric"))
}

mySpecies <- c(15, 14, 20, 12)
if(length(mySpecies) == 1 & mySpecies > 10){
  print("ok!")
}
## Warning message:
## In if (length(mySpecies) == 1 & mySpecies > 10) { :
##   the condition has length > 1 and only the first 
##   element will be used

mySpecies <- c(15, 14, 20, 12)
if(length(mySpecies) == 1){
  if(mySpecies > 10){
    print("ok!")
  }
}

mySpecies <- c(15, 14, 20, 12)
if(length(mySpecies) == 1 && mySpecies > 10){
  print("ok!")
}
mySpecies <- 15
if(length(mySpecies) == 1 && mySpecies > 10){
  print("ok!")
}
mySpecies <- 5
if(length(mySpecies) == 1 && mySpecies > 10){
  print("ok!")
}

## Tests logiques avec `switch`

x <- "aa"
if(x == "a"){
  result <- 1
}
if(x == "aa"){
  result <- 2
}
if(x == "aaa"){
  result <- 3
}
if(x == "aaaa"){
  result <- 4
}
print(result)

x <- "aa"
switch(x, 
  a = result <- 1,
  aa = result <- 2,
  aaa = result <- 3,
  aaaa = result <- 4)
print(result)

## La boucle `for`

bdd <- data.frame(date01 = rnorm(n = 100, mean = 10, sd = 1), 
                  date02 = rnorm(n = 100, mean = 10, sd = 1))
print(head(bdd))

bdd$dif <- NA
bdd$isDifBig <- NA

bdd$dif[1] <- sqrt((bdd$date01[1] - bdd$date02[1])^2)
bdd$dif[2] <- sqrt((bdd$date01[2] - bdd$date02[2])^2)
bdd$dif[3] <- sqrt((bdd$date01[3] - bdd$date02[3])^2)
# ...
bdd$dif[100] <- sqrt((bdd$date01[100] - bdd$date02[100])^2)

if(bdd$dif[1] > 3){
  bdd$isDifBig[1] <- "big"
}else{
  bdd$isDifBig[1] <- "small"
}
if(bdd$dif[2] > 3){
  bdd$isDifBig[2] <- "big"
}else{
  bdd$isDifBig[2] <- "small"
}
if(bdd$dif[3] > 3){
  bdd$isDifBig[3] <- "big"
}else{
  bdd$isDifBig[3] <- "small"
}
# ...
if(bdd$dif[100] > 3){
  bdd$isDifBig[100] <- "big"
}else{
  bdd$isDifBig[100] <- "small"
}

for(i in c(3, 4, 5, 6, 7, 8, 9)){
  print(i^2)
}

for(i in 3:9){
  print(i^2)
}

for(myVarFor in 3:9){
  print(myVarFor^2)
}

nChar <- c("a", "z", "e", "r", "t", "y")
for(i in nChar){
  print(i)
}

bdd$dif <- NA
bdd$isDifBig <- NA
for(i in 1:nrow(bdd)){
  bdd$dif[i] <- sqrt((bdd$date01[i] - bdd$date02[i])^2)
  if(bdd$dif[i] > 3){
    bdd$isDifBig[i] <- "big"
  }else{
    bdd$isDifBig[i] <- "small"
  }
}
print(head(bdd, n = 20))

bdd$dif <- sqrt((bdd$date01 - bdd$date02)^2)
bdd$isDifBig <- "small"
bdd$isDifBig[bdd$dif > 3] <- "big"
print(head(bdd, n = 20))

# tester si des nombres sont pairs
# [1] FOR
x <- sample(1:100, size = 20)
count <- 0
for (val in x) {
  if(val %% 2 == 0){
    count <- count + 1
  }
}
print(count)
# [2] VECTOR
sum(x %% 2 == 0)

# calculer des carrés
# [1] FOR
x <- rep(0, 20)
for (j in 1:20){
  x[j] <- j^2
}
print(x)
# [2] VECTOR
(1:20)^2

# répéter un lancer de dés et faire la moyenne
# [1] FOR
ntrials = 1000
trials = rep(0, ntrials)
for (j in 1:ntrials){
  trials[j] = sample(1:6, size = 1)
}
mean(trials)
# [2] VECTOR
mean(sample(1:6, ntrials, replace = TRUE))

myMat <- matrix(
  sample(1:100, size = 1000, replace = TRUE), 
  ncol = 10)
# VECTOR
sumRow <- myMat[, 1] + myMat[, 2] + myMat[, 3] + myMat[, 4] + 
  myMat[, 5] + myMat[, 6] + myMat[, 7] + myMat[, 8] + 
  myMat[, 9] + myMat[, 10]
print(sumRow)
# FOR
sumRow <- rep(NA, times = nrow(myMat))
for(j in 1:nrow(myMat)){
  sumRow[j] <- sum(myMat[j, ])
}
print(sumRow)

## La boucle `while`

i <- 0
while(i < 10){
  print(i)
  i <- i + 1
}

myNumber <- sample(x = 10000, size = 1)
myGuess <- sample(x = 10000, size = 1)
startTime <- Sys.time()
numberGuess <- 0
while(Sys.time() - startTime < 2){
  if(myGuess == myNumber){
    numberGuess <- numberGuess + 1
    print("Number found !")
    print(paste0("And I have plenty of time left: ", 
      round(2 - as.numeric(Sys.time() - startTime), digits = 2), 
      " sec"))
    break
  }else{
    myGuess <- sample(x = 10000, size = 1)
    numberGuess <- numberGuess + 1
  }
}

## La boucle `repeat` 

i <- 1
repeat{
  print(i^2)
  i <- i + 1
  if(i == 5){
    break
  }
}

numTry <- 0
repeat{
  myNumber <- sample(x = 10000, size = 1)
  myGuess <- sample(x = 10000, size = 1)
  startTime <- Sys.time()
  numberGuess <- 0
  while(Sys.time() - startTime < 2){
    if(myGuess == myNumber){
      numberGuess <- numberGuess + 1
      print(round(
        as.numeric(Sys.time() - startTime), 
        digits = 3))
      break
    }else{
      myGuess <- sample(x = 10000, size = 1)
      numberGuess <- numberGuess + 1
    }
  }
  numTry <- numTry + 1
  if(numTry == 5){break}
}

## `next` et `break`

myVars <- 111:1000
for(myVar in myVars){
  if(myVar %% 32 == 0){
    print(myVar)
    break
  }
}

(111:1000)[111:1000 %% 32 == 0]

(111:1000)[111:1000 %% 32 == 0][1]

for(myLetter in letters){
  if(myLetter %in% c("a", "e", "i", "o", "u", "y")){
    next
  }
  print(myLetter)
}

letters[! letters %in% c("a", "e", "i", "o", "u", "y")]

## Les boucles de la famille `apply`

### `apply` 

myMat <- matrix(
  sample(1:100, size = 1000, replace = TRUE), 
  ncol = 10)
apply(X = myMat, MARGIN = 1, FUN = sum)

apply(X = myMat, MARGIN = 2, FUN = median)

# création de la matrix
myArr <- array(
  sample(1:100, size = 1000, replace = TRUE), 
  dim = c(10, 20, 5))
# Calcul avec APPLY
apply(X = myArr, MARGIN = 1, FUN = mean)
# Calcul "à la main"
(apply(myArr[,,1], 1, mean) + apply(myArr[,,2], 1, mean) + 
  apply(myArr[,,3], 1, mean) + apply(myArr[,,4], 1, mean) + 
  apply(myArr[,,5], 1, mean))/5
# Calcul avec APPLY
apply(X = myArr, MARGIN = 2, FUN = mean)
# Calcul "à la main"
(apply(myArr[,,1], 2, mean) + apply(myArr[,,2], 2, mean) + 
  apply(myArr[,,3], 2, mean) + apply(myArr[,,4], 2, mean) + 
  apply(myArr[,,5], 2, mean))/5
# Calcul avec APPLY
apply(X = myArr, MARGIN = 3, FUN = mean)
# Calcul "à la main"
c(mean(myArr[,,1]), mean(myArr[,,2]), mean(myArr[,,3]), 
  mean(myArr[,,4]), mean(myArr[,,5]))

apply(X = myArr, MARGIN = c(1, 2), FUN = mean)

### `lapply` 

# Création de l'objet myList
myList <- list(
  a = sample(1:100, size = 10), 
  b = sample(1:100, size = 10), 
  c = sample(1:100, size = 10), 
  d = sample(1:100, size = 10), 
  e = sample(1:100, size = 10)
)
print(myList)
# Fonction moyenne appliquée à chacun des
# éléments de la list
lapply(myList, FUN = mean)

for(i in 1:length(myList)){
  mean(myList[[i]])
}

myResult <- list(a = NULL, b = NULL, c = NULL, 
  d = NULL, e = NULL)
for(i in 1:length(myList)){
  myResult[[i]] <- mean(myList[[i]])
}
print(myResult)

# Création de l'objet myList
myList <- list(
  a = sample(c(1:5, NA), size = 10, replace = TRUE), 
  b = sample(c(1:5, NA), size = 10, replace = TRUE), 
  c = sample(c(1:5, NA), size = 10, replace = TRUE), 
  d = sample(c(1:5, NA), size = 10, replace = TRUE), 
  e = sample(c(1:5, NA), size = 10, replace = TRUE)
)
print(myList)
lapply(myList, FUN = mean)
lapply(myList, FUN = mean, na.rm = TRUE)

lapply(myList, FUN = function(i){
  mean(i, na.rm = TRUE)
})

lapply(myList, FUN = function(i){
  m <- mean(i, na.rm = TRUE)
  if(m > 3){
    return(i^2)  
  }else{
    return(i^3)
  }
})

### `sapply` 

lapply(myList, FUN = function(i){
  mean(i, na.rm = TRUE)
})
sapply(myList, FUN = function(i){
  mean(i, na.rm = TRUE)
})

sapply(myList, FUN = '[[', 2)

### `tapply` 

species <- sample(LETTERS[1:10], size = 1000, replace = TRUE)
perf1 <- rnorm(n = 1000, mean = 10, sd = 0.5)
perf2 <- rlnorm(n = 1000, meanlog = 10, sdlog = 0.5)
perf3 <- rgamma(n = 1000, shape = 10, rate = 0.5)
dfSpecies <- data.frame(species, perf1, perf2, perf3)
print(head(dfSpecies, n = 10))

tapply(dfSpecies$perf1, INDEX = dfSpecies$species, FUN = summary)

sapply(2:4, FUN = function(i){
  tapply(dfSpecies[,i], INDEX = dfSpecies$species, FUN = mean)
})

for(i in 2:4){
  for(spp in unique(dfSpecies$species)){
    mean(dfSpecies[,i][dfSpecies$species == spp])
  }
}

for(i in 2:4){
  myPerf <- rep(NA, length(unique(dfSpecies$species)))
  for(spp in seq_along(unique(dfSpecies$species))){
    myPerf[spp] <- mean(
      dfSpecies[,i][dfSpecies$species == 
        unique(dfSpecies$species)[spp]])
  }
  assign(x = paste0("perf", i - 1), value = myPerf)
}
myDF <- data.frame(perf1, perf2, perf3)
rownames(myDF) <- unique(dfSpecies$species)
print(myDF)

### `mapply` 

mapply(
  FUN = function(i, j){i+j}, 
  i = list(1:5, 5:1), 
  j = c(10, 100))

## Conclusion
