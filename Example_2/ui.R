#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Phoenix Crime Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    # Contents of the sidebar
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
        
        tabPanel("Crimes by Month", plotOutput("crimesByMonthBarChart")),
        tabPanel("Data", dataTableOutput("crimeDataTable"))
  
      )
    )
  )
))
