# Manipuler des dates et des heures 

# Lecture du fichier en local après téléchargement : 
bdd <- read.table(
  "myFiles/E05C13.csv", 
  skip = 1, header = TRUE, 
  sep = ",", dec = ".", 
  stringsAsFactors = FALSE)
# Lecture du fichier depuis GitHub : 
# URL <- paste0("https://raw.githubusercontent.com/",
#   "frareb/myRBook_FR/master/myFiles/E05C13.csv")
# bdd <- read.table(
#   URL, 
#   skip = 1, 
#   header = TRUE,
#   sep = ",",
#   dec = ".",
#   stringsAsFactors = FALSE)
colnames(bdd) <- c("id", "date", "temp")
head(bdd)
tail(bdd)
str(bdd)

strsplit("11/12/15 23:00:00", split = " ")

strsplit("11/12/15 23:00:00", split = " ")[[1]]

bddDay <- sapply(
  strsplit(
    bdd[, 2], 
    split = " "), 
  "[[", 1)
head(bddDay)

bddDay <- as.Date(
  sapply(
    strsplit(
      bdd[, 2], 
      split = " "), 
    "[[", 1), 
  format = "%m/%d/%y")
head(bddDay)

bdd$day <- bddDay
str(bdd)

bddPosix <- as.POSIXct(
  bdd$date, 
  format = "%m/%d/%y %H:%M:%S")
head(bddPosix)
bdd$posix <- bddPosix
str(bdd)

par(mar = c(4, 4, 1, 1)) # réduction des marges
plot(x = bdd$day, y = bdd$temp, 
  type = 'l', ylim = c(-15, 40), 
  xlab = "Temps", ylab = "Température (°C)")

tempDayMean <- tapply(bdd$temp, INDEX = bdd$day, FUN = mean)
tempDayMin <- tapply(bdd$temp, INDEX = bdd$day, FUN = min)
tempDayMax <- tapply(bdd$temp, INDEX = bdd$day, FUN = max)
par(mar = c(4, 4, 1, 1))
plot(x = as.Date(names(tempDayMean), format = "%Y-%m-%d"), 
  y = tempDayMean, type = 'l', ylim = c(-15, 40), 
  xlab = "Temps", ylab = "Température (°C)", lwd = 2)
points(as.Date(names(tempDayMin), format = "%Y-%m-%d"), 
  y = tempDayMin, type = 'l', col = 4, lwd = 2)
points(as.Date(names(tempDayMax), format = "%Y-%m-%d"), 
  y = tempDayMax, type = 'l', col = 2, lwd = 2)
legend("topright", legend = c("min", "max", "mean"), 
  lty = 1, lwd = 2, col = c(4, 2, 1))

anoSem <- format(bdd$posix, format = "%Y-%W")
head(anoSem)

tempWeekMean <- tapply(bdd$temp, 
  INDEX = format(bdd$posix, format = "%Y-%W-1"), FUN = mean)
tempWeekMin <- tapply(bdd$temp, 
  INDEX = format(bdd$posix, format = "%Y-%W-1"), FUN = min)
tempWeekMax <- tapply(bdd$temp, 
  INDEX = format(bdd$posix, format = "%Y-%W-1"), FUN = max)
par(mar = c(4, 4, 1, 1)) # réduction des marges
plot(
  x = as.Date(names(tempWeekMean), format = "%Y-%W-%u"), 
  y = tempWeekMean, 
  type = 'l', ylim = c(-15, 40), 
  xlab = "Date", ylab = "Temperature (°C)", 
  lwd = 3)
points(
  x = as.Date(names(tempWeekMin), format = "%Y-%W-%u"), 
  y = tempWeekMin, 
  type = 'l', col = 4, lwd = 3)
points(
  x = as.Date(names(tempWeekMax), format = "%Y-%W-%u"), 
  y = tempWeekMax, 
  type = 'l', col = 2, lwd = 3)
legend("topright", legend = c("min", "max", "mean"), 
  lty = 1, lwd = 2, col = c(4, 2, 1))

par(mar = c(5, 4, 0, 0))
boxplot(
  bdd$temp ~ format(bdd$posix, format = "%Y-%m"), 
  las = 3,
  xlab = "", ylab = "Température (°C)")

tempMonthMean <- tapply(bdd$temp, 
  INDEX = format(bdd$posix, format = "%Y-%m"), FUN = mean)
myCol <- colorRampPalette(c("blue", "red"))(101)
tempMeanDayPos <- round(
  (tempMonthMean - min(tempMonthMean)) / 
    (max(tempMonthMean) - min(tempMonthMean))*100) + 1
par(mar = c(5, 4, 0, 0)) 
boxplot(
  bdd$temp ~ format(bdd$posix, format = "%Y-%m"), 
  las = 3, 
  col = myCol[tempMeanDayPos],
  xlab = "", ylab = "Température (°C)")

pkgCheck <- function(x){ 
    if (!require(x, character.only = TRUE)){
        install.packages(x, dependencies = TRUE)
        if(!require(x, character.only = TRUE)) {
            stop()
        }
    }
}
pkgCheck("ggplot2")

tempMonthMean <- tapply(bdd$temp, 
  INDEX = format(bdd$posix, format = "%Y-%m"), FUN = mean)
myCol <- colorRampPalette(c("blue", "red"))(101)
tempMeanDayPos <- round(
  (tempMonthMean - min(tempMonthMean)) / 
    (max(tempMonthMean) - min(tempMonthMean))*100) + 1
p01 <- ggplot(
  data = bdd, 
  aes(
    x = posix, 
    y = temp, 
    group = format(posix, format = "%Y-%m"))) + 
    geom_boxplot(
      outlier.colour = "black", 
      fill = myCol[tempMeanDayPos])
p01

tempDayTR <- tempDayMax - tempDayMin
par(mar = c(4, 4, 1, 1)) # réduction des marges
plot(
  x = as.Date(names(tempDayMean), format = "%Y-%m-%d"), 
  y = tempDayTR, type = 'l', ylim = c(5, 45), 
  xlab = "Date", 
  ylab = "Variation de température par jour (°C)", 
  lwd = 3)

tempHourMean <- aggregate(
  x = bdd$temp, 
  by = list(format(bdd$posix, format = "%H:%M")), 
  FUN = mean)
tempHourMin <- aggregate(
  x = bdd$temp, 
  by = list(format(bdd$posix, format = "%H:%M")), 
  FUN = min)
tempHourMax <- aggregate(
  x = bdd$temp, 
  by = list(format(bdd$posix, format = "%H:%M")), 
  FUN = max)
hours <- seq(from = 0, to = 23.5, by = 0.5)
par(mar = c(4, 4, 1, 1)) # réduction des marges
plot(
  x = hours, 
  y = tempHourMean[, 2], 
  type = 'l', ylim = c(-15, 40), 
  xlab = "", ylab = "Température (°C)", 
  lwd = 2, 
  xaxt = "n", 
  panel.first = {
    abline(v = hours, col = "gray", lty = 2)
    abline(h = 0, lty = 2)  
  })
axis(
  side = 1, 
  at = hours, 
  labels = tempHourMean[, 1], 
  las = 2)
points(
  x = hours, 
  y = tempHourMin[, 2], 
  type = 'l', col = 4, lwd = 2)
points(
  x = hours, 
  y = tempHourMax[, 2], 
  type = 'l', col = 2, lwd = 2)

meses <- c("Janvier", "Février", "Mars", "Avril", "Mai", 
  "Juin", "Juillet", "Août", "Septembre", "Octobre", 
  "Novembre", "Décembre")
hours <- seq(from = 0, to = 23.5, by = 0.5)
bddMonth <- format(bdd$day, format = "%m")
tempDayEachMonth <- lapply(
  sort(unique(bddMonth)), function(myMonth){
    bddX <- bdd[bddMonth == myMonth, ]
    tempHourMean <- aggregate(
      x = bddX$temp, 
      by = list(format(bddX$posix, format = "%H:%M")), 
      FUN = mean)
    tempHourMin <- aggregate(
      x = bddX$temp, 
      by = list(format(bddX$posix, format = "%H:%M")), 
      FUN = min)
    tempHourMax <- aggregate(
      x = bddX$temp, 
      by = list(format(bddX$posix, format = "%H:%M")), 
      FUN = max)
    tempHourSd <- aggregate(
      x = bddX$temp, 
      by = list(format(bddX$posix, format = "%H:%M")), 
      FUN = sd)
  return(
    data.frame(
      tempHourMean, 
      min = tempHourMin[, 2], 
      max = tempHourMax[, 2], 
      sd = tempHourSd[, 2]))
})
par(mar = c(4, 4, 1, 1)) 
# for (i in seq_along(tempDayEachMonth)){ # pour tous les mois
i <- 1 # uniquement Janvier 
  plot(
    x = hours, 
    y = tempDayEachMonth[[i]][, 2], 
    type = 'l', ylim = c(-15, 40), 
    xlab = "", ylab = "Température (°C)", 
    lwd = 2, 
    main = meses[i],
    xaxt = "n", panel.first = {
      abline(v = hours, col = "gray", lty = 2)
      abline(h = 0, lty = 2)  
    })
  axis(
    side = 1, 
    at = hours, 
    labels = tempHourMean[, 1], 
    las = 2)
  points(
    x = hours, 
    y = tempDayEachMonth[[i]]$min, 
    type = 'l', col = 4, lwd = 2)
  points(
    x = hours, 
    y = tempDayEachMonth[[i]]$max, 
    type = 'l', col = 2, lwd = 2)
# }

par(mar = c(4, 4, 1, 1)) # réduction des marges
plot(
  x = hours, 
  y = tempDayEachMonth[[1]][, 2], 
  type = 'n', 
  ylim = c(-10, 35),
  xlab = "", 
  ylab = "Température moyenne (°C)",
  xaxt = "n", 
  panel.first = {
    abline(v = hours, col = "gray", lty = 2)
    abline(h = 0, lty = 2)  
  })
axis(
  side = 1, 
  at = hours, 
  labels = tempHourMean[, 1], 
  las = 2)
myColors <- c("#A6CEE3", "#1F78B4", "#B2DF8A", "#33A02C", 
  "#FB9A99", "#E31A1C", "#FDBF6F", "#FF7F00", "#CAB2D6", 
  "#6A3D9A", "#FFFF99", "#B15928")
for (i in seq_along(tempDayEachMonth)){
  points(x = hours, 
    y = tempDayEachMonth[[i]][, 2], 
    type = 'l', col = myColors[i], lwd = 2)
}
legend(
  "topright", 
  ncol = 4, 
  legend = meses, 
  col = myColors, 
  lty = 1, lwd = 2, 
  cex = 0.8, bg = "white")

par(mar = c(4, 4, 1, 1)) # réduction des marges
plot(
  x = hours, 
  y = tempDayEachMonth[[1]]$sd, 
  type = 'n', 
  ylim = c(0, 8),
  xlab = "", 
  ylab = "Écarts-types de la température par tranche horaire et par mois",
  xaxt = "n", 
  panel.first = {
    abline(v = hours, col = "gray", lty = 2)
    abline(h = 0, lty = 2)  
  })
axis(
  side = 1, 
  at = hours, 
  labels = tempHourMean[, 1], 
  las = 2)
myColors <- c("#A6CEE3", "#1F78B4", "#B2DF8A", "#33A02C", 
  "#FB9A99", "#E31A1C", "#FDBF6F", "#FF7F00", "#CAB2D6", 
  "#6A3D9A", "#FFFF99", "#B15928")
for (i in seq_along(tempDayEachMonth)){
  points(
    x = hours, 
    y = tempDayEachMonth[[i]]$sd,
    type = 'l', 
    col = myColors[i], 
    lwd = 2)
}
legend(
  "topright", 
  ncol = 4, 
  legend = meses, 
  col = myColors,
  lty = 1, lwd = 2, 
  cex = 0.8, bg = "white")

pkgCheck <- function(x){ 
  if (!require(x, character.only = TRUE)){
    install.packages(x, dependencies = TRUE)
    if(!require(x, character.only = TRUE)) {
      stop()
    }
  }
}
pkgCheck("ggplot2")
pkgCheck("ggridges")
pkgCheck("viridis")
meanTemps <- unlist(lapply(tempDayEachMonth, "[[", 2))
labelMonth <- rep(meses, each = 48)
dfTemps <- data.frame(month = labelMonth, value = meanTemps, 
  stringsAsFactors = FALSE)
dfTemps$month <- factor(dfTemps$month, levels = rev(meses))
p <- ggplot(
  data = dfTemps, 
  aes(y = month, x = value,  fill = ..x..))
p <- p + geom_density_ridges_gradient(stat = "binline")
p <- p + scale_fill_viridis(
  name = "Temp. [°C]", option = "C")
p <- p + xlab("Temperature") + ylab("") +
    theme(
      legend.position="none",
      panel.spacing = unit(0.1, "lines"),
      strip.text.x = element_text(size = 8)
    ) 
p
