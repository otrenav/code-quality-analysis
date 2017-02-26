##
## Software quality and sustainability — Setup files
##
## Objective: setup environment for analysis
##
## Omar Trejo
## August, 2016
##

require(ggplot2)
require(GGally)
require(stargazer)

setwd("/home/otrenav/Projects/personal/code_quality_analysis/")

## Original data
data <- read.csv("./data/data_updated.csv")

## New data
new_data <- read.csv("./data/new_data.csv")

## Mean data
mean_data <- read.csv("./data/projects_metrics_updated.csv")

## Data by project
print(length(unique(data$Project)))

aggregated_data <- data.frame(
    Project=NA,
    Segment=NA,
    SRG=NA,
    S=NA,
    CBO=NA,
    DIT=NA,
    ILCOM=NA,
    LOC=NA,
    LOD=NA,
    NOM=NA
)

unique_projects <- unique(data$Project)
for (i in 1:length(unique_projects)) {
    ## Get single observation
    aggregated_data[i, "Project"] <- as.character(data[
        data$Project == unique_projects[i],
        "Project"
    ][1])
    aggregated_data[i, "Segment"] <- data[
        data$Project == unique_projects[i],
        "Segment"
    ][1]
    ## Aggregate observations
    ##
    ## When using the `median()` instead of the `mean()`
    ## the the results get distorted as only integer
    ## values in the actual domain are used.
    ##
    aggregated_data[i, "LOC"] <- sum(data[
        data$Project == unique_projects[i],
        "LOC"
    ])
    aggregated_data[i, "S"] <- mean(data[
        data$Project == unique_projects[i],
        "S"
    ])
    aggregated_data[i, "CBO"] <- mean(data[
        data$Project == unique_projects[i],
        "CBO",
    ])
    aggregated_data[i, "DIT"] <- mean(data[
        data$Project == unique_projects[i],
        "DIT"
    ])
    aggregated_data[i, "ILCOM"] <- mean(data[
        data$Project == unique_projects[i],
        "ILCOM"
    ])
    aggregated_data[i, "LOD"] <- mean(data[
        data$Project == unique_projects[i],
        "LOD"
    ])
    aggregated_data[i, "NOM"] <- mean(data[
        data$Project == unique_projects[i],
        "NOM"
    ])
}

##
## Create new metric: Cohesion Percentage (CP)
##
## The idea comes from ILCOM being a vanity metric,
## because an absolute number of methods being connected
## through instance variables is not useful to know how
## cohesive the particular class is because of the variable
## number of methods that each class has. To compensate for
## that we divide here by the Number of Methods (NOM) metric
## to get a Cohesion Percentage (CP).
##
## It was removed from the analysis in the end because it
## doesn't seem to be predictive of the relations.
##
data$CP <- data$ILCOM / data$NOM

##
## Sustainability Re-grouped (SRG)
##
## Some of the graphs are hard to read with 19 groups
## This reduces the data into 3 continuous groups.
##

##
## Raw data
##
data[data$Segment >= 1  & data$Segment <= 6,  "SRG"] <- 1
data[data$Segment >= 7  & data$Segment <= 12, "SRG"] <- 2
data[data$Segment >= 13 & data$Segment <= 19, "SRG"] <- 3

aggregated_data[
    aggregated_data$Segment >= 1 &
    aggregated_data$Segment <= 6,
    "SRG"
] <- 1
aggregated_data[
    aggregated_data$Segment >= 7 &
    aggregated_data$Segment <= 12,
    "SRG"
] <- 2
aggregated_data[
    aggregated_data$Segment >= 13 &
    aggregated_data$Segment <= 19,
    "SRG"
] <- 3

##
## Mean data
##
mean_data[mean_data$Segment >= 1  & mean_data$Segment <= 6,  "SRG"] <- 1
mean_data[mean_data$Segment >= 7  & mean_data$Segment <= 12, "SRG"] <- 2
mean_data[mean_data$Segment >= 13 & mean_data$Segment <= 19, "SRG"] <- 3

##
## Lines of Code per Projet data
##
data_LOC_Project <- aggregate(data$LOC, list(Project = data$Project), sum)

## Colors
primary_color   <- "#2196F3"
secondary_color <- "#F44336"
tertiary_color  <- "#4CAF50"
dark_color      <- "#595959"

## Dimensions
save_images = TRUE
landscape_width = 20
landscape_height = 10
square_width = 15
square_height = 12

##
## Categorization of metrics
##
## NOM:
## - [0, 3]   : "data_holder"
## - (3, 7]   : "recommended"
## - (7, ...) : "incoherent"
##
## DIT:
## - [0, 4]   : "recommended"
## - (4, ...) : "too_deep"
##
## CBO:
## - [0, 4]   : "recommended"
## - (4, ...) : "many_dependencies"
##
## ILCOM:
## - [0]      : "lack_of_methods"
## - (0, 1]   : "recommended"
## - (1, ...) : "low_cohesion"
##

mean_data[mean_data$NOM <= 3, "NOM_code"] <- "_data_holder"
mean_data[mean_data$NOM >  3 &
          mean_data$NOM <= 7, "NOM_code"] <- "_recommended"
mean_data[mean_data$NOM >  7, "NOM_code"] <- "_incoherent"

mean_data[mean_data$DIT <= 4, "DIT_code"] <- "_recommended"
mean_data[mean_data$DIT >  4, "DIT_code"] <- "_too_deep"

mean_data[mean_data$CBO <= 4, "CBO_code"] <- "_recommended"
mean_data[mean_data$CBO >  4, "CBO_code"] <- "_many_dependencies"
## mean_data[mean_data$CBO == 0, "CBO_code"] <- "_should_be_deleted"

mean_data[mean_data$ILCOM == 0, "ILCOM_code"] <- "_lack_of_methods"
mean_data[mean_data$ILCOM >  0 &
          mean_data$ILCOM <= 1, "ILCOM_code"] <- "_recommended"
mean_data[mean_data$ILCOM >  1, "ILCOM_code"] <- "_low_cohesion"

mean_data$NOM_code <- relevel(factor(mean_data$NOM_code), ref="_recommended")
mean_data$DIT_code <- relevel(factor(mean_data$DIT_code), ref="_recommended")
mean_data$CBO_code <- relevel(factor(mean_data$CBO_code), ref="_recommended")
mean_data$ILCOM_code <- relevel(factor(mean_data$ILCOM_code), ref="_recommended")
