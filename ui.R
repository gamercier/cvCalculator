#' User interface for shiny Cardiovascular Calculator

library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  fluidPage(
    tags$head(tags$style("body {background-color:#b8e0dd}")),
    h1("10-Year Cardiovascular Risk Calculator",align="center"),
    hr(),
    h2("Instructions:"),
    p("Enter the data to compute your cardiovascular 10-year risk factor.
      This is the probability of a heart attack or stroke within 10 years.
      This is based on the",
      a(href="http://circ.ahajournals.org/content/early/2013/11/11/01.cir.0000437741.48606.98",
        em("2013 Guideline on the Assessment of Cardiovascular Risk")),
      "by the American College of Cardiology and the American Heart Association.
      The calculator applies to people between 40 and 79 years old."
    ),
    hr(),
    flowLayout(
      radioButtons('sex','Sex',c('Female','Male'),selected="Female",width="30%"),
      radioButtons('race','Race',c('African American','Other'),selected="Other",width="60%"),
      sliderInput('age','Age in years',value=55,min=40,max=79,width="60%"),
      sliderInput('tchol','Total cholesterol in mg/dl',value=200,min=130,max=320,width="60%"),
      sliderInput('hdl','HDL-C in mg/dl',value=40,min=20,max=100,width="60%"),
      sliderInput('sbp','Systolic Blood Pressure in mm Hg',value=120,min=90,max=200,width="75%"),
      radioButtons('sbp.treat','Is the blood pressure treated with medication?',
                   c('Yes','No'),selected='No',width="60%"),
      radioButtons('smk','Do you smoke?',c('Yes','No'),selected='No',width="40%"),
      radioButtons('diab','Are you a diabetic?',c('Yes','No'),selected='No',width="40%")
    ),
    hr(),
    h2("Result:"),
    p(em("10-year cardiovascular risk factor:")), textOutput('cvrisk',inline=TRUE),
    hr(),
    h2("Interpretation:"),
    p("The number represents the probability of a heart attack or stroke, either fatal or not,
      in the next 10 years. A probability less than 7.5% is considered low. Vary the input to
      see how the probability changes. The slider inputs will restrict the input to valid ranges.
      To see the official calculator go to",
      a(href="http://www.cvriskcalculator.com/","www.cvriskcalculator.com")
    )
  )
)
