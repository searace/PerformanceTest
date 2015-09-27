shinyUI(navbarPage("JMS - MQ Messages Performance Test Data - Date Selection",
        tabPanel("Selection and Display",
                            
        # Sidebar
        sidebarLayout(
            sidebarPanel(
                helpText("Kindly provide Date on when the performance test was conducted"),
                numericInput('testId1', 'Test Id from:', 1, min = 1),
                numericInput('testId2', 'Test Id to:', 10, min = 1)),
            
        mainPanel(dataTableOutput('table'))
            )
            ),
        tabPanel("About",
        mainPanel(
        includeHTML("about.html")
        )
    )
)
)  