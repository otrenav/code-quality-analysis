##
## Software quality and sustainability — Statistical Analysis with Aggregated Data
##
## Objective: understand code metrics impact on sustainability
##
## The results shown here in the comments correspond to using the `mean()`
## function to aggregate the values for each project. The same tests were
## performed for the `median()` function, but the results are qualitatively
## similar.
##
## Omar Trejo
## August, 2016
##

setwd("/home/otrenav/Projects/personal/code_quality_analysis/")
source("./code/initial_setup.R")

##
## Linear regressions
##
##
## Yes: at least two levels of significance
## No:  one or less levels of significance
##

## Singles (all)

result <- lm(data=aggregated_data, S ~ CBO)    ## No
summary(result)

result <- lm(data=aggregated_data, S ~ DIT)    ## No
summary(result)

result <- lm(data=aggregated_data, S ~ ILCOM)  ## No
summary(result)

result <- lm(data=aggregated_data, S ~ LOC)    ## No
summary(result)

result <- lm(data=aggregated_data, S ~ LOD)    ## No
summary(result)

result <- lm(data=aggregated_data, S ~ NOM)    ## Yes
summary(result)

## Doubles (all)

## CBO

result <- lm(data=aggregated_data, S ~ CBO + DIT)    ## No
summary(result)

result <- lm(data=aggregated_data, S ~ CBO + ILCOM)  ## No
summary(result)

result <- lm(data=aggregated_data, S ~ CBO + LOC)    ## No
summary(result)

result <- lm(data=aggregated_data, S ~ CBO + LOD)    ## No
summary(result)

result <- lm(data=aggregated_data, S ~ CBO + NOM)    ## Yes, NOM
summary(result)

## DIT

result <- lm(data=aggregated_data, S ~ DIT + ILCOM)  ## No
summary(result)

result <- lm(data=aggregated_data, S ~ DIT + LOC)    ## No
summary(result)

result <- lm(data=aggregated_data, S ~ DIT + LOD)    ## No
summary(result)

result <- lm(data=aggregated_data, S ~ DIT + NOM)    ## Yes, NOM
summary(result)

## ILCOM

result <- lm(data=aggregated_data, S ~ ILCOM + LOC)  ## No
summary(result)

result <- lm(data=aggregated_data, S ~ ILCOM + LOD)  ## No
summary(result)

result <- lm(data=aggregated_data, S ~ ILCOM + NOM)  ## No
summary(result)

## LOC

result <- lm(data=aggregated_data, S ~ LOC + LOD)    ## No
summary(result)

result <- lm(data=aggregated_data, S ~ LOC + NOM)    ## Yes, NOM
summary(result)

## LOD

result <- lm(data=aggregated_data, S ~ LOD + NOM)    ## Yes, NOM
summary(result)

## Triples (selected)

result <- lm(data=aggregated_data, S ~ DIT + CBO + LOD)  ## No
summary(result)

## Quatruples (selected)

result <- lm(data=aggregated_data, S ~ DIT + CBO + LOD + NOM)  ## Yes, NOM
summary(result)

## Full

result <- lm(data=aggregated_data, S ~ CBO + DIT + ILCOM + LOC + LOD + NOM)  ## No
summary(result)
