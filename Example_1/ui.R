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
# ui.R: Render user's GUI elements and 
#       interactivity.
#
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Data Exploration"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       h3("Dataset: mtcars"),
       br(),
       h3("Description:"),
       br(),
       p("This The data was extracted from the 1974 Motor Trend US magazine, 
         and comprises fuel consumption and 10 aspects of automobile design 
         and performance for 32 automobiles (1973–74 models)."),
       br()
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       dataTableOutput("data"),
       plotOutput("dotChart")
    )
  )
))
