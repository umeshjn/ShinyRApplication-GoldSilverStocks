#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dygraphs)
library(quantmod)

# Define server logic
shinyServer(function(input, output) {
   
  output$Silver <- renderDygraph({
    
    # get the data
    getMetals(c('XAG'), from=Sys.Date()-365)
    
    # Plot the Silver Stock
    dygraph(XAGUSD, main = "SILVER", ylab = "Stock Price") %>% dyRangeSelector() %>% dySeries(label = "Silver") %>% dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha = 0.2)
  })
  
  output$Gold <- renderDygraph({
    
    # get the data
    getMetals(c('XAU'), from=Sys.Date()-365)
    
    # Plot the GOLD Stock
    dygraph(XAUUSD, main = "GOLD", ylab = "Stock Price") %>% dyRangeSelector() %>% dySeries(label = "Gold") %>% dyHighlight(highlightCircleSize = 5, highlightSeriesBackgroundAlpha = 0.2)
  })
  
  output$GoldText <- renderText({"Gold is a chemical element with the symbol Au and the atomic number 79. In its purest form, it is a bright, slightly reddish yellow, dense, soft, malleable and ductile metal. Chemically, gold is a transition metal and a group 11 element."})
  
  
  output$SilverText <- renderText({"Silver is the metallic element with the atomic number 47. Its symbol is Ag, from the Latin argentum, from a Proto-Indo-European language root reconstructed as shining. A soft, white, lustrous transition metal, it however, possesses the highest electrical conductivity, thermal conductivity, and reflectivity of any metal"})

})
