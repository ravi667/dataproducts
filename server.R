library(shiny)

shinyServer(function(input, output) {
  
  output$result <- renderText({
    if( (input$height != "" && input$weight != "") ){
      tryCatch({
        height <- as.numeric(input$height)
        weight <- as.numeric(input$weight)
        if(input$height_unit == "feet"){
          height = height*12
        }
        
        if(input$weight_unit == "ounce"){
          weight = weight/16
        }else if(input$weight_unit == "stone"){
          weight = weight*14
        }
        heightsq <- height*height
        bmi <- (weight/heightsq)*703
        if(bmi<18.5){
          "You are under weight"
        }else if(bmi>18.5 && bmi<24.9){
          "You have an ideal weight"
        }else if(bmi>24.9 && bmi<29.9){
          "You are over weight"
        }else{
          "You are obese"
        }
      }, error = function(e){
        "Only numbers allowed"
      })
    }
  })
  
  output$height <- renderText({
    if( input$height != "" && input$weight != "" ){
      tryCatch({
        height <- as.numeric(input$height)
        if(input$height_unit == "feet"){
          height = height*12
        }
        paste("Your height (inches) is:", height, sep=" ")
      }, error = function(e){
        "Only numbers allowed"
      })
    }
  })
  
  output$weight <- renderText({
    if( input$height != "" && input$weight != "" ){
      tryCatch({
        weight <-as.numeric(input$weight)
        if(input$weight_unit == "ounce"){
          weight = weight/16
        }else if(input$weight_unit == "stone"){
          weight = weight*14
        }
        paste("Your weight (pounds) is:", weight, sep=" ")
      }, error = function(e){
        "Only numbers allowed"
      })
    }
  })
  
  output$bmi <- renderText({
    if( input$height != "" && input$weight != "" ){
      tryCatch({
        height <-as.numeric(input$height)
        weight <-as.numeric(input$weight)
        if(input$height_unit == "feet"){
          height = height*12
        }
        
        if(input$weight_unit == "ounce"){
          weight = weight/16
        }else if(input$weight_unit == "stone"){
          weight = weight*14
        }
        heightsq <- height*height
        paste("Your bmi is:", format(round((weight/heightsq)*703, 2), nsmall = 2), sep=" ")
      }, error = function(e){
        "Only numbers allowed"
      })
    }
  })
})