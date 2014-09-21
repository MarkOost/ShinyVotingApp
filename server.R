library(shiny)
require(rCharts)

##Below we are first selecting the width of the charst afterwards we created some calculations for the dashboard.
##These calculations are based on the selected municipalities in the UI script. 
##Secondly these charts are send back to object in nvd3

options(RCHART_WIDTH = 800)

shinyServer(function(input, output) {
  output$chart3 <- renderChart({
    municipality_1 <- input$Municipality1
    municipality_2 <- input$Municipality2
    
    
    municipality1 <- subset(voting, municipality == municipality_1)
    municipality1$sum1 <- sum(municipality1$Value)
    municipality1$perc <- (municipality1$Value/municipality1$sum1)*100
    
    municipality2 <- subset(voting, municipality == municipality_2)
    municipality2$sum1 <- sum(municipality2$Value)
    municipality2$perc <- (municipality2$Value/municipality2$sum1)*100
    
    combine <- rbind(municipality1, municipality2)
    
    
    p1 <- nPlot(perc ~ municipality, group = "Name", data = combine, type = "multiBarChart")
    

    p1$set(dom = 'chart3')

    return(p1)
  })
  output$chart4 <- renderChart({
    municipality_1_1 <- input$Municipality1
    municipality_2_2 <- input$Municipality2
    
    municipality_1 <- subset(turnout, municipality == municipality_1_1 & Name == "Eligible Votes" | municipality == municipality_1_1 & Name == "Voter Turnout")
    municipality_2 <- subset(turnout, municipality == municipality_2_2 & Name == "Eligible Votes" | municipality == municipality_2_2 & Name == "Voter Turnout")
    
    combine1 <- rbind(municipality_1, municipality_2)
    
    
    p2 <- nPlot(Value ~ Name, group = "municipality", data = combine1, type = "multiBarHorizontalChart")
    
    
    p2$set(dom = 'chart4')
    
    return(p2)
    
  })
})