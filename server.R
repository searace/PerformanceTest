library(shiny)
library(datasets)
library(dplyr)

shinyServer(function(input, output) {
       
    #read performance testing data file in csv format
    test_data<-read.csv("performace-testing-data-MQ.csv", header=TRUE)
    test_data$date<-as.Date(test_data$date, format = "%Y-%m-%d")
   
    output$table <- renderDataTable({
              test_data<-filter(test_data, test_id >= input$testId1 & test_id <= input$testId2)
            test_data$Throughput_in_Orders_per_hour<-round(test_data$orders_placed/test_data$test_in_hour, digits=2)
            test_data$Throughput_in_Messages_per_hour<-round((test_data$orders_placed+test_data$system1+test_data$system2+test_data$system3)/test_data$test_in_hour, digits=2)             
          
            test_data <- arrange(test_data, date)
            test_data
    }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})