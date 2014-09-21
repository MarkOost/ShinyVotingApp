library(shiny)
require(rCharts)

##Input Voting Data
voting <- read.csv("Voting.csv",stringsAsFactors=FALSE, fileEncoding="latin1")
voting$municipality <- as.character(voting$Naam)

##Input Turnout Data
turnout <- read.csv("Turnout.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
turnout$municipality <- as.character(turnout$Naam)
turnout$inputselect <- as.character(turnout$Name)