library(shiny)
library(shinydashboard)
library(DT)

source("netflix_recs.R")



shinyUI(

  
  
  pageWithSidebar(
    headerPanel("Netflix Recommendation"),

    sidebarPanel(
      selectInput("Type", 
                  "Select Type:",
                  choices = c("TV Show",
                              "Movie")
                  ),
      
      
      selectizeInput('Genre', 
                     label ='Multi-select Genres:', 
                     choices = unique(netflix$genre), 
                     multiple = TRUE
                     ),
      
      
      
      sliderInput("Years", 
                  label = h3("Select Year:"),
                             min = 1925,
                             max = 2020,
                             value = c(2008, 2019)
                  )
      

      
      ),

    mainPanel(
      
     
      DT::dataTableOutput("text")
    )
  )
  

  
)