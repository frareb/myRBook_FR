# Premiers pas

## Installation de R

## R comme calculatrice

### Les opérateurs arithmétiques
5 + 5

5 + 5 * 2
(5 + 5) * 2

451 %% 2
288 %% 2
(5 + 5 * 2) %% 2
((5 + 5) * 2) %% 2

pi
pi * 5^2
1/0

### Les opérateurs de comparaison

5 > 3 

5 > 3
2 < 1.5
2 <= 2
3.2 >= 1.5

(5 + 8) > (3 * 45/2) 

42 == 53
58 == 58

42 == 53
42 != 53
(3 + 2) != 5
10/2 == 5

TRUE == TRUE
TRUE > FALSE
1 == TRUE
0 == FALSE
TRUE + 1
FALSE + 1
(FALSE + 1) == TRUE

T == TRUE
F == FALSE
T == 1
F == 0
(F + 1) == TRUE

print(T)
T <- FALSE
print(T)

### Les opérateurs logiques 

!TRUE
!FALSE
((3 + 2) == 5) & ((3 + 3) == 5)
((3 + 2) == 5) & ((3 + 3) == 6)
(3 < 5) & (5 < 5)
(3 < 5) & (5 <= 5)

xor((3 + 2) == 5, (3 + 3) == 6)
xor((3 + 2) == 5, (3 + 2) == 6)
xor((3 + 3) == 5, (3 + 2) == 6)
xor((3 + 3) == 5, (3 + 3) == 6)

### Aide sur les opérateurs

## La notion d'objet 

nbrRep <- 5
nbrRep = 5
5 -> nbrRep

nbrRep <- 5

nbrRep + 2
nbrRep * 5 - 45/56
pi * nbrRep^2

nbrRep <- 5
nbrRep + 2
nbrRep <- 10
nbrRep + 2
nbrRep <- 5 * 2 + 7/3
nbrRep + 2

(5 + 9^2 - 1/18) / (32 * 45/8 + 3)
terme01 <- 5 + 9^2 - 1/18
terme02 <- 32 * 45/8 + 3
terme01 / terme02

## Les scripts

### Créer un script et le documenter

# création objet nombre de répétitions
nbrRep <- 5 # commentaire de fin de ligne

nbrRep <- 5
# nbrRep + 5

# ------------------------------------------------------------
# Voici un script pour acquérir les concepts de base 
# avec R
# date de création : 25/06/2018
# auteur : François Rebaudo
# ------------------------------------------------------------

# [1] création de l'objet nombre de répétitions
# ------------------------------------------------------------

nbrRep <- 5

# [2] calculs simples
# ------------------------------------------------------------

pi * nbrRep^2

### Exécuter un script

## Conclusion
