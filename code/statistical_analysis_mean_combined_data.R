##
## Software quality and sustainability — Statistical Analysis with Mean Data Combinations
##
## Objective: understand code metrics impact on sustainability
##
## The data used here is the aggregated data (using the mean) that the client
## provided for the project (I don't have control over its correctness).
##
## Omar Trejo
## August, 2016
##

setwd("/home/otrenav/Projects/personal/code_quality_analysis/")
source("./code/initial_setup.R")
source("./code/multiplot.R")
source("./code/combine_variables.R")
require(gridExtra)
require(fmsb)

##
## CBO / LOC
##

result <- lm(data=mean_data, Segment ~ CBO_by_LOC)
summary(result)


##
## CBO / NOM
##

result <- lm(data=mean_data, Segment ~ CBO_by_NOM)
summary(result)


##
## ILCOM / LOC
##

result <- lm(data=mean_data, Segment ~ ILCOM_by_LOC)
summary(result)


##
## ILCOM / NOM
##

result <- lm(data=mean_data, Segment ~ ILCOM_by_NOM)
summary(result)


##
## LOD / LOC
##

result <- lm(data=mean_data, Segment ~ LOD_by_LOC)
summary(result)


##
## LOD / NOM
##

result <- lm(data=mean_data, Segment ~ LOD_by_NOM)
summary(result)


##
## DIT / LOC
##

result <- lm(data=mean_data, Segment ~ DIT_by_LOC)
summary(result)


##
## DIT / NOM
##

result <- lm(data=mean_data, Segment ~ DIT_by_NOM)
summary(result)


##
## LOC / NOM
##

result <- lm(data=mean_data, Segment ~ LOC_by_NOM)
summary(result)


##
## NOM / LOC
##

result <- lm(data=mean_data, Segment ~ NOM_by_LOC)
summary(result)


