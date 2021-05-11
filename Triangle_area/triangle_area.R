library(shiny)

ui <- fluidPage(
    # Application title
    titlePanel("三角形面积计算器"),
    sidebarPanel(
        numericInput("a",
                     h1("a 边长"),
                     value = 100),
        numericInput("b",
                     h1("b 边长"),
                     value = 100),
        numericInput("c",
                     h1("c 边长"),
                     value = 100),
    ),
    mainPanel(
        uiOutput("text"),
        br(),
        textOutput("area"),
        br(),
        uiOutput("unit"),
    )
)


server <- function(input, output) {
    Area_tra <- function(a, b, c){
        s = (a + b + c)/2
        A = sqrt(s*(s-a)*(s-b)*(s-c))/666.67
        return(A)
    }
    output$text <- renderUI({
        HTML(paste0(
            "<h3>", "三角形面积约为：", "</h3>"))
    })
    output$area <- renderText({
        Area_tra(a = input$a , b = input$b, c = input$c)
    })
    output$unit <- renderUI({
        HTML(paste0(
            "<h3>", "亩", "</h3>"))
    })
}

shinyApp(ui = ui, server = server)
