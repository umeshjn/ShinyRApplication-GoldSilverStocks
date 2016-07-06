#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dygraphs)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Gold and Silver Stocks Performance"),
  
  #Helptext
  helpText("One Year Price"),
  
  # Line breaks
  br(),
  
  #Plot Layout
  fluidRow(
    column(6, dygraphOutput("Gold")),
    column(6, dygraphOutput("Silver"))
  ),
  
  #Line break
  br(),
  
  fluidRow(
    column(6, textOutput("GoldText")),
    column(6, textOutput("SilverText"))
  )

))
