
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyServer(function(input, output) {
   
  output$no<-renderPrint({input$no})
  output$df<-renderPrint({input$df})
  output$distPlot <- renderPlot({
     
    # draw the histogram of the t distribution with
    # with the specified degrees of freedom and the number of observations
    tdist<-rt(input$no,input$df)
    tsd<-sd(tdist)
    tmn<-mean(tdist)
    
    output$tsd<-renderText({round(tsd,2)})
    output$tmn<-renderText({round(tmn,2)})
    
    #plot histogram
    h<-hist(tdist, col = 'gray', border = 'white', main="T-distribution with Normal Overlay", xlab="Standard Deviation")
    
    #caluclate normal distribution based on T distribution 
    ##xfit is a horizontal line with 50 points, running the range of the histogram
    xfit<-seq(min(tdist),max(tdist),length=50) 
    
    # apply normal density function to xfit
    # with a mean and standard deviation of the random T distribution
    yfit<-dnorm(xfit,mean=tmn,sd=tsd) 
    
    ## diff(h$mids[1:2]) is the distance between the midpoints 
    # of two bars of the histogram
    yfit <- yfit*diff(h$mids[1:2])*length(tdist) 
    
    # plot normal curve
    lines(xfit, yfit, col="red", lwd=2)
    
  })

  
})
