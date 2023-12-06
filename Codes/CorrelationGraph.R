
pdf("Correlationgraph.pdf", width = 8.5, height = 5.5)
getwd()
setwd("C:/Users/babud/Downloads")
Movies <- read.csv("./movies.csv", sep = ",", header = TRUE)
library(caret)
library(dplyr)
library(tidyr)
library(ggplot2)
library(corrplot)
Movies <- read.csv("./movies.csv", sep = ",", header = TRUE)
Movies[is.na(Movies)] <- 0
Movies$director <- as.numeric(factor(Movies$director, levels = unique(Movies$director)))
Movies$star <- as.numeric(factor(Movies$star, levels = unique(Movies$star)))

correlation_matrix <- cor(Movies[c("director", "star", "score", "votes", "budget", "gross")])
corrplot::corrplot(correlation_matrix, method = "color")

dev.off()

