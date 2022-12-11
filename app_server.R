# server

# loading library
library(plotly)
library(ggplot2)
library(shiny)
library(dplyr)

# loading data
data <- read.csv("http://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv", stringsAsFactors = F)
View(data)
# Three Relevant Values of Interest calculated

# continent with greatest amount of CO2 emission
continent_highest_co2 <- data %>%
  group_by(co2, country) %>%
  arrange(-co2) %>%
  summarise(highest = sum(co2), .groups = "drop") %>%
  arrange(-highest) %>%
  filter(country != "World") %>%
  top_n(1)
# Asia


# total CO2 emissions in 1750
co2_emission_1750 <- data %>%
  group_by(year) %>%
  summarise(co2 = sum(co2, na.rm = TRUE)) %>%
  filter(year == "1750") %>%
  arrange(-year) %>%
  pull(co2)
View(co2_emission_1750)
#56.106


# total CO2 emissions in 2020
co2_emission_2020 <- data %>%
  group_by(year) %>%
  summarise(co2 = sum(co2, na.rm = TRUE)) %>%
  filter(year == "2020") %>%
  arrange(-year) %>%
  pull(co2)
View(co2_emission_2020)
#228766.5
