#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)


ui <- fluidPage(
  titlePanel("Basketball Application"),
  # *Input() functions,
  # *Output() functions
  selectInput(inputId = "player_name", label = "Enter a player's name here...", choices = unique(updated_df$player_name), multiple = FALSE),
  #textInput(inputId = "player_name", label = "Enter a player's name here..."),
  submitButton(text = "Submit"),
  tableOutput("total_stats"),
  tableOutput("demographics"),
  plotOutput("box_score_graph"),
  plotOutput("advanced_stats_graph")
)

server <- function(input, output) {
  output$box_score_graph <- renderPlot({
    box_score_grapher(name = input$player_name)
  })
  output$advanced_stats_graph <- renderPlot({
    advanced_stats_grapher(name = input$player_name)
  })
  output$total_stats <- renderTable({
    total_statistics(name = input$player_name)
  }, rownames = TRUE)
  output$demographics <- renderTable({
    demographics(name = input$player_name)
  }, rownames = TRUE)
}


# Run the application 
shinyApp(ui = ui, server = server)

