
rm(list = ls())
library(shiny)
library(ggplot2)
library(dplyr)


batters1940 <- read.csv("batters1940.csv")
scaledBatters1940 <- data_frame(
  
  H = batters1940$H, 
  pTile = (batters1940$H/max(batters1940$H)))




server <- function(input,output){
  
  dat <- reactive({
    test <- scaledBatters1940[scaledBatters1940$H %in% seq(from=min(input$H),to=max(input$H),by=1),]
    print(test)
    test
  })
  
  output$plot2<-renderPlot({
    ggplot(dat(),aes(x=pTile,y=H))+geom_point(colour="#144163")+theme(panel.background = element_rect(fill = "#caf4cb"),
                                                                      panel.grid.major = element_line(colour = "#ff7373", size=2),
                                                                      panel.grid.minor = element_line(colour = "blue"))},height = 400,width = 600)}
