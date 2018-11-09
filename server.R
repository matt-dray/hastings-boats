# Hastings boats Shiny app
# Server
# March 2018
# Matt Dray

function(input, output) {
  
  # TEXT: SELECTED BOAT NAME ----
  
  output$selected_boat <- renderText({ 
    paste("You selected the boat called", input$boat)
  })
  
  # TEXT: SELECTED BOAT NAME REGISTRATION ----
  
  output$selected_boat_reg <- renderText({ 
    paste(
      "Its registration is",
      ifelse(
        test = is.na(boats_clean$reg_full[boats_clean$boat_name == input$boat]),
        yes = "unknown",
        no = boats_clean$reg_full[boats_clean$boat_name == input$boat]
      )
    )
  })
  
  # TEXT: YEAR RANGE ----
  
  # output$selected_range <- renderText({ 
  #   paste("You have chosen a range that goes from",
  #         input$range[1], "to", input$range[2])
  # })
  
  # PLOT: LENGTH x WEIGHT ----
  
  output$plot_weight_length <- renderPlot({ 
    boats_clean %>%
      ggplot() +
      geom_point(
        aes(x = weight_tons,
            y = length_m),
        color = "grey90",
        na.rm = TRUE) +
      xlim(
        min(boats_clean$weight_tons, na.rm = TRUE),
        max(boats_clean$weight_tons, na.rm = TRUE)
      ) +
      ylim(
        min(boats_clean$length_m, na.rm = TRUE), 
        max(boats_clean$length_m, na.rm = TRUE)
      ) +
      geom_point(data = filter(boats_clean, boat_name == input$boat),
                 aes(x = weight_tons, y = length_m),
                 color = "red",
                 #size = 2,
                 na.rm = TRUE
      ) +
      theme_minimal() +
      geom_text(
        aes(label = input$boat,
            x = weight_tons[boats_clean$boat_name == input$boat],
            y = length_m[boats_clean$boat_name == input$boat]),
        na.rm = TRUE,
        # hjust = -0.2,
        # vjust = -0.2,
        nudge_y = 0.7,
        color = "red"
      )
  })
  
  # TABLE: DATATABLE ----
  
  output$fancyTable <- DT::renderDataTable({
    
    datatable(
      data = arrange(  # to arrange by date_built
        mutate(  # DT::datatable provides dropdowns for factors
          select(  # we don't need to display the whole dataset in the datatable
            boats_clean,
            reg_full,
            boat_name,
            date_built,
            location_built,
            reg_port_name,
            weight_tons,
            length_m_update,
            length_ft,
            deck_type,
            construction_material,
            propulsion,
            name_owner,
            name_crew,
            still_on_stade,
            still_fishing
          ),  # end select
          reg_full = as.factor(reg_full),
          boat_name = as.factor(boat_name),
          date_built = as.integer(date_built),
          location_built = as.factor(location_built),
          reg_port_name = as.factor(reg_port_name),
          deck_type = as.factor(deck_type),
          construction_material = as.factor(construction_material),
          propulsion = as.factor(propulsion),
          still_on_stade = as.factor(still_on_stade),
          still_fishing = as.factor(still_fishing)
        ),  # end mutate
        date_built
      ),  # end arrange
      colnames = c(
        "Reg" = "reg_full",
        "Name" = "boat_name",
        "Build date"= "date_built",
        "Build location"= "location_built",
        "Registration port"= "reg_port_name",
        "Weight (tons)" = "weight_tons",
        "Length (metres)"= "length_m_update",
        "Length (feet)" = "length_ft",
        "Deck type" = "deck_type",
        "Construction material" = "construction_material",
        "Propulsion" = "propulsion",
        "Owner" = "name_owner",
        "Crew" = "name_crew",
        "On Stade" = "still_on_stade",
        "Still fishing" = "still_fishing"
      ),
      
      filter = "top",
      extensions = 'Buttons',
      options = list(
        autoWidth = TRUE,  # column width consistent when making selections
        dom = "Blfrtip",
        columnDefs = list(
          list(
            visible = FALSE,
            targets = c(4, 5, 8, 14, 15)
          )
        ), 
        buttons = list(
          I("colvis"),  # turn columns on and off
          "csv",  # download as .csv
          "excel"  # download as .xlsx
        ), # end of buttons customization
        
        # customize the length menu
        lengthMenu = list(
          c(10, 25, 50, -1), # declare values
          c(10, 25, 50, "All") # declare titles
        ), # end of lengthMenu customization
        pageLength = 10
        
        
      ) # end of datatable options
      
    ) # end of datatable
    
  }) # end of renderDataTable
  
  # RMARKDOWN: SUMMARY
  
  output$rmarkdown_summary <- renderUI({
    HTML(markdown::markdownToHTML(
      knitr::knit("summaries.Rmd", quiet = TRUE),
      fragment.only=TRUE))  # prevents resizing of app
  })
  
}