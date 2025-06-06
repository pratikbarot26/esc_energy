library(shiny)
library(tidyverse)
library(readr)
library(ggplot2)

# Load the data (make sure to adjust the path to where your file is located)
summarizedData <- read_csv("summarizedData.csv")

# Define the UI
ui <- fluidPage(
  titlePanel("HVAC Data Visualizations"),
  tabsetPanel(
    tabPanel("Temperature vs. Energy Output", 
             sidebarLayout(
               sidebarPanel(
                 sliderInput("tempRange", "Temperature Range:",
                             min = min(summarizedData$`Dry Bulb Temperature [°C]`, na.rm = TRUE),
                             max = max(summarizedData$`Dry Bulb Temperature [°C]`, na.rm = TRUE),
                             value = c(min(summarizedData$`Dry Bulb Temperature [°C]`, na.rm = TRUE),
                                       max(summarizedData$`Dry Bulb Temperature [°C]`, na.rm = TRUE))
                 )
               ),
               mainPanel(
                 plotOutput("tempPlot")
               )
             )
    ),
    tabPanel("Electricity Usage vs. Wind Speed",
             sidebarLayout(
               sidebarPanel(
                 sliderInput("windRange", "Wind Speed Range:",
                             min = min(summarizedData$`Wind Speed [m/s]`, na.rm = TRUE),
                             max = max(summarizedData$`Wind Speed [m/s]`, na.rm = TRUE),
                             value = c(min(summarizedData$`Wind Speed [m/s]`, na.rm = TRUE),
                                       max(summarizedData$`Wind Speed [m/s]`, na.rm = TRUE))
                 )
               ),
               mainPanel(
                 plotOutput("windPlot")
               )
             )
    ),
    tabPanel("Energy Output by Cooling Type",
             sidebarLayout(
               sidebarPanel(),
               mainPanel(
                 plotOutput("coolingTypePlot")
               )
             )
    ),
    tabPanel("Energy Output by Time of Day",
             sidebarLayout(
               sidebarPanel(),
               mainPanel(
                 plotOutput("timeDayPlot")
               )
             )
    )
  )
)

# Define server logic
server <- function(input, output) {
  output$tempPlot <- renderPlot({
    summarizedData %>%
      filter(`Dry Bulb Temperature [°C]` >= input$tempRange[1], `Dry Bulb Temperature [°C]` <= input$tempRange[2]) %>%
      ggplot(aes(x = `Dry Bulb Temperature [°C]`, y = out_total_energy)) +
      geom_point(alpha = 0.5) +
      geom_smooth(method = "nls", formula = y ~ a * x^2 + b * x + c, method.args = list(start = list(a = 1, b = 1, c = 1)), se = FALSE, size = 2, color = "orange") +
      labs(title = "Relationship between Temperature and Total Energy Output", x = "Temperature (°C)", y = "Energy Output (kWh)") +
      theme_minimal()
  })
  
  output$windPlot <- renderPlot({
    summarizedData %>%
      filter(`Wind Speed [m/s]` >= input$windRange[1], `Wind Speed [m/s]` <= input$windRange[2]) %>%
      ggplot(aes(x = `Wind Speed [m/s]`, y = out_hvac_electricity)) +
      geom_point(alpha = 0.5) +
      geom_smooth(method = "nls", formula = y ~ a * x^2 + b * x + c, method.args = list(start = list(a = 1, b = 1, c = 1)), se = FALSE, size = 2, color = "red") +
      labs(title = "Relationship between Wind Speed and HVAC Electricity Usage", x = "Wind Speed (m/s)", y = "HVAC Electricity Usage (kWh)") +
      theme_minimal()
  })
  
  output$coolingTypePlot <- renderPlot({
    summarizedData %>%
      group_by(in.hvac_cooling_type) %>%
      summarise(total_energy = sum(out_total_energy, na.rm = TRUE)) %>%
      ggplot(aes(x = in.hvac_cooling_type, y = total_energy, fill = in.hvac_cooling_type)) +
      geom_bar(stat = "identity") +
      scale_fill_brewer(palette = "Set3") +
      labs(title = "Total Energy Output by HVAC Cooling Type", x = "Cooling Type", y = "Total Energy Output (kWh)") +
      theme_minimal()
  })
  
  output$timeDayPlot <- renderPlot({
    summarizedData %>%
      group_by(time_quarter) %>%
      summarise(total_energy = sum(out_total_energy, na.rm = TRUE)) %>%
      ggplot(aes(x = time_quarter, y = total_energy, fill = time_quarter)) +
      geom_bar(stat = "identity") +
      scale_fill_manual(values = c("Morning" = "#FFD700", "Afternoon" = "#FF8C00", "Evening" = "#1E90FF", "Night" = "#483D8B")) +
      labs(title = "Total Energy Output by Time of Day", x = "Time of Day", y = "Total Energy Output (kWh)") +
      theme_minimal()
  })
}

# Run the application
shinyApp(ui = ui, server = server)

