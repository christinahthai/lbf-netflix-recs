library(shiny)
library(shinydashboard)




source("netflix_recs.R")
shinyServer(function(input, output, session) {
  
  
  
  # dataInput = reactive({
  #   
  #  
  #   type = input$Type
  #   year1 = input$Years[1]
  #   year2 = input$Years[2]
  #   
  #   
  # })
  
  
  
  dataset = reactive({
    netflix %>% filter((type == input$Type) &
                       (between(year,
                               input$Years[1], 
                               input$Years[2])) &
                       (genre %in% input$Genre)
                       ) %>%
      select(title, 
             year,
             genre,
             cast,
             description)
  })


    output$text = renderDataTable(dataset())
    
}

  
  
)