# Les graphiques

# Graphiques simples 

## `plot`

op <- par(no.readonly = TRUE)

# tirage aléatoire de 50 valeurs dans une loi Normale
myX <- rnorm(50, mean = 0, sd = 1) 
myY <- rnorm(50, mean = 10, sd = 1)
par(mar = c(4, 4, 0, 0)) # réduction des marges
plot(x = myX, y = myY)

par(mar = c(4, 4, 0, 0)) # réduction des marges
plot(x = myX, y = myY, 
  xlab = "Légende X", ylab = "Légende Y")

par(mar = c(4, 4, 0, 0)) # réduction des marges
plot(x = myX, y = myY, 
  xlab = "X", ylab = "Y", 
  xlim = c(-3, 3), ylim = c(7, 13))

par(mar = c(2, 2, 0, 0)) # réduction des marges
plot(x = rep(seq(1:5), 5), y = rep(seq(1:5), each = 5),
  pch = 1:25, bg = "gray", xlab = "", ylab = "")

par(mar = c(2, 2, 0, 0)) # réduction des marges
plot(x = myX, y = myY, xlab = "", ylab = "",
  pch = c(
    "a", "@", "#", "1", "=", "-", "_", "o", "O", "0", 
    letters[1:15]))

par(mar = c(2, 2, 0, 0)) # réduction des marges
plot(x = myX, y = myY, xlab = "", ylab = "",
  cex = seq(from = 0.5, to = 3, length.out = 50))

myX <- rnorm(100, mean = 0, sd = 1)
myY <- rnorm(100, mean = 10, sd = 1)
par(mar = c(2, 2, 0, 0)) # réduction des marges
plot(x = myX, y = myY, xlab = "", ylab = "",
  cex = seq(from = 0.5, to = 3, length.out = 100),
  pch = 16,
  col = sample(colors(), 100))

myX <- rnorm(100)
myY <- rnorm(100)
dfGraph <- data.frame(myX, myY)
dfGraph <- dfGraph[order(dfGraph$myX),]
dfGraph$myCol <- colorRampPalette(c("blue", "red"))(100)
dfGraph <- dfGraph[order(dfGraph$myY),]
dfGraph$myCex <- seq(from = 0.5, to = 3, length.out = 100)
par(mar = c(2, 2, 0, 0)) # réduction des marges
plot(x = dfGraph$myX, y = dfGraph$myY, 
  cex = dfGraph$myCex, pch = 16, col = dfGraph$myCol, 
  xlab = "", ylab = "")

myX <- 1:20
myY <- rnorm(20, mean = 10, sd = 1)
par(mar = c(2, 2, 0, 0)) # réduction des marges
plot(x = myX, y = myY, xlab = "", ylab = "",
  type = 'b') # 'p', 'l', 'b', 'c', 'o', 'h', 's', 'S', 'n'

par(mfrow = c(1, 2), mar = c(2, 2, 0, 0))
plot(x = myX, y = myY, xlab = "", ylab = "",
  type = 'b', pch = 16, cex = 3) 
grid(lwd = 3, lty = 1)
plot(x = myX, y = myY, xlab = "", ylab = "",
  type = 'b', pch = 16, cex = 3, 
  panel.first = grid(lwd = 3, lty = 1)) 
par(mfrow = c(1, 1))

op <- par(no.readonly = TRUE)
par(mfrow = c(2, 2), mar = c(2, 2, 0, 0))
graph4 <- lapply(1:4, function(i){
  plot(x = rnorm(100), y = rnorm(100),
    xlab = "", ylab = "",
    col = i, pch = 16)
})
par(op)

myX <- rnorm(100)
myY <- rnorm(100)
par(mar = c(2, 2, 0, 0)) 
plot(x = myX, y = myY, xlab = "", ylab = "",
  xlim = c(-4, 4), ylim = c(-4, 4),   
  pch = 16, cex = 1.5, 
  col = sample(colors(), size = 100),
  panel.first = {
    grid()
    abline(v = c(min(myX), max(myX)), lty = 2)
    abline(h = c(min(myY), max(myY)), lty = 2)
    abline(v = mean(myX), lty = 1)
    abline(h = mean(myY), lty = 1)
})

## `hist` 

op <- par(no.readonly = TRUE)
par(mfrow = c(2, 2), mar = c(2, 2, 1, 1))
myX <- list(
  rnorm(1000),
  rgamma(1000, shape = 1),
  sample(1:100, size = 1000, replace = TRUE),
  rbeta(1000, shape1 = 1, shape2 = 2)
)
myTitle <- c("Normal", "Gamma", "Uniform", "Beta")
tr <- lapply(1:4, function(i){
  hist(myX[[i]], 
    col = heat.colors(15), 
    main = myTitle[i]
  )
})
par(op)

## `barplot` 

myX <- c(4, 5, 8)
par(mar = c(3, 3, 1, 1)) 
barplot(myX, names.arg = c("A", "B", "C"))

op <- par(no.readonly = TRUE)
par(mfrow = c(1, 2), mar = c(2, 2, 1, 1))
myX <- matrix(c(4, 5, 8, 4, 6, 2), nrow = 2)
barplot(myX, names.arg = c("A", "B", "C"))
myX <- matrix(c(4, 5, 8, 4, 6, 2, 3, 4, 5), nrow = 3)
barplot(myX, names.arg = c("A", "B", "C"))
par(op)

n <- 50
myX <- rnorm(n)
myY <- rnorm(n)
myCol <- c(2, sample(c(4, 2), size = (n - 1), replace = TRUE))
myColors <- colorRampPalette(c("blue", "red"))(100)
myYCut <- cut(myY, breaks = -4:4)
myXCut <- cut(myX, breaks = -4:4)
myYCutCol <- table(myCol, myYCut)
myXCutCol <- table(myCol, myXCut)
xCol <- round(
  myXCutCol[1,] / (myXCutCol[1,] + myXCutCol[2,]) * 100
)
xCol[is.na(xCol) | xCol == 0] <- 1
yCol <- round(
  myYCutCol[1,] / (myYCutCol[1,] + myYCutCol[2,]) * 100
)
yCol[is.na(yCol) | yCol == 0] <- 1
op <- par(no.readonly = TRUE)
par(mar = c(2, 3, 1, 1))
layout(matrix(c(1, 1, 0, 
                2, 2, 3, 
                2, 2, 3), ncol = 3, byrow = TRUE))
barplot(table(myXCut), las = 1, col = myColors[xCol])
plot(x = myX, y = myY, col = myCol, pch = 16, 
  xlim = c(-4, 4), ylim = c(-4, 4), cex = 1.5, 
  panel.first = grid())
barplot(
  table(myYCut), 
  las = 1, 
  horiz = TRUE, 
  col = myColors[yCol])
par(op)

graphBarplotCol <- function(n){
  myX <- rnorm(n)
  myY <- rnorm(n)
  myCol <- c(2, sample(c(4, 2), size = (n - 1), replace = TRUE))
  myColors <- colorRampPalette(c("blue", "red"))(100)
  myYCut <- cut(myY, breaks = -4:4)
  myXCut <- cut(myX, breaks = -4:4)
  myYCutCol <- table(myCol, myYCut)
  myXCutCol <- table(myCol, myXCut)
  xCol <- round(
    myXCutCol[1,] / (myXCutCol[1,] + myXCutCol[2,]) * 100
  )
  xCol[is.na(xCol) | xCol == 0] <- 1
  yCol <- round(
    myYCutCol[1,] / (myYCutCol[1,] + myYCutCol[2,]) * 100
  )
  yCol[is.na(yCol) | yCol == 0] <- 1
  op <- par(no.readonly = TRUE)
  par(mar = c(2, 3, 1, 1))
  layout(matrix(c(1, 1, 0, 
                  2, 2, 3, 
                  2, 2, 3), ncol = 3, byrow = TRUE))
  barplot(table(myXCut), las = 1, col = myColors[xCol])
  plot(x = myX, y = myY, col = myCol, pch = 16, 
    xlim = c(-4, 4), ylim = c(-4, 4), cex = 1.5, 
    panel.first = grid())
  barplot(
    table(myYCut), 
    las = 1, 
    horiz = TRUE, 
    col = myColors[yCol])
  par(op)
}
graphBarplotCol(n = 1000)

par(mar = c(3, 1, 1, 1)) # réduction des marges
barplot(rnorm(20), horiz = TRUE, col = rainbow(20))

gender <- data.frame(
  m = cut(sample(1:75, 1000, replace = TRUE), 
    breaks = seq(from = 0, to = 80, by = 10)), 
  f = cut(sample(1:75, 1000, replace = TRUE), 
    breaks = seq(from = 0, to = 80, by = 10))
)
op <- par(no.readonly = TRUE)
par(mfrow = c(1, 2), mar = c(2, 1, 2, 1))
barplot(
  -table(gender$f), 
  horiz = TRUE, 
  col = "salmon")
barplot(
  table(gender$m), 
  horiz = TRUE, 
  col = "lightblue")
par(op)

## `boxplot` 

df <- data.frame(
  box1 = rnorm(1000), 
  box2 = rgamma(1000, shape = 1), 
  box3 = sample(-3:3, size = 1000, replace = TRUE),
  box4 = rbeta(1000, shape1 = 1, shape2 = 2)
)
par(mar = c(2, 2, 0, 0)) # réduction des marges
boxplot(
  df, 
  col = c(
    rgb(0, 94, 255, maxColorValue = 255),  
    rgb(255, 0, 174, maxColorValue = 255),  
    rgb(255, 136, 0, maxColorValue = 255),  
    rgb(119, 255, 0, maxColorValue = 255)))

df$cat <- sample(
  c("w", "x", "y", "z"), 
  size = 1000, 
  replace = TRUE)
par(mar = c(4, 4, 0, 0)) 
boxplot(
  df$box3 ~ df$cat, 
  col = c(rgb(0, 94, 255, maxColorValue = 255),  
    rgb(255, 0, 174, maxColorValue = 255),  
    rgb(255, 136, 0, maxColorValue = 255),  
    rgb(119, 255, 0, maxColorValue = 255)), 
  ylab = "Box3")

df$cat2 <- sample(1:3, size = 1000, replace = TRUE)
par(mar = c(2, 2, 0, 0)) 
boxplot(
  df$box4 ~ df$cat*df$cat2, 
  col = c(
    rgb(0, 94, 255, maxColorValue = 255),  
    rgb(255, 0, 174, maxColorValue = 255),  
    rgb(255, 136, 0, maxColorValue = 255),  
    rgb(119, 255, 0, maxColorValue = 255)), 
  ylab = "Box4")

df$cat <- sample(
  c("w", "x", "y", "z"), 
  size = 1000, 
  replace = TRUE)
par(mar = c(2, 2, 0, 0)) 
boxplot(
  df$box2 ~ df$cat, 
  horizontal = TRUE, 
  col = c(rgb(255, 110, 0, maxColorValue = 255),  
  rgb(230, 255, 0, maxColorValue = 255),  
  rgb(0, 178, 255, maxColorValue = 255),  
  rgb(166, 0, 255, maxColorValue = 255)), xlab = "Box2")

## Autres graphiques

## Conclusion
