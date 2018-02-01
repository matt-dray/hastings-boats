fluidPage(
  
  titlePanel("Hastings fishing boats"),
  
  sidebarLayout(
    
    # SIDEBAR ----
    
    sidebarPanel(
      
      # DROPDOWN: SELECT BOAT NAME ----
      
      selectInput(
        inputId = "boat", 
        label = "Choose a boat name",
        choices = unique(boats_clean$boat_name)
      ),
      
      # SLIDER: SELECT YEAR RANGE ----
      
      sliderInput(
        inputId = "range", 
        label = "Range of interest (years)",
        min = min(boats_clean$date_built, na.rm = TRUE),
        max = max(boats_clean$date_built, na.rm = TRUE),
        value = c(min(boats_clean$date_built, na.rm = TRUE),
                  max(boats_clean$date_built, na.rm = TRUE)
        )
      ),
      
      helpText("Data from Hastings Fishermen's Museum.")
      
    ),
    
    # MAIN PANEL ----
    
    mainPanel(
      tabsetPanel(
        type = "tabs",
        
        # TAB 1 ----
        
        tabPanel(
          title = "Summary",
          h3(textOutput("selected_boat")),
          h3(textOutput("selected_range"))
        ),
        
        # TAB 2 ----
        
        tabPanel(
          title = "Plot",
          plotOutput("plot_weight_length")
        ),
        
        # TAB 3 ----
        
        tabPanel(
          title = "Table"
        ),
        
        # TAB 4 ----
        
        tabPanel(
          title = "Information"
        )
      )
    )
  )
)