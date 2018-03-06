# Hastings boats Shiny app
# Global file
# March 2018
# Matt Dray

library(dplyr)  # data manipulation and pipes (%>%)
library(ggplot2)  # plot with ggplot
library(DT)  # for fancy datatables
library(emo)  # emoji
library(shinythemes)  # themes
library(janitor)
library(knitr)

boats_clean <- readRDS("output/boats_clean.rds")  # precleaned data
