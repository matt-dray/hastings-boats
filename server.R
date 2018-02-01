function(input, output) {
  
  # TEXT: SELECTED BOAT NAME ----
  
  output$selected_boat <- renderText({ 
    paste("You selected the boat called", input$boat)
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
  
}