# Les packages graphiques 

## les packages de palettes

### `RColorBrewer`

pkgCheck <- function(x){ 
  if (!require(x, character.only = TRUE)){
    install.packages(x, dependencies = TRUE)
    if(!require(x, character.only = TRUE)) {
      stop()
    }
  }
}
pkgCheck("RColorBrewer")
par(mar = c(1, 4, 1, 1)) # réduction des marges
display.brewer.all()

par(mar = c(1, 1, 1, 1)) # réduction des marges
boxplot(matrix(runif(1000), ncol = 10), 
  col = brewer.pal(10, "Paired"), axes = FALSE)

### `palettesForR`

pkgCheck <- function(x){ 
  if (!require(x, character.only = TRUE)){
    install.packages(x, dependencies = TRUE)
    if(!require(x, character.only = TRUE)) {
      stop()
    }
  }
}
pkgCheck("palettesForR")
showPalette(Echo_gpl)

groupTest <- sample(1:3, size = 100, replace = TRUE) 
valueTest <- sample(1:7, size = 100, replace = TRUE)
tableTest <- table(groupTest, valueTest)
par(mar = c(2, 0, 0, 0)) # réduction des marges
barplot(tableTest, 
  col = Echo_gpl, axes = FALSE, beside = TRUE)

groupTest <- sample(1:3, size = 100, replace = TRUE) 
valueTest <- sample(1:7, size = 100, replace = TRUE)
tableTest <- table(groupTest, valueTest)
par(mar = c(2, 0, 0, 0)) # réduction des marges
barplot(tableTest, 
  col = Tango_gpl, axes = FALSE, beside = TRUE)

### Les autres packages

## Le package `ggplot2`

pkgCheck <- function(x){ 
  if (!require(x, character.only = TRUE)){
    install.packages(x, dependencies = TRUE)
    if(!require(x, character.only = TRUE)) {
      stop()
    }
  }
}
pkgCheck("ggplot2")
data(iris)
# ggplot2
p <- ggplot(data = iris, aes(
  x = Sepal.Length, 
  y = Sepal.Width))
p + geom_point() + ggtitle("ggplot2")

# base
par(mar = c(4, 4, 1.5, 1)) # réduction des marges
plot(x = iris$Sepal.Length, y = iris$Sepal.Width, 
  main = "base", pch = 16)

# ggplot2
p <- ggplot(data = iris, aes(
  x = Sepal.Length, 
  y = Sepal.Width, 
  colour = Species))
p + geom_point() + ggtitle("ggplot2")

# base
par(mar = c(4, 4, 1.5, 1)) # réduction des marges
plot(x = iris$Sepal.Length, y = iris$Sepal.Width, 
  main = "base", pch = 16, col = iris$Species)

# linear regressions
lmFits <- lapply(1:3, function(i){
  fitSp1 <- lm(iris$Sepal.Width[as.numeric(iris$Species) == i] ~ 
    iris$Sepal.Length[as.numeric(iris$Species) == i])
  fStat1 <- summary(fitSp1)$fstatistic
  rSq1 <- summary(fitSp1)$r.squared
  pVal1 <- summary(fitSp1)$coefficients[2, 4]
  stat1 <- paste0("F=", round(fStat1[1], digits = 2), 
    "; DF=", fStat1[2], "/", fStat1[3], 
    "; r2=", round(rSq1, digits = 2), 
    "; p-val=", round(pVal1, digits = 6))
  return(list(fitSp1, stat1))
})
# ggplot2
p <- ggplot(data = iris, aes(
  x = Sepal.Length, 
  y = Sepal.Width, 
  colour = Species))
p <- p + geom_point() + ggtitle("ggplot2") + 
  stat_smooth(method = "lm", se = FALSE)
p <- p + annotate(geom = "text", x = 6, y = 2.250, 
  label = lmFits[[1]][[2]], colour = 2)
p <- p + annotate(geom = "text", x = 6, y = 2.125, 
  label = lmFits[[2]][[2]], colour = 3)
p <- p + annotate(geom = "text", x = 6, y = 2.000, 
  label = lmFits[[3]][[2]], colour = 4)
p

# base
par(mar = c(4, 4, 1.5, 1)) # réduction des marges
plot(x = iris$Sepal.Length, y = iris$Sepal.Width, 
  main = "base", pch = 16, col = iris$Species)
abline(lmFits[[1]][[1]], col = 1)
abline(lmFits[[2]][[1]], col = 2)
abline(lmFits[[3]][[1]], col = 3)
text(
  x = 5.5, y = 2.2, 
  labels = lmFits[[1]][[2]], 
  pos = 4)
text(
  x = 5.5, y = 2.1, 
  labels = lmFits[[2]][[2]], 
  pos = 4, col = 2)
text(
  x = 5.5, y = 2.0, 
  labels = lmFits[[3]][[2]], 
  pos = 4, col = 3)

par(mar = c(4, 4, 2, 8))
plot(
  x = iris$Sepal.Length, 
  y = iris$Sepal.Width, 
  xlab = "Sepal.Length", 
  ylab = "Sepal.Width",
  axes = FALSE, 
  pch = 16, col = iris$Species, 
  panel.first = {
    rect(par("usr")[1], 
      par("usr")[3], 
      par("usr")[2], 
      par("usr")[4], 
      col = "lightgray",  border = NA)
    abline(v = 4:8, col = "white", lwd = 2, lty = 1)
    abline(h = 2:5, col = "white", lwd = 2, lty = 1)
    grid(col = "white", lwd = 1, lty = 1)
  })
title("base", adj = 0, line = 0.5)
axis(1, col = NA, col.ticks = 1, cex.axis = 0.9)
axis(2, col = NA, col.ticks = 1, las = 1, cex.axis = 0.9)
par(xpd = TRUE)
legend(8.2, 3.5, legend = levels(iris$Species), bty = "n", 
  pch = 16, col = as.numeric(unique(iris$Species)), 
  title = "Species")
spp <- unique(iris$Species)
tr <- lapply(spp, function(mySpp){
  lmX <- lm(iris$Sepal.Width[iris$Species == mySpp] ~ 
    iris$Sepal.Length[iris$Species == mySpp])
  points(x = iris$Sepal.Length[iris$Species == mySpp], 
    y = predict(lmX), type = 'l', lwd = 2, col = mySpp)
})

par(mar = c(4, 4, 0, 0.5))
plot(x = iris$Sepal.Length, y = iris$Sepal.Width, 
  type = 'n', axes = FALSE, panel.first = {
    grid()
    axis(1)
    axis(2)
  })
my3col <- c("#3b86ff", "#e653c8", "#ffd82b")
spp <- unique(iris$Species)
trash <- lapply(spp, function(mySpp){
  lmX <- lm(iris$Sepal.Width[iris$Species == mySpp] ~ 
    iris$Sepal.Length[iris$Species == mySpp])
  points(x = iris$Sepal.Length[iris$Species == mySpp], 
    y = predict(lmX), type = 'l', lwd = 2, col = my3col[mySpp])
  myCol <- colorRampPalette(c(my3col[mySpp], "darkred"))(101)
  colRank <- (iris$Sepal.Width[iris$Species == mySpp] - 
    predict(lmX))^2
  colRank <- round((colRank - min(colRank)) / 
    (max(colRank) - min(colRank)) * 100) + 1
  points(
    x = iris$Sepal.Length[iris$Species == mySpp],
    y = iris$Sepal.Width[iris$Species == mySpp], 
    bg = my3col[mySpp], col = myCol[colRank], pch = 21, 
    cex = 1 + colRank/100)
})
legend("topright", fill = my3col, 
  legend = levels(iris$Species), bty = "n")

## Les graphiques interactifs et dynamiques avec `Plotly`

pkgCheck <- function(packages){
  for(x in packages){
    try(if (!require(x, character.only = TRUE)){
      install.packages(x, dependencies = TRUE)
      if(!require(x, character.only = TRUE)) {
        stop()
      }
    })
  }
}
pkgCheck(c("plotly", "gapminder"))

p <- gapminder %>%
  plot_ly(
    x = ~gdpPercap, 
    y = ~lifeExp, 
    size = ~pop, 
    color = ~continent, 
    frame = ~year, 
    text = ~country, 
    hoverinfo = "text",
    type = 'scatter',
    mode = 'markers'
  ) %>%
  layout(
    xaxis = list(
      type = "log"
    )
  )
p

## Conclusion
