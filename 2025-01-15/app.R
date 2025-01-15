library(shiny)

ui <- fluidPage(
  titlePanel("Exemplo rhandsontable"),
  hr(),
  fluidRow(
    column(
      width = 6,
      rhandsontable::rHandsontableOutput("tabela")
    ),
    column(
      width = 6,
      tableOutput("tabela_modificada")
    )
  )
)

server <- function(input, output, session) {
  output$tabela <- rhandsontable::renderRHandsontable({
    rhandsontable::rhandsontable(mtcars) |> 
    rhandsontable::hot_validate_numeric(
      cols = "cyl",
      min = 4,
      max = 8,
      choices = c(4L, 6L, 8L)
    )
  })

  output$tabela_modificada <- renderTable({
    tab <- rhandsontable::hot_to_r(input$tabela)
    tab
  })
}

shinyApp(ui, server, options = list(launch.browser = FALSE, port = 4242))
