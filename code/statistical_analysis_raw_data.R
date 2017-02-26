##
## Software quality and sustainability — Statistical Analysis with Raw Data
##
## Objective: understand code metrics impact on sustainability
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

result <- lm(data=data, S ~ CBO)    ## Yes
summary(result)

result <- lm(data=data, S ~ DIT)    ## Yes
summary(result)

result <- lm(data=data, S ~ ILCOM)  ## No
summary(result)

result <- lm(data=data, S ~ LOC)    ## No
summary(result)

result <- lm(data=data, S ~ LOD)    ## Yes
summary(result)

result <- lm(data=data, S ~ NOM)    ## Yes
summary(result)

result <- lm(data=data, S ~ CP)     ## No
summary(result)

## Doubles (all)

## CBO

result <- lm(data=data, S ~ CBO + DIT)    ## Yes, both
summary(result)

result <- lm(data=data, S ~ CBO + ILCOM)  ## Yes, CBO
summary(result)

result <- lm(data=data, S ~ CBO + LOC)    ## Yes, both
summary(result)

result <- lm(data=data, S ~ CBO + LOD)    ## Yes, both
summary(result)

result <- lm(data=data, S ~ CBO + NOM)    ## Yes, CBO
summary(result)

result <- lm(data=data, S ~ CBO + CP)     ## Yes, CBO
summary(result)

## DIT

result <- lm(data=data, S ~ DIT + ILCOM)  ## Yes, both
summary(result)

result <- lm(data=data, S ~ DIT + LOC)    ## Yes, DIT
summary(result)

result <- lm(data=data, S ~ DIT + LOD)    ## Yes, both
summary(result)

result <- lm(data=data, S ~ DIT + NOM)    ## Yes, both
summary(result)

result <- lm(data=data, S ~ DIT + CP)     ## Yes, DIT
summary(result)

## ILCOM

result <- lm(data=data, S ~ ILCOM + LOC)  ## No
summary(result)

result <- lm(data=data, S ~ ILCOM + LOD)  ## Yes, LOD
summary(result)

result <- lm(data=data, S ~ ILCOM + NOM)  ## Yes, NOM
summary(result)

result <- lm(data=data, S ~ ILCOM + CP)   ## Yes, ILCOM
summary(result)

## LOC

result <- lm(data=data, S ~ LOC + LOD)    ## Yes, LOD
summary(result)

result <- lm(data=data, S ~ LOC + NOM)    ## Yes, NOM
summary(result)

result <- lm(data=data, S ~ LOC + CP)     ## No
summary(result)

## LOD

result <- lm(data=data, S ~ LOD + NOM)    ## Yes, both
summary(result)

result <- lm(data=data, S ~ LOD + CP)     ## Yes, LOD
summary(result)

## NOM

result <- lm(data=data, S ~ NOM + CP)         ## Yes, NOM
summary(result)

## Triples (selected)

result <- lm(data=data, S ~ DIT + CBO + LOD)  ## Yes, all
summary(result)

## Quatruples (selected)

result <- lm(data=data, S ~ DIT + CBO + LOD + NOM)  ## Yes, except NOM
summary(result)

## Full

result <- lm(data=data, S ~ CBO + DIT + ILCOM + LOC + LOD + NOM)
summary(result)

stargazer(result, title="Multiple Linear Regression Results", align=TRUE)

## result <- lm(data=data, S ~ CBO + DIT + ILCOM + LOC + LOD + NOM + CP)
## summary(result)
