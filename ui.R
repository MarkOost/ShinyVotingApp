library(shiny)
require(rCharts)

##Creating all the charts and header panels. The charts are created in nvd3 library so these are also pushed to the App online.
##Secondly input is created for Server.R by the Municipality1 and Municipality2
##Third fetching back server.R input to display in nvd3 format.

options(RCHART_LIB = 'nvd3')
shinyUI(pageWithSidebar(
  headerPanel("Compare 2012 parliamentary (Tweede Kamer) voting results in 2 Dutch municipalities; by Mark Oost"),
  sidebarPanel(
    selectInput(inputId = "Municipality1",
                label = "Select first Municipality from the list below",
                choices = sort(unique(voting$municipality)),
                selected = "Rotterdam"),
    selectInput(inputId = "Municipality2",
                label = "Select second Municipality form the list below",
                choices = sort(unique(voting$municipality)),
                selected = "Amsterdam")
  ),
  mainPanel(
    h6("In the table below you will see the percentage of votes for each party in the selected municipalities"),
    showOutput("chart3", "nvd3"),
    h6("In the table below you will see the voter turnout and the total number of votes"),
    showOutput("chart4", "nvd3")
  )
))
