# Les conteneurs de données

## Le conteneur `vector`

### Créer un `vector`

miVec01 <- c(1, 2, 3, 4) # un vecteur de 4 éléments 
                         # de type numeric ; double
print(miVec01)
typeof(miVec01)
is.vector(miVec01)

miVec02 <- c("a", "b", "c") 
print(miVec02)
typeof(miVec02)
is.vector(miVec02)

miVec03 <- c(TRUE, FALSE, FALSE, TRUE)
print(miVec03)
typeof(miVec03)
is.vector(miVec03)

miVecNA <- c(1, NA, 3, NA, 5)
print(miVecNA)
typeof(miVecNA)
is.vector(miVecNA)

miVec04 <- c(1, "a")
print(miVec04)
typeof(miVec04)
is.vector(miVec04)

miVec05 <- c(factor("abc"), "def")
print(miVec05)
typeof(miVec05)

miVec05b <- c(factor("abc"), factor("ghi"), "def")
print(miVec05b)
miVec05c <- c(factor(c("abc", "ghi")), "def")
print(miVec05c)

miVec06 <- c(TRUE, "def")
print(miVec06)
typeof(miVec06)
miVec07 <- c(factor("abc"), 55)
print(miVec07)
typeof(miVec07)

miVec08 <- c(TRUE, 55)
print(miVec08)
typeof(miVec08)

miVec09 <- c(miVec02, "d", "e", "f")
print(miVec09)
miVec10 <- c("aaa", "aa", miVec09, "d", "e", "f")
print(miVec10)
miVec11 <- c(789, miVec01 , 564)
print(miVec11)

### Opérations sur un `vector`

print(miVec01)
miVec01 + 1
miVec01 - 1
miVec01 * 2
miVec01 /10

miVec12 <- c(1, 1, 1, 1, 1, 1, 1, 1, 1)
print(miVec12)
miVec13 <- c(10, 20, 30)
print(miVec13)
miVec12 + miVec13 # vecteurs de tailles différentes : 
miVec14 <- c(10, 20, 30, 40, 50, 60, 70, 80, 90)
print(miVec14)
miVec12 + miVec14 # les vecteurs sont de la même longueur
miVec15 <- c(1, 1, 1, 1)
print(miVec15)
miVec15 + miVec13 # vecteurs de tailles dif. et non multiples

miVec14 + c(10, 100)

### Accéder aux valeurs d'un `vector`

miVec20 <- c(10, 20, 30, 40, 50, 60, 70, 80, 90)
miVec21 <- c("a", "b", "c", "d", "e", "f", "g", "h", "i")
print(miVec20)
print(miVec21)

print(miVec20[1])
print(miVec21[3])

print(miVec20[c(1, 5, 9)])
print(miVec21[c(4, 3, 1)])
print(miVec21[c(4, 4, 3, 4, 3, 2, 5)])

print(miVec20[miVec20 >= 50])
print(miVec20[(miVec20 >= 50) & ((miVec20 < 80))])
print(miVec20[miVec20 != 50])
print(miVec20[miVec20 == 30])
print(miVec20[(miVec20 == 30) | (miVec20 == 50)])

print(miVec21[miVec21 == "a"])

print(miVec21[miVec20 >= 50])
print(miVec21[(miVec20 >= 50) & ((miVec20 < 80))])
print(miVec21[miVec20 != 50])
print(miVec21[miVec20 == 30])
print(miVec21[(miVec20 == 30) | (miVec20 == 50)])
print(miVec21[(miVec20 == 30) | (miVec21 == "h")])

print(miVec20[-1])
print(miVec21[-5])
print(miVec20[-c(1, 2, 5)])
print(miVec21[-c(1, 2, 5)])

miVec22 <- c(TRUE, TRUE, FALSE, TRUE, 
  FALSE, TRUE, FALSE, TRUE, TRUE)
print(miVec21[miVec22])

### Nommer les éléments d'un `vector`

miVec23 <- c(aaa = 10, bbb = 20, ccc = 30, ddd = 40, eee = 50)
print(miVec23)
print(miVec23["bbb"])
print(miVec23[c("bbb", "ccc", "bbb")])
names(miVec23)

### Modifier les éléments d'un `vector`

print(miVec21)
miVec21[3] <- "zzz"
print(miVec21)
miVec21[(miVec20 >= 50) & ((miVec20 < 80))] <- "qwerty"
print(miVec21)

print(miVec23)
miVec23["ccc"] <- miVec23["ccc"] + 100
print(miVec23)

print(miVec23)
names(miVec23)[2] <- "bb_bb"
print(miVec23)

## Le conteneur `list`

### Créer une `list`

miList01 <- list()
print(miList01)
miList02 <- list(5, "qwerty", c(4, 5, 6), c("a", "b", "c"))
print(miList02)
miList03 <- list(5, "qwerty", list(c(4, 5, 6), c("a", "b", "c")))
print(miList03)

is.list(miList02)
typeof(miList02)

### Accéder aux valeurs d'une `list`

print(miList02)

typeof(miList02)
print(miList02[[1]])
typeof(miList02[[1]])
print(miList02[[2]])
typeof(miList02[[2]])
print(miList02[[3]])
typeof(miList02[[3]])
print(miList02[[4]])
typeof(miList02[[4]])

print(miList02[[4]][2])

miList04 <- list(miList02, miList03)
print(miList04)
print(miList04[[2]][[3]][[1]][1])

bddInsect <- list(Snonagrioides = list(site01 = c(12, 5, 8, 7), 
site02 = c(5, 23, 4, 41), site03 = c(12, 0, 0, 0)), Onubilalis = 
list(site01 = c(12, 1, 2, 3), site02 = c(0, 0, 0, 1), site03 = 
c(1, 1, 2, 3)))
print(bddInsect)

bddInsect <- list(
  Snonagrioides = list(
    site01 = c(12, 5, 8, 7), 
    site02 = c(5, 23, 4, 41), 
    site03 = c(12, 0, 0, 0)
  ), 
  Onubilalis = list(
    site01 = c(12, 1, 2, 3), 
    site02 = c(0, 0, 0, 1), 
    site03 = c(1, 1, 2, 3)
  )
)

print(bddInsect[[1]][[2]])
print(bddInsect$Snonagrioides$site02)
print(bddInsect[['Snonagrioides']][['site02']])

names(bddInsect)
names(bddInsect[[1]])

print(bddInsect[[1]][[2]])
typeof(bddInsect[[1]][[2]])
is.list(bddInsect[[1]][[2]])

print(bddInsect[[1]][2])
typeof(bddInsect[[1]][2])
is.list(bddInsect[[1]][2])

print(bddInsect[[1]][c(1, 2)])
print(bddInsect[[1]][c("site01", "site02")])

### Modification d'une `list`

print(miList02)
miList02[[1]] <- 12
print(miList02)
miList02[[4]] <- c("d", "e", "f")
print(miList02)
miList02[[4]] <- c("a", "b", "c", miList02[[4]], "g", "h", "i")
print(miList02)
miList02[[4]][5] <- "eee"
print(miList02)
miList02[[3]] <- miList02[[3]] * 10 - 1
print(miList02)
miList02[[3]][2] <- miList02[[1]] * 100
print(miList02)

print(bddInsect)
bddInsect[['Snonagrioides']][['site02']] <- c(2, 4, 6, 8)
print(bddInsect)

miList0203 <- c(miList02, miList03)
print(miList0203)

miList05 <- list("a", c("b", "c"), "d")
print(miList05)
miVec24 <- unlist(miList05)
print(miVec24)
miList06 <- list(c(1, 2, 3), c(4, 5, 6, 7), 8, 9, c(10, 11))
print(miList06)
miVec25 <- unlist(miList06)
print(miVec25)

print(miList05)
miList05 <- c(miList05, "e")
print(miList05)
miList05[[5]] <- c("fgh", "ijk")
print(miList05)

print(miList05)
miList05[[2]] <- NULL
print(miList05)

## Le conteneur `data.frame`

### Créer un `data.frame`

# création d'un data.frame 
miDf01 <- data.frame(
  numbers = c(1, 2, 3, 4), 
  logicals = c(TRUE, TRUE, FALSE, TRUE), 
  characters = c("a", "b", "c", "d")
)
print(miDf01)

# création des vecteurs, puis du data.frame
numbers <- c(1, 2, 3, 4)
logicals <- c(TRUE, TRUE, FALSE, TRUE)
characters <- c("a", "b", "c", "d")
miDf01 <- data.frame(numbers, logicals, characters)
print(miDf01)

### Accéder aux valeurs d'un `data.frame`

print(miDf01$numbers) # vector
print(miDf01[[1]]) # vector
print(miDf01[1]) # list
print(miDf01["numbers"]) # list
print(miDf01[["numbers"]]) # vector

myRow <- 2
myCol <- 1
print(miDf01[myRow, myCol])
print(miDf01[myRow, ])
print(miDf01[, myCol])
myCol <- "numbers"
print(miDf01[, myCol])

print(miDf01[, c(1, 2)])
print(miDf01[c(2, 1), ])

miDfSub01 <- miDf01[miDf01$numbers > 2, ]
print(miDfSub01)
miDfSub02 <- miDf01[(miDf01$logicals == TRUE) & 
  (miDf01$numbers < 2), ]
print(miDfSub02)
miDfSub03 <- miDf01[(miDf01$numbers %% 2) == 0, ]
print(miDfSub03)
miDfSub04 <- miDf01[((miDf01$numbers %% 2) == 0) | 
  (miDf01$logicals == TRUE), ]
print(miDfSub04)

### Modifier un `data.frame`

newVec <- c(4, 5, 6, 7)
miDf01[[4]] <- newVec
print(miDf01)
print(colnames(miDf01))
colnames(miDf01)[4] <- "newVec"
print(miDf01)
print(rownames(miDf01))
rownames(miDf01) <- c("row1", "row2", "row3", "row4")
print(miDf01)

# création d'un vecor
newVec2 <- c(40, 50, 60, 70)
# ajout du vetor dans le data.frame
miDf01$newVec2 <- newVec2
# ou alors directement :
miDf01$newVec2 <- c(40, 50, 60, 70)
# affichage du data.frame
print(miDf01)

miDf01$newVec2 <- miDf01$newVec2 * 2
print(miDf01)
miDf01$newVec2 + miDf01$newVec
miDf01$newVec2[2] <- 0
print(miDf01)

print(newVec2)
print(as.data.frame(newVec2))
is.data.frame(newVec2)
is.data.frame(as.data.frame(newVec2))

## Le conteneur `matrix`

### Créer une `matrix`

vecForMatrix <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
miMat <- matrix(vecForMatrix, nrow = 3, ncol = 4)
print(miMat)

miMat <- matrix(vecForMatrix, nrow = 3)
print(miMat)
miMat <- matrix(vecForMatrix, ncol = 4)
print(miMat)

miMat <- matrix(vecForMatrix, nrow = 3, byrow = TRUE)
print(miMat)

miMat <- matrix(
  vecForMatrix, 
  nrow = 3, 
  byrow = TRUE, 
  dimnames = list(c("r1", "r2", "r3"), c("c1", "c2", "c3", "c4"))
)
print(miMat)
colnames(miMat) <- c("col1", "col2", "col3", "col4")
rownames(miMat) <- c("row1", "row2", "row3")
print(miMat)

vecForMat01 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
vecForMat02 <- vecForMat01 * 10
vecForMat03 <- vecForMat01 / 10
dfForMat <- data.frame(vecForMat01, vecForMat02, vecForMat03)
print(dfForMat)
is.matrix(dfForMat)
as.matrix(dfForMat)
is.matrix(as.matrix(dfForMat))

as.matrix(vecForMat01)

### Manipuler et faire des opérations sur une `matrix`

# opérations terme à terme
miMat01 <- matrix(vecForMat01, ncol = 3)
miVecOp <- c(1, 10, 100, 1000)
miMat01 * miVecOp
miMat01 + miVecOp
miMat01 / miMat01
miMat01 - 10

# opérations algébriques
miVecConf <- c(1, 10, 100)
miMat01 %*% miVecConf
miMat02 <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol = 3)
print(miMat02)
miMat02 %*% miMat02

print(miMat02)
diag(miMat02)
det(miMat02)

aperm(miMat01)
t(miMat01)

### Accéder aux éléments d'une `matrix`

i <- 2
j <- 1
print(miMat01[i, j])
print(miMat01[i, ])
print(miMat01[, j])
print(miMat01[c(1, 2), c(2, 3)])
print(miMat01[10])

## Le conteneur `array`

dim(miMat01)

### Créer un `array`

miVecArr <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
miArray <- array(miVecArr, dim = c(3, 3, 2))
print(miArray)
dim(miArray)
is.array(miArray)
miVecArr02 <- 10 * miVecArr
miArray02 <- array(c(miVecArr, miVecArr02), dim = c(3, 3, 2))
print(miArray02)
dim(miArray02)
is.array(miArray02)

miArray02 <- array(
  c(miVecArr, miVecArr02), 
  dim = c(3, 3, 2), 
  dimnames = list(
    c("r1", "r2", "r3"), 
    c("c1", "c2", "c3"), 
    c("matrix1", "matrix2")
  )
)
print(miArray02)

### Manipuler un `array`

i <- 2
j <- 1
k <- 1
print(miArray02[i, j, k])
print(miArray02[, j, k])
print(miArray02[i, , k])
print(miArray02[i, j, ])

## Conclusion
