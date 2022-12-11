#app

# loading library
library(plotly)
library(ggplot2)
library(shiny)

# source
source("app_ui.R")
source("app_server.R")

# Run the application 
shinyApp(ui = ui, server = server)
