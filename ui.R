library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Body Mass Index (BMI) Calculator"),
  
  p("Instructions: To calculate your body mass index enter your height and weight in the left side panel windows."),
  p("Height window: enter your height and select the units (inches or feet) from the dropdown menu"),
p("Weight window: enter your weight and select the units (pound, stone, ounce) from the dropdown menu"),
p("When you have your information entered, press the Calculate BMI button at the bottom for your health status."),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      textInput("height",
                "Your height:",
      ),
      selectInput("height_unit", "Height unit:",
                  c("inch" = "inch",
                    "feet" = "feet")
      ),
      textInput("weight",
                "Your weight:"
      ),
      selectInput("weight_unit", "Weight unit:",
                  c("pound" = "pound",
                    "ounce" = "ounce",
                    "stone" = "stone")
      ),
      submitButton("Calculate BMI")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      verbatimTextOutput("height"),
      verbatimTextOutput("weight"),
      verbatimTextOutput("bmi"),
      verbatimTextOutput("result")
    )
  )
))