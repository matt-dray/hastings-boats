# Server


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
  
  output$selected_range <- renderText({ 
    paste("You have chosen a range that goes from",
          input$range[1], "to", input$range[2])
  })
  
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
  
  # TABLE: datatable of the dataset ----
  
  output$fancyTable <- DT::renderDataTable({
    datatable(
      data = boats_clean,
      filter = "top",
      extensions = 'Buttons',
      options = list(
        autoWidth = TRUE,  # column width consistent when making selections
        dom = "Blfrtip",
        buttons = 
          list("copy", list(
            extend = "collection",
            buttons = c("csv", "excel", "pdf"),
            text = "Download"
          ) 
          ), # end of buttons customization
        
        # customize the length menu
        lengthMenu = list(
          c(10, 20, -1), # declare values
          c(10, 20, "All") # declare titles
        ), # end of lengthMenu customization
        pageLength = 10
        
        
      ) # end of datatable options
      
    ) # end of datatable
    
  }) # end of renderDataTable
  
  
}