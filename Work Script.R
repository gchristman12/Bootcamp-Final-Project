library(tidyverse)
library(here)
library(gtsummary)

athletes <- read_csv(here::here("Data","athlete_events.csv"))

#gtsummary table of descriptive stats

tbl_summary(
	athletes,
	by = Season,
	include = c(Sex, Age, Height, Team, Sport))

#Regression

linear_model <- lm(Age ~ Height + Weight,
									 data = athletes)

tbl_regression(
	linear_model,
	intercept = TRUE)

#Creating a figure
hist(athletes$Age)

#Creating a function

kgtolbs <- function(x) {
	lbs <- x*2.20462
	return(lbs)
}


