#
# Phoenix R Users Group
# May 23, 2017
#
# Shiny Application Development - Part I
# Example 1
#
# Author: Charles Bradbury
#
# About:
# server.R: Server-side application processing, data loading,
#           preparation and manipulation.
#

# Load needed libraries/packages.
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$data <- renderDataTable({
    # Load data set to a variable so we can output
    # it in the UI.
    mtcars
  })
  
  output$dotChart <- renderPlot({
    
    # Generate a dotchart to show gas mileage for each different type of car. 
    dotchart(mtcars$mpg, labels=row.names(mtcars), cex = 0.8, main="Gas Mileage for Car Models")
  })
  
})
