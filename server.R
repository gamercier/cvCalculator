#' Server for shiny Cardiovascular Calculator

# setwd("~/MOOC/CourseEra/DevelopingDataP/prj/cvCalc")
#' Get the calculator
source("./src/cvcalc.R")

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # input: sex, race, tchol, hdl, sbp, sbp.treat, smk, diab
  # set observations depending on treated vs untreated systolic blood pressure
  # check the input
  output$cvrisk <- renderText({
    age <- as.numeric(input$age)
    tchol <- as.numeric(input$tchol)
    hdl <- as.numeric(input$hdl)
    sbp <- as.numeric(input$sbp)
    smk <- 1 ;   if(input$smk == "No") smk <- 0
    diab <- 1 ;  if(input$diab == "No") diab <- 0

    if(input$sbp.treat == "Yes"){
      obs <- pack.obs(age,tchol,hdl,sbp,0,smk,diab)
    }
    else {
      obs <- pack.obs(age,tchol,hdl,0,sbp,smk,diab)
    }

    paste(round(as.numeric(cvcalc(input$sex,input$race,obs)),1),"%")
    })
  })
