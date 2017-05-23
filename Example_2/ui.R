#
# Phoenix R Users Group
# May 23, 2017
#
# Shiny Application Development - Part I
# Example 2
#
# Author: Charles Bradbury
#
# About:
# ui.R: Presentation layer for the application.
#

library(shiny)

# Define a baisc page, most defaults are a fluidPage which is 
# responsive, allowing it to adjust to different screen sizes.
shinyUI(fluidPage(
  
  # Application title. This will be shown at the top of the application.
  titlePanel("Phoenix Crime Data"),
  
  # Create a sidebar layout so we have both a body and a sidebar. By default
  # the sidebar will be on the left-hand side.
  sidebarLayout(
    
    # Contents of the sidebar. Let's provide a breif description 
    # and some reactive functionality via the selectInput() / renderUI()
    # we created in the server.R code.
    sidebarPanel(
      h4("Background"),
       p("This dashboard displays some basic statistics for crime data in Phoenix, AZ. These data cover the time period between
         November 1st, 2015 through 7 days prior to the current date. This data set is part of many that can be downloaded from
         the City Of Phoenix Open Data web portal."),
      br(),
      uiOutput("chooseCategory")
    ),
    
    # Contents of the main panel (aka - the "body")
    mainPanel(
      
      # Create a tab panel for easier user nagivation.
      tabsetPanel(
        
        tabPanel("Crimes by Month", plotOutput("crimesByMonthBarChart")), # This will be the plots of the data
        tabPanel("Raw Data", dataTableOutput("crimeDataTable")) # This will be the data table.
  
      )
    )
  )
))
