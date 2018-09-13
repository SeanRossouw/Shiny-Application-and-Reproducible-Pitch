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
  titlePanel("Fit volume weighted moving average curves"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h5("Author: Sean Rossouw"),
      h5("Select values of n for the two volumetric moving averages"),
      sliderInput("n1",
                   "Set N1:",
                   min = 5,
                   max = 100,
                   value = 15),
       
       sliderInput("n2",
                   "Set N2:",
                   min = 5,
                   max = 100,
                   value = 50)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
