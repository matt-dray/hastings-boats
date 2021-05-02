# Hastings Fishing Boat Database: wrangle data
# Data via Hastings Fishermen's Museum
# Matt Dray, May 2021

# Attach packages
library(dplyr)
library(here)
library(janitor)
library(stringr)
library(readr)
library(readxl)

# Read raw data (boat name data)
boats_in <- read_excel(
  path = here("data", "S2 - Boat Name.xlsm"),
  sheet = "boat database",
  skip = 1,
  na = c("NA", "No record", "no record"),
  col_types = c(
    "numeric", rep("text", 4), rep("numeric", 3), 
    rep("text", 5), rep("date", 2), rep("text", 2)
  )
)

# Wrangle boat data
boats_clean <- boats_in %>%
  # select and rename variables
  select(
    reg_number = No.,
    reg_port_code = `Port Reg.`,
    boat_name = `Boat Name`,
    build_year = `Date Built`,
    build_location = `Where Built`,
    date_sig = `Signif't Date`,  # 
    date_in = `Date in`,  # started work/changed owner/registered/appeared
    date_out = `Date out`,  # finished work/changed owner/de-registered/disappeared
    weight_tons = Tons,  # measurement has varied over time
    length_ft = Feet,  # 20.5 ft is 20 ft 6 in, measurement has varied over time
    length_m = Metres,
    deck_type = `Open or Decked`,
    construction_material = `Made of …`,
    propulsion = Propulsion,
    name_owner = `Boat Owner`,
    name_crew = `Crew Member`,
    notes = `Fate / Notes`
  ) %>% 
  # add new columns and alter others
  mutate(
    # full registration code
    reg_full = if_else(
      !is.na(reg_number) & !is.na(reg_port_code),
      paste0(reg_port_code, reg_number),
      NA_character_
    ),
    # manually change text dates to integers
    date_sig = case_when(
      date_sig %in% c("1940s", "1940's") ~ "1945",
      date_sig == "1880/1" ~ "1881",
      date_sig == "1950's" ~ "1955",
      TRUE ~ date_sig
    ),
    build_year = if_else(build_year == "1940's", "1945", build_year),
    # full port name given the port code
    reg_port_name = case_when(
      reg_port_code == "DR" ~ "Dover",
      reg_port_code == "FE" ~ "Folkestone",
      reg_port_code == "NN" ~ "Newhaven",
      reg_port_code == "PH" ~ "Plymouth",
      reg_port_code == "RX" ~ "Rye",
      reg_port_code == "RE" ~ "Rye (before 1868)",
      reg_port_code == "SM" ~ "Shoreham",
      TRUE ~ NA_character_
    ),
    # convert feet to metres where it hasn't been done
    length_m_update = if_else(
      !is.na(length_ft) & is.na(length_m),
      round_half_up(length_ft * 0.3048, 2),
      length_m
    ),
    # clarify fibre glass
    construction_material = if_else(
      construction_material == "GRP",
      "GRP (fibre glass)",
      construction_material
    ),
    # group and clarify propulsion systems
    propulsion = case_when(
      propulsion %in% c("Lugger", "Luggers") ~ "Lugger",
      propulsion %in% c("Lugger - big", "Lugger-big") ~ "Lugger (big)", 
      propulsion %in% c("Lugger/Aux", "LuggerAux") ~ "Lugger/Auxiliary",
      propulsion == "Gaff/Aux" ~ "Gaff/Auxiliary",  
      propulsion %in% c("Spritsail", "Spritsail rig") ~ "Spritsail",
      TRUE ~ propulsion
    ),
    # detect from notes column with boat is on the stade/still fishing
    still_on_stade = if_else(
      str_detect(tolower(notes), "still on stade") == TRUE,
      "On Stade",
      "Not on Stade"
    ),
    still_fishing = if_else(
      str_detect(tolower(notes), "still fishing") == TRUE,
      "Yes", NA_character_
    ),
    weight_tons_group = case_when(
      weight_tons < 5  ~ "5 and under",
      weight_tons < 10 ~ "5 to 10",
      weight_tons < 30 ~ "10 to 30",
      weight_tons >= 30 ~ "Over 30",
      TRUE ~ NA_character_
    ),
    length_m_update_group = case_when(
      length_m_update < 10  ~ "Under 10",
      length_m_update >= 10 ~ "10 and over",
      TRUE ~ NA_character_
    )
  )

# Simplify data set for presentation
boats_simple <- boats_clean %>% 
  transmute(
    Reg = reg_full, 
    Name = boat_name,
    `Build year` = as.integer(build_year), 
    `Build location` = build_location,
    Weight = round_half_up(weight_tons), 
    Length = round_half_up(length_m_update),
    Deck = deck_type, 
    Material = construction_material, 
    Propulsion = propulsion
  ) %>% 
  mutate(across(where(is.character), as.factor))

# Save the simplified data set
write_rds(boats_simple, here("output", "boats-simple.rds"))
