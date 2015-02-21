
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("T Distribution Compared to Normal"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    h4('This graph compares the T-distribution of specifc degrees of freedom and number of observations. The T-distribution is displayed as a histogram, while the normal distribution is presented as a curve.'),
    h4('Set different values below and see how the graph changes.'),
    sliderInput('df',
                'Degrees of Freedom',
                min = 1,
                max = 100,
                value = 20 ),
    
    numericInput('no',
                'Number of Observations',
                min = 1,
                max = 100000,
                value = 30,
                step = 1),
    h4('For a given degrees of freedom increasing the number of observations will make the histogram of the T-distribution appear more normal'),
    h4('Consider an experiment with 5 degrees of fredom, how many observations are required before the histogram looks normal?'),
    h4('For a given number of observations increasing the degrees of freedom will make the histogram of the T-distribution appear more normal'),
    h4('Consider an experiment with 20 observations and 5 degrees of freedom. Does it look normal? As you increase the degres of freedom does it look more normal?')
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
   
    helpText("This is a teaching tool for Introductory Statistics. It displays a t-Distribtuion and a normal curve with user defined degrees of freedom and numbr of observations.
              The purpose is to help visualize difference between the two distributions. 
              See the instructions on the side panel."),
    
    plotOutput("distPlot"),
    
    h4('Degrees of Freedom is '),
    verbatimTextOutput("df"),
    h4('Number of Observations'),
    verbatimTextOutput("no"),
    h4('The mean of a normal distribution is 0. The mean of the T-distribution is below '),
    verbatimTextOutput("tmn"),
    h4('The standard deviation - SD, of a normal distribution is 1. The SD of the T-distribution is below '),
    verbatimTextOutput("tsd")
    
    

  )
))
