# Les types de données

## Le type `numeric`

nbrRep <- 5
typeof(nbrRep)
typeof(5.32)
is.numeric(5)
is.double(5)

nbrRep <- as.integer(5)
typeof(nbrRep)
typeof(5.32)
typeof(as.integer(5.32))
as.integer(5.32)
as.integer(5.99)
is.numeric(nbrRep)

is.integer(5)
is.numeric(5)
is.integer(as.integer(5))
is.numeric(as.integer(5))

sumIntDou <- as.integer(5) + 5.2
typeof(sumIntDou)
sumIntInt <- as.integer(5) + as.integer(5)
typeof(sumIntInt)

roundDou <- round(5.2)
typeof(roundDou)

## Le type `character`

myText <- "azerty"
myText2 <- 'azerty'
myText3 <- 'azerty uiop qsdfg hjklm'
typeof(myText3)

myText <- "a 'ze' 'rt' y"
myText2 <- 'a "zert" y'
myText3 <- 'azerty uiop qsdfg hjklm'
myText4 <- "qwerty \" azerty "
myText5 <- "qwerty \\ azerty "

myText <- "a 'ze' 'rt' y"
myText

myText <- "a 'ze' 'rt' y"
print(myText)
nbrRep <- 5
print(nbrRep)
print(myText2)
print(myText3)
print(myText4)
print(myText5)

myText <- "qwerty"
typeof(myText)
myText2 <- 5 # ceci n'est pas du texte
typeof(myText2)
myText3 <- "5"
typeof(myText3)
myText2 + 10
as.character(5)
# myText3 + 10 
# Error in myText3 + 10 : non-numeric argument to binary operator
# "a" + "b" 
# Error in "a" + "b" : non-numeric argument to binary operator

## Le type `factor`

factor01 <- factor("aaa")
print(factor01)
typeof(factor01)
is.factor(factor01)
levels(factor01)

factor01 <- factor("aaa")
as.character(factor01)
as.numeric(factor01)

## Le type `logical` 

aLogic <- TRUE
print(aLogic)
typeof(aLogic)
is.logical(aLogic)
aLogic + 1
as.numeric(aLogic)
as.character(aLogic)

## A propos de `NA`

print(NA)
typeof(NA)
typeof(as.integer(NA))
typeof(as.character(NA))
NA == TRUE
NA == FALSE
NA > 1
NA + 1

## Conclusion
