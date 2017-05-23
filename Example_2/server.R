#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# Load needed packages
library(shiny)
library(zoo)



# Define server-side logic for loading data, 
# generating plots and other items. All variables
# are loaded as an element of the "output" variable.
shinyServer(function(input, output) {
  
  # Load Data
  load("./data/CrimeStats.RData")
  
  # Drop-down selection box for which data set
  output$chooseCategory <- renderUI({
    selectInput("category", "Select a Category:", as.list(unique(crimeData$UCR.CRIME.CATEGORY)))
  })
  
  output$crimeDataTable <- renderDataTable({
    crimeData
  }, options = list(lengthMenu = c(10, 25, 50), pageLength = 10))

  output$crimesByMonthBarChart <- renderPlot({
    crimeDataRefined <- subset(crimeData, as.factor(crimeData$UCR.CRIME.CATEGORY) == input$category)
    crimesByMonth <- setNames(aggregate(crimeDataRefined$INC.NUMBER~as.yearmon(crimeDataRefined$OCCURRED.ON), data=crimeDataRefined, FUN = length), c("Month", "Count"))
    barplot(crimesByMonth$Count, ylab="Count", names.arg = crimesByMonth$Month, las=2)
  })
  
})
