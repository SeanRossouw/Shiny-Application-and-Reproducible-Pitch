#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(dplyr)
library(shiny)
library(tidyquant)
library(lubridate)

shinyServer(function(input, output) {
   
  
  start<-as.Date("2017-09-09")
  end<-as.Date("2018-09-09")
  start_zoom<- (end-weeks(20))
    
  dataInput <- reactive({
    
    
    AAPL <- tq_get("AAPL", get = "stock.prices", from = start, to = end)
    AAPL<-add_column(AAPL, symbol="AAPL")
    GOOG <- tq_get("GOOG", get = "stock.prices", from = start, to = end)
    GOOG<-add_column(GOOG, symbol="GOOG")
    MSFT <- tq_get("MSFT", get = "stock.prices", from = start, to = end)
    MSFT<-add_column(MSFT, symbol="MSFT")
    TSLA <- tq_get("TSLA", get = "stock.prices", from = start, to = end)
    TSLA<-add_column(TSLA, symbol="TSLA")
    AMD  <- tq_get("AMD" , get = "stock.prices", from = start, to = end)
    AMD<-add_column(AMD, symbol="AMD")
    NVDA <- tq_get("NVDA", get = "stock.prices", from = start, to = end)
    NVDA<-add_column(NVDA, symbol="NVDA")
    
    data<-bind_rows(AAPL,GOOG,MSFT,TSLA,AMD,NVDA)
  })
      


    output$distPlot <- renderPlot({
      data<-dataInput()
      n1<-input$n1
      n2<-input$n2
      
    data %>%
     # filter(date >= start - days(2 * 50)) %>%
      ggplot(aes(x = date, y = close, volume = volume, group = symbol)) +
      geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
      geom_ma(ma_fun = VWMA, n=n1, wilder = TRUE, linetype = 5) +
      geom_ma(ma_fun = VWMA, n=n2, wilder = TRUE, color = "red") + 
      labs(title = "Tech Stock Comparison with VWMA", 
           y = "Closing Price", x = "") + 
      coord_x_date(xlim = c(start_zoom, end)) +
      facet_wrap(~ symbol, ncol = 2, scales = "free_y") + 
      theme_tq()
    
  })
  
})
