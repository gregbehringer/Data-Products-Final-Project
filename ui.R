rm(list = ls())
library(shiny)
library(ggplot2)
library(dplyr)


batters1940 <- read.csv("batters1940.csv")
scaledBatters1940 <- data_frame(
  
  H = batters1940$H, 
  pTile = (batters1940$H/max(batters1940$H)))



ui <- fluidPage(
  titlePanel(title=h4("Career Hits and Percentiles for Select MLB Hall of Fame Inductees as of 2015", align="center")),
  sidebarPanel( 
    sliderInput("H", "Number:",min = 500, max = 4000,step=1,value=c(1,2))),
  mainPanel(plotOutput("plot2")))