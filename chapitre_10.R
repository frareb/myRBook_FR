# La gestion des couleurs 

par(mar = c(2, 0, 0, 0), mfrow = c(1, 2)) 
barplot(
  matrix(rep(1, 8), ncol = 1),
  col = c("black", "red", "green", "blue", 
    "cyan", "magenta", "yellow", "grey"), 
  names.arg = c("R < 4.0.0"), axes = FALSE)
text(x = rep(1, 8), y = 1:8 - 0.5, labels = 1:8, 
  col = c("white", rep(1, 7)), cex = 2)
barplot(
  matrix(rep(1, 8), ncol = 1),
  col = c(1:8), 
  names.arg = c("R >= 4.0.0"), axes = FALSE)
text(x = rep(1, 8), y = 1:8 - 0.5, labels = 1:8, 
  col = c("white", rep(1, 7)), cex = 2)

## `colors()`

head(colors(), n = 20)

# adapted from http://www.r-graph-gallery.com/42-colors-names/
op <- par(no.readonly = TRUE)
par(mar = c(0, 0, 0, 0))
plot(0, type = "n", xlim = c(0, 1), ylim = c(0, 1), 
  axes = FALSE, xlab = "", ylab = "")
numRow <- 26
numCol <- 26
rect(
  xleft = rep((0:(numCol - 1)/numCol), numRow),  
  ybottom = sort(
    rep((0:(numRow - 1)/numRow),numCol), 
    decreasing = TRUE),
  xright = rep((1:numCol/numCol), numRow),
  ytop = sort(
    rep((1:numRow/numRow), numCol), 
    decreasing = TRUE),
  border = grey(0.5), 
  col = colors()[seq(1, numRow*numCol)])
myLabels <- c(
  as.character(1:657), rep("", numRow*numCol - 657))
text(
  x = rep((0:(numCol - 1)/numCol), numRow) + 0.02,
  y = sort(
    rep((0:(numRow - 1)/numRow), numCol), 
    decreasing = TRUE) + 0.02,
  labels = myLabels, 
  cex = 0.6)
par(op)

## `rgb()`

col2rgb(c("red", "green", "blue"))

graphBarplotCol <- function(n){
  myX <- rnorm(n)
  myY <- rnorm(n)
  myCol <- c(2, 3, 4, sample(2:4, size = (n - 3), replace = TRUE))
  myYCut <- cut(myY, breaks = -4:4)
  myXCut <- cut(myX, breaks = -4:4)
  myYCutCol <- table(myCol, myYCut)
  myXCutCol <- table(myCol, myXCut)
  rColX <- myXCutCol[1,] / (myXCutCol[1,] + myXCutCol[2,] + 
    myXCutCol[3,])
  gColX <- myXCutCol[2,] / (myXCutCol[1,] + myXCutCol[2,] + 
    myXCutCol[3,])
  bColX <- myXCutCol[3,] / (myXCutCol[1,] + myXCutCol[2,] + 
    myXCutCol[3,])
  rColX[is.na(rColX)] <- 0
  gColX[is.na(gColX)] <- 0
  bColX[is.na(bColX)] <- 0
  rColY <- myYCutCol[1,] / (myYCutCol[1,] + myYCutCol[2,] + 
    myYCutCol[3,])
  gColY <- myYCutCol[2,] / (myYCutCol[1,] + myYCutCol[2,] + 
    myYCutCol[3,])
  bColY <- myYCutCol[3,] / (myYCutCol[1,] + myYCutCol[2,] + 
    myYCutCol[3,])
  rColY[is.na(rColY)] <- 0
  gColY[is.na(gColY)] <- 0
  bColY[is.na(bColY)] <- 0
  op <- par(no.readonly = TRUE)
  par(mar = c(2, 3, 1, 1))
  layout(matrix(c(1, 1, 0, 
                  2, 2, 3, 
                  2, 2, 3), ncol = 3, byrow = TRUE))
  barplot(table(myXCut), las = 1, col = rgb(rColX, gColX, bColX))
  plot(x = myX, y = myY, bg = myCol, col = "black", pch = 21, 
    xlim = c(-4, 4), ylim = c(-4, 4), cex = 3, 
    panel.first = grid())
  barplot(table(myYCut), las = 1, horiz = TRUE, 
    col = rgb(rColY, gColY, bColY))
  par(op)
}
graphBarplotCol(n = 50)

## Palettes

myPal <- c(
  rgb(0, 94, 255, maxColorValue = 255),  
  rgb(255, 0, 174, maxColorValue = 255),  
  rgb(255, 136, 0, maxColorValue = 255),  
  rgb(119, 255, 0, maxColorValue = 255))
myDarkPal <- c(
  "darkblue", 
  "darkred", 
  "darkorange4", 
  "darkgreen")
print(myPal)
par(mar = c(2, 2, 1, 1))
matY <- matrix(runif(100), ncol = 4)
boxplot(matY, col = myPal, axes = FALSE)
axis(1)
axis(2)
matJitterX <- matrix(
  rnorm(n = 100, mean = 1:4, sd = 0.05), 
  ncol = 4, byrow = TRUE)
tr <- lapply(1:ncol(matJitterX), function(i){
  points(
    x = matJitterX[,i],
    y = matY[,i],
    bg = myDarkPal[i],
    col = 1, pch = 21, 
  )
})

op <- par(no.readonly = TRUE)
par(mfrow = c(1, 5), mar = c(0, 0, 2, 0))
myPals <- list(terrain.colors(10), heat.colors(10), 
  topo.colors(10), cm.colors(10), rainbow(10))
myPalNames <- c("terrain.colors()", "heat.colors()",
  "topo.colors()", "cm.colors()", "rainbow()")
tr <- lapply(seq_along(myPals), function(i){
  barplot(
    matrix(
      sample(
        x = 1:2, 
        size = 100, 
        replace = TRUE), 
      ncol = 10), 
    axes = FALSE, 
    main = myPalNames[i], col = myPals[[i]])
})
par(op)

op <- par(no.readonly = TRUE)
par(mfrow = c(3, 1), mar = c(0, 0, 0, 0))
boxplot(
  matrix(runif(2500), ncol = 25), 
  col = colorRampPalette(c('blue', 'red'))(25), 
  axes = FALSE)
boxplot(
  matrix(runif(2500), ncol = 25), 
  col = colorRampPalette(c('blue', 'white', 'red'))(25), 
  axes = FALSE)
boxplot(
  matrix(runif(2500), ncol = 25), 
  col =  colorRampPalette(
    c(rgb(255, 136, 0, maxColorValue = 255),  
    rgb(0, 94, 255, maxColorValue = 255)))(25), 
  axes = FALSE)
par(op)

pkgCheck <- function(x){ 
  if (!require(x, character.only = TRUE)){
    install.packages(
      x, dependencies = TRUE, quiet = TRUE)
    if(!require(x, character.only = TRUE)) {
      stop()
    }
  }
}
pkgCheck("raster")
pkgCheck("rgdal")
pkgCheck("jpeg")

createPal <- function(photo, met = 1, graph = TRUE, k = 9){
  if(met == 1){
    colR <- getValues(raster(photo, band = 1))
    colG <- getValues(raster(photo, band = 2))
    colB <- getValues(raster(photo, band = 3))
    kMeans <- kmeans(
      data.frame(colR, colG, colB), 
      centers = k)
    kCol <- rgb(kMeans$centers, maxColorValue = 255)[
      order(table(
        kMeans$cluster), decreasing = TRUE)]
    if(graph == TRUE){
      op <- par(no.readonly = TRUE)
      par(mfrow = c (1, 2), mar = c(0, 2, 2, 0))
      myJpg <- readJPEG(
        "./myFiles/photoKmeans.jpg", 
        native = TRUE)
      plot(0:1, 0:1, type = "n", ann = FALSE, axes = FALSE)
      rasterImage(myJpg, 0, 0, 1, 1)
      barplot(
        table(kMeans$cluster)[order(table(kMeans$cluster), 
          decreasing = TRUE)], 
        col = kCol, 
        names.arg = NA)
      par(op)
    }
    return(kCol)
  } else {
    if(met == 2){
      kColR <- kmeans(
        x = getValues(raster(photo, band = 1)), 
        centers = k)
      kColG <- kmeans(
        x = getValues(raster(photo, band = 2)), 
        centers = k)
      kColB <- kmeans(
        x = getValues(raster(photo, band = 3)), 
        centers = k)
      kCol <- rgb(
        kColR$centers, 
        kColG$centers, 
        kColB$centers,
        maxColorValue = 255)
      if(graph == TRUE){
        op <- par(no.readonly = TRUE)
        par(mfrow = c (1, 2), mar = c(0, 2, 2, 0))
        myJpg <- readJPEG(
          "./myFiles/photoKmeans.jpg", 
          native = TRUE)
        plot(x = 0:1, y = 0:1, 
             type = "n", 
             ann = FALSE, 
             axes = FALSE)
        rasterImage(myJpg, 0, 0, 1, 1)
        plot(x = 1:k, y = rep(1, k), ylim = c(0, 1), 
          xlim = c(0, k), axes = FALSE, xlab = "", 
          ylab = "", type = "n")
        for(i in 1:k){
          polygon(
            x = c(i-1, i, i, i-1), 
            y = c(0, 0, 1, 1), 
            col = kCol[i])
          text(x = i - 0.5, y = 0.5, 
            labels = as.character(kCol[i]), srt = 90)
        }
        par(op)
      }
      return(kCol)
    } else {
      print(paste0("No method ", met, "."))
      return(rgb(0, 0, 0))
    }
  }
}

myPalMet1 <- createPal(
  photo = "./myFiles/photoKmeans.jpg", 
  met = 1, 
  graph = TRUE, 
  k = 5)

myPalMet2 <- createPal(
  photo = "./myFiles/photoKmeans.jpg", 
  met = 2, 
  graph = TRUE, 
  k = 5)

makeImpact <- function(
    myPal, 
    numP = 300, 
    impact = 0.33, 
    multCex = 3){
  myX <- sample(0:1000, size = numP, replace = TRUE)/1000
  myY <- sample(0:1000, size = numP, replace = TRUE)/1000
  distImpact <- sqrt((myX - impact)^2 + (myY - impact)^2)
  dfXY <- data.frame(myX, myY, distImpact)
  plot(
    x = dfXY$myX, 
    y = dfXY$myY, 
    axes = FALSE, 
    xlab = "", ylab = "", 
    cex = dfXY$distImpact*multCex, 
    col = myPal, pch = 16)
}

op <- par(no.readonly = TRUE)
par(mfrow = c (1, 2), mar = c(0, 0, 0, 0))
makeImpact(
  myPal = myPalMet1, 
  numP = 3000, 
  impact = 0.33)
makeImpact(
  myPal = myPalMet2, 
  numP = 3000, 
  impact = 0.66)
par(op)

## Conclusion
