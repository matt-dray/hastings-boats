# Hastings boats Shiny app
# User interface
# March 2018
# Matt Dray

navbarPage(
  theme = shinythemes::shinytheme("cerulean"),
  paste("Hastings fishing boats", emo::ji("fish")),
  
  # NAV BAR: About
  
  tabPanel(
    "About",
    h3("Hastings boats"),
    HTML("This app allows for exploration of the Hastings Fishing Boat Database kept by the <a href='http://www.ohps.org.uk/hastings-fishermans-museum/'>Hastings Fishermen's Museum</a> run by the <a href='http://www.ohps.org.uk'>Old Hastings Preservation Society</a>."),
    p(paste(emo::ji("construction"), "This app is under development", emo::ji("construction"))),
    HTML("<p><img src='3761647380_731890690f_o.jpg' alt='Bridget McKenzie' width='1000'>"),
    HTML("<br>Photo by <a href='https://www.flickr.com/photos/bridgetmckenz/3761647380/in/photolist-6JpqHj-o7sicm-78NUgD-WMrKFA-Dr9rMc-9j1tCM-a2juLU-2DWm9-5pUbJd-cy1aLb-bK98tF-eN1hQu-K13EV-s3Y5BF-8QUExi-NT9DP-7TwHdL-78MXvD-5cs6Gm-5cnL2V-5ADihe-6Qda3V-pybsLH-9Bx7eY-qEvXZU-B6dv97-Hd2iN-6w8QoM-5cs7Wh-6JNXA-qdowgJ-6UYMAf-539AB-dwcCdh-3RCmxY-e4cB8E-6Qhe89-5pTTV5-6JKh2-BpTdSq-5cnQMz-5AHDVb-f36Tvk-5pPx1v-gXAX2G-8yrHGU-rLthTw-5pU8wu-HEVKmF-78eB52'>Bridget McKenzie</a> <a href='https://creativecommons.org/licenses/by-nc/2.0/'>CC BY-NC 2.0</a> (no changes made)")
    ),
  
  # NAV BAR: EXPLORE DATA ----
  
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
  
  # NAV BAR: SELECT BOAT
  
  tabPanel(
    title = "Select boat",
    
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
          
          # TAB: OVERVIEW ----
          
          tabPanel(
            title = "Overview",
            h3(textOutput("selected_boat")),
            h3(textOutput("selected_boat_reg"))
            #h3(textOutput("selected_range")),
            
          ),  # end of tabPanel
          
          # TAB: DIMENSIONS ----
          
          tabPanel(
            title = "Dimensions",
            "placeholder text",
            plotOutput("plot_weight_length")
          )  # end of tabPanel
          
        )  # end of tabsetPanel
      )  # end of mainPanel
    )  # end of sidebarLayout
    
  ),  # end of tabPanel
  
  # NAV BAR: ABOUT THE APP ----
  
  tabPanel(
    title = "About the app",
    
    h4("Data source"),
    HTML("Data were provided by <a href='http://www.ohps.org.uk/hastings-fishermans-museum/'>Hastings Fishermens' Museum</a> run by the <a href='http://www.ohps.org.uk'>Old Hastings Preservation Society</a>.<p>"),
    p(HTML("The data were collected originally by Steve Peak as a supplement to his book <a href='https://www.amazon.co.uk/Fishermen-Hastings-Steve-Peak/dp/B0054WJXN4'><i>Fishermen of Hastings</i></a>. The data are not yet available from this repository.")),
    
    h4("Data tidying"),
    HTML("This section will describe how the raw data were prepared."),
   
     h4("Tools"),
    HTML("<ul>
           <li>R v3.4.3</li>
           <li>RStudio v1.1.423</li>
           <li><code>shiny</code> package</li>
           <li><code>DT</code> package</li>
           <li><code>dplyr</code>package</li>
           <li><code>emo</code>package</li>
         </ul>"
    ),
    
    h4("Author"),
    HTML("Matt Dray (<a href='https://twitter.com/mattdray'>Twitter</a>, <a href='https://github.com/matt-dray'>GitHub</a>, <a href='mailto:mwdray@gmail.com'>email</a>)")
  )  # end of tabPanel
  
)  # end of navbarPage