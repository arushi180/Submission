library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("What Will You Look Like 20 Years From Now"),
  sidebarPanel(h5('Calculating BMI'), h6('(Body Mass Index)'),
               p('Please enter your height (ft/inch):'),
               numericInput('feet', 'Feet:', 1, min=1, max=10, step=0.5),
               numericInput('inches', 'Inches:', 1, min=1, max=10, step=0.5),
               numericInput('weight', 'Please enter your weight in pounds:', 1, min=15, max=250, step=0.1),
               h5('Now, lets see what you will look like 20 years from now!'),
               radioButtons("sex", "Please select one:", c("Male", "Female"), selected=0),
               radioButtons("person", "Do you think you are a good person?", c("Yes", "No"), selected=0),
               actionButton('Submit', "Submit")
               ),
  mainPanel(h4('BMI (Body Mass Index)', align="center"),
            p('Your Body Mass Index is:'),
            verbatimTextOutput("prediction"),
            h5('BMI categories:'),
            p('Underweight =< 18.5'),
            p('Normal Weight = 18.5-24.9'),
            p('Overweight = 25-29.9'),
            p('Obesity >= 30'),
            p(''),
            h4('You in 20 Years', align="center"),
            #image<-img(src=''),
            imageOutput("image", width=400, height=400)
  )))