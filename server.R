library(shiny)
library(png)
bmi<-function(weight, feet, inches) weight/((feet*12+inches)^2) * 703
shinyServer(function(input,output)
{
  output$weight<-renderPrint({input$weight})
  output$height<-renderPrint({input$height})
  output$prediction<-renderPrint({bmi(input$weight, input$feet, input$inches)})
  output$image <- renderImage({
    if (input$sex == "Male")
    {
      if (input$person=="Yes")
      {
        return(list(
          src = "image/hotguy.gif",
          contentType = "image/png",
          alt = "hot"
        ))
      }
      else
      {
        return(list(
          src = "image/ugly.boy.72.jpg",
          contentType = "image/png",
          alt = "ugly"
        ))
      }
    }
    else (input$sex == "Female")
    {
      if (input$person=="Yes")
      {
        return(list(
          src = "image/prettygirl.gif",
          contentType = "image/png",
          alt = "pretty"
        ))
      }
      else
      {
        return(list(
          src = "image/uglygirl.jpg",
          contentType = "image/png",
          alt = "ugly"
        ))
      }
    }
  }, deleteFile = FALSE)
  })