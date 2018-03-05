# Hastings boats Shiny app
# User interface
# March 2018
# Matt Dray

navbarPage(
  theme = "united",
  paste("Hastings fishing boats", emo::ji("fish")),
  
  # NAV BAR 1: BOATS
  
  tabPanel(
    title = "Boats",
    
    sidebarLayout(
      
      # SIDEBAR ----
      
      sidebarPanel(
        
        width = 2,
        
        # DROPDOWN: SELECT BOAT NAME ----
        
        selectInput(
          inputId = "boat", 
          label = "Choose a boat name",
          choices = unique(boats_clean$boat_name)
        ),
        
        # # SLIDER: DATE ----
        # 
        # sliderInput(
        #   inputId = "range",
        #   label = "Range of interest (years)",
        #   min = min(boats_clean$date_built, na.rm = TRUE),
        #   max = max(boats_clean$date_built, na.rm = TRUE),
        #   value = c(
        #     min(boats_clean$date_built, na.rm = TRUE),
        #     max(boats_clean$date_built, na.rm = TRUE)
        #   )
        # ),  # end of sliderInput
        
        # STATIC TEXT: HELP ----
        
        helpText("Data from Hastings Fishermen's Museum.")
        
      ),  # end of sidebarPanel
      
      # MAIN PANEL ----
      
      mainPanel(
        
        tabsetPanel(
          type = "tabs",
          
          # TAB 1: BOAT SELECT ----
          
          tabPanel(
            title = "Boat select",
            h3(textOutput("selected_boat")),
            h3(textOutput("selected_boat_reg")),
            h3(textOutput("selected_range")),
            plotOutput("plot_weight_length")
          ),  # end of tabPanel
          
          # TAB 2: EXPLORE DATA ----
          
          tabPanel(
            title = "Explore data",
            "placeholder text"
            #DT::dataTableOutput("fancyTable")
          )  # end of tabPanel
          
        )  # end of tabsetPanel
      )  # end of mainPanel
    )  # end of sidebarLayout
    
  ),  # end of tabPanel
  
  # NAV BAR 2: EXPLORE DATA ----
  
  tabPanel(
    title = "Explore data",
    HTML("
         <h4>How to use</h4>
         <ul>
           <li>The boats are sorted by build date, earliest first. <b>Reorder</b> them by clicking a column header.</li>
           <li><b>Search</b> for phrases using the search box in the upper right.</li>
           <li><b>Filter</b> columns by clicking in the boxes below the column headers (dropdown menu to select factors, free-text entry and sliders for dates -- you can make multiple selections)
           <li><b>Copy</b> or <b>download</b> your selection with the buttons in the upper left.</li>
           <li>Ten entries are shown by default. You can alter this with the dropdown menu in the upper left (10, 25, 50 or 'all'). You can click through the pages of results by using the numbered buttons under the table on the right.</li>
         </ul>
         <br>
        "),
    DT::dataTableOutput("fancyTable")
  ),
  
  # NAV BAR 3: ABOUT THE DATA ----
  
  tabPanel(
    title = "About the data",
    HTML("<h4>Source</h4><p>Data were provided by <a href='http://www.ohps.org.uk/hastings-fishermans-museum/'>Hastings Fishermens' Museum</a> run by the <a href='http://www.ohps.org.uk'>Old Hastings Preservation Society</a>.<p>")
  ),  # end of tabPanel
  
  # NAV BAR 4: ABOUT THE APP ----
  
  tabPanel(
    title = "About the app",
    HTML("<h4>Tools</h4>
         <ul>
           <li>R v3.4.3</li>
           <li>RStudio v1.1.423</li>
           <li><code>shiny</code> package</li>
           <li><code>DT</code> package</li>
           <li><code>dplyr</code>package</li>
         </ul>"
    )
  )  # end of tabPanel
  
)  # end of navbarPage