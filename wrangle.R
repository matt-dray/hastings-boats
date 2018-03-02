# Read and tidy the data
# Matt Dray
# Jan 3 2018

# TODO --------------------------------------------------------------------

# * dates - 00/00/1895, etc
# * boat name - 1/2 (more than one entry for the same boat)
# * boat name - [a] (more than one vessel with the same name)
# * crew (skipper)
# * owner
# * 1/2, 2/2, etc, collapse into one row? so we get one boat per row

# Packages ----------------------------------------------------------------

library(readxl)
library(readr)
library(dplyr)
library(lubridate)
library(stringr)
library(tidyr)

# Read data ---------------------------------------------------------------

boats_raw <- readr::read_excel(
  path = "data/boat_database.xlsm",
  sheet = "boat database",
  skip = 1,
  na = c("NA", "No record", "no record")
)

# Wrangle data ------------------------------------------------------------

boats_clean <- boats_raw %>%
  # select and rename variables
  dplyr::select(
    reg_number = No.,
    reg_port = `Port Reg.`,
    boat_name = `Boat Name`,
    date_built = `Date Built`,
    date_sig = `Signif't Date`,  # 
    date_in = `Date in`,  # started work/changed owner/registered/appeared
    date_out = `Date out`,  # finished work/changed owner/de-registered/disappeared
    location_built = `Where Built`,
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
  dplyr::mutate(
    # full registration code
    reg_full = if_else(
      !is.na(reg_number) & !is.na(reg_port),
      paste0(reg_port, reg_number),
      "NA"
    ),
    # manually change text dates to integers
    date_sig = case_when(
      date_sig %in% c("1940s", "1940's") ~ "1945",
      date_sig == "1880/1" ~ "1881",
      date_sig == "1950's" ~ "1955",
      TRUE ~ date_sig
    ),
    date_built = if_else(date_built == "1940's", "1945", date_built),
    # full port name given the port code
    reg_port_name = case_when(
      reg_port == "DR" ~ "Dover",
      reg_port == "FE" ~ "Folkestone",
      reg_port == "NN" ~ "Newhaven",
      reg_port == "PH" ~ "Plymouth",
      reg_port == "RX" ~ "Rye",
      reg_port == "RE" ~ "Rye (before 1868)",
      reg_port == "SM" ~ "Shoreham",
      TRUE ~ "NA"
    ),
    # convert feet to metres where it hasn't been done
    length_m_update = if_else(
      !is.na(length_ft) & is.na(length_m),
      round(length_ft * 0.3048, 2),
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
    still_on_stade = ifelse(
      str_detect(tolower(notes), "still on stade") == TRUE,
      "On Stade",
      "Not on Stade"
    ),
    still_fishing = ifelse(
      str_detect(tolower(notes), "still fishing") == TRUE,
      "Still fishing",
      "Not fishing"
    )
  ) %>% 
  # change dates to numeric
  dplyr::mutate_at(vars("date_sig", "date_built"), funs(as.numeric(.))) %>% 
  # NAs
  dplyr::mutate_all(funs(na_if(., "NA")))

# Save dataframe ----------------------------------------------------------

# readr::write_rds(boats_clean, "output/boats_clean.rds")