##
## Software quality and sustainability — Statistical Analysis with Mean Data
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
require(gridExtra)
require(fmsb)

##
## Linear regressions
##
## The numbers in the comments represent the
## number of asterisks ('*': 1, '**': 2, '***': 3)
## we get for that regression and they appear in the
## order the variables were used in the regression
##

##
## Singles (all)
##

result <- lm(data=mean_data, S ~ CBO)    ## 0
summary(result)

result <- lm(data=mean_data, S ~ DIT)    ## 0
summary(result)

result <- lm(data=mean_data, S ~ ILCOM)  ## 0
summary(result)

result <- lm(data=mean_data, S ~ LOD)    ## 0
summary(result)

result <- lm(data=mean_data, S ~ LOC)    ## 1
summary(result)

result <- lm(data=mean_data, S ~ NOM)    ## 2
summary(result)

##
## Doubles (all)
##

## CBO

result <- lm(data=mean_data, S ~ CBO + DIT)    ## 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO + ILCOM)  ## 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO + LOD)    ## 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO + LOC)    ## 0, 1
summary(result)

result <- lm(data=mean_data, S ~ CBO + NOM)    ## 0, 2
summary(result)

## DIT

result <- lm(data=mean_data, S ~ DIT + LOD)    ## 0, 0
summary(result)

result <- lm(data=mean_data, S ~ DIT + ILCOM)  ## 0, 1
summary(result)

result <- lm(data=mean_data, S ~ DIT + LOC)    ## 0, 1
summary(result)

result <- lm(data=mean_data, S ~ DIT + NOM)    ## 0, 2
summary(result)

## ILCOM

result <- lm(data=mean_data, S ~ ILCOM + LOC)  ## 0, 0
summary(result)

result <- lm(data=mean_data, S ~ ILCOM + LOD)  ## 1, 0
summary(result)

result <- lm(data=mean_data, S ~ ILCOM + NOM)  ## 0, 1
summary(result)

## LOC

result <- lm(data=mean_data, S ~ LOC + LOD)    ## 1, 0
summary(result)

result <- lm(data=mean_data, S ~ LOC + NOM)    ## 0, 1
summary(result)

## LOD

result <- lm(data=mean_data, S ~ LOD + NOM)    ## 0, 2
summary(result)

##
## Triples (all)
##
## Metrics in order: CBO, DIT, ILCOM, LOC, LOD, NOM
##

result <- lm(data=mean_data, S ~ CBO + DIT + ILCOM)  ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO + DIT + LOC)    ## 0, 0, 1
summary(result)

result <- lm(data=mean_data, S ~ CBO + DIT + LOD)    ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO + DIT + NOM)    ## 0, 0, 1
summary(result)

result <- lm(data=mean_data, S ~ CBO + ILCOM + LOC)  ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO + ILCOM + LOD)  ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO + ILCOM + NOM)  ## 0, 0, 1
summary(result)

result <- lm(data=mean_data, S ~ CBO + LOC + LOD)    ## 0, 1, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO + LOC + NOM)    ## 0, 0, 1
summary(result)

result <- lm(data=mean_data, S ~ CBO + LOD + NOM)    ## 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ DIT + ILCOM + LOC)  ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ DIT + ILCOM + LOD)  ## 0, 1, 0
summary(result)

result <- lm(data=mean_data, S ~ DIT + ILCOM + NOM)  ## 0, 0, 1
summary(result)

result <- lm(data=mean_data, S ~ DIT + LOC + LOD)    ## 0, 1, 0
summary(result)

result <- lm(data=mean_data, S ~ DIT + LOC + NOM)    ## 0, 0, 1
summary(result)

result <- lm(data=mean_data, S ~ DIT + LOD + NOM)    ## 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ ILCOM + LOC + LOD)  ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ ILCOM + LOC + NOM)  ## 0, 0, 1
summary(result)

result <- lm(data=mean_data, S ~ ILCOM + LOD + NOM)  ## 0, 0, 2
summary(result)

## LOC

result <- lm(data=mean_data, S ~ LOC + LOD + NOM)    ## 0, 0, 1
summary(result)

##
## Quatruples (all)
##

result <- lm(data=mean_data, S ~ CBO + DIT + ILCOM + LOC)  ## 0, 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ CBO + DIT + ILCOM + LOD)  ## 0, 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ CBO + DIT + ILCOM + NOM)  ## 0, 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ CBO + ILCOM + LOC + LOD)  ## 0, 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ CBO + ILCOM + LOC + NOM)  ## 0, 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ CBO + ILCOM + LOD + NOM)  ## 0, 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ CBO + LOC + LOD + NOM)    ## 0, 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ DIT + ILCOM + LOC + LOD)  ## 0, 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ DIT + ILCOM + LOC + NOM)  ## 0, 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ DIT + ILCOM + LOD + NOM)  ## 0, 0, 0, 2
summary(result)

result <- lm(data=mean_data, S ~ DIT + LOC + LOD + NOM)    ## 0, 0, 0, 2
summary(result)

##
## Quintuples (all)
##

result <- lm(data=mean_data, S ~ CBO + DIT + ILCOM + LOC + LOD )  ## 0, 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO + DIT + ILCOM + LOC + NOM)   ## 0, 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO + DIT + ILCOM + LOD + NOM)   ## 0, 0, 0, 0, 1
summary(result)

result <- lm(data=mean_data, S ~ CBO + DIT + LOC + LOD + NOM)     ## 0, 0, 0, 0, 1
summary(result)

result <- lm(data=mean_data, S ~ CBO + ILCOM + LOC + LOD + NOM)   ## 0, 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ DIT + ILCOM + LOC + LOD + NOM)   ## 0, 0, 0, 0, 1
summary(result)

##
## All metrics
##

##
## Categorical regressions
##
## The numbers in the comments represent the
## number of asterisks ('*': 1, '**': 2, '***': 3)
## we get for that regression and they appear in the
## order the variables were used in the regression
##

##
## Using S for regressions
##

##
## Singles (all)
##

result <- lm(data=mean_data, S ~ CBO_code)    ## 0
summary(result)

result <- lm(data=mean_data, S ~ DIT_code)    ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ ILCOM_code)  ## 0, 0
summary(result)

result <- lm(data=mean_data, S ~ LOD)         ## 0
summary(result)

result <- lm(data=mean_data, S ~ LOC)         ## 1
summary(result)

result <- lm(data=mean_data, S ~ NOM_code)    ## 2, 0
summary(result)

##
## Doubles (all)
##

## CBO_code

result <- lm(data=mean_data, S ~ CBO_code + DIT_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + ILCOM_code)  ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + LOD)  ## 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + LOC)  ## 0, 1
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + NOM_code)  ## 0, 1, 0
summary(result)

## DIT_code

result <- lm(data=mean_data, S ~ DIT_code + LOD)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + ILCOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + LOC)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + NOM_code)  ## Incoherent
summary(result)

## ILCOM_code

result <- lm(data=mean_data, S ~ ILCOM_code + LOC)  ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ ILCOM_code + LOD)  ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ ILCOM_code + NOM_code)  ## 0, 0, 1, 0
summary(result)

## LOC

result <- lm(data=mean_data, S ~ LOC + LOD)  ## 1, 0
summary(result)

result <- lm(data=mean_data, S ~ LOC + NOM_code)  ## 0, 1, 0
summary(result)

## LOD

result <- lm(data=mean_data, S ~ LOD + NOM_code)  ## 0, 2, 0
summary(result)

##
## Triples (all)
##
## Metrics in order: CBO_code, DIT_code, ILCOM_code, LOC, LOD, NOM_code
##

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + ILCOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + LOC)    ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + LOD)    ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + ILCOM_code + LOC)  ## 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + ILCOM_code + LOD)  ## 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + ILCOM_code + NOM_code)  ## 0, 0, 1, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + LOC + LOD)  ## 0, 1, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + LOC + NOM_code)  ## 0, 0, 1, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + LOD + NOM_code)  ## 0, 0, 1, 0
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + ILCOM_code + LOC)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + ILCOM_code + LOD)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + ILCOM_code + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + LOC + LOD)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + LOC + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + LOD + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ ILCOM_code + LOC + LOD)  ## 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ ILCOM_code + LOC + NOM_code)  ## 0, 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ ILCOM_code + LOD + NOM_code)  ## 0, 0, 0, 2, 0
summary(result)

## LOC

result <- lm(data=mean_data, S ~ LOC + LOD + NOM_code)    ## 0, 0, 1, 0
summary(result)

##
## Quatruples (all)
##

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + ILCOM_code + LOC)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + ILCOM_code + LOD)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + ILCOM_code + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + ILCOM_code + LOC + LOD)  ## 0, 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + ILCOM_code + LOC + NOM_code)  ## 0, 0, 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + ILCOM_code + LOD + NOM_code)  ## 0, 0, 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + LOC + LOD + NOM_code)  ## 0, 0, 0, 1, 0
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + ILCOM_code + LOC + LOD)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + ILCOM_code + LOC + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + ILCOM_code + LOD + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + LOC + LOD + NOM_code)  ## Incoherent
summary(result)

##
## Quintuples (all)
##

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + ILCOM_code + LOC + LOD )  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + ILCOM_code + LOC + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + ILCOM_code + LOD + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + LOC + LOD + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + ILCOM_code + LOC + LOD + NOM_code)  ## 0, 0, 0, 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ DIT_code + ILCOM_code + LOC + LOD + NOM_code)  ## Incoherent
summary(result)

##
## All metrics
##

result <- lm(data=mean_data, S ~ CBO_code + DIT_code + ILCOM_code + LOC + LOD + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + ILCOM_code + LOC + LOD + NOM_code)  ## 0, 0, 0, 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, S ~ CBO_code + ILCOM_code + NOM_code)  ## 0, 0, 0, 0, 0
summary(result)
result <- lm(data=mean_data, S ~ NOM_code)  ## 0, 0, 0, 0, 0
summary(result)

##
## Using Segment for regressions
##

##
## Singles (all)
##

result <- lm(data=mean_data, Segment ~ CBO_code)    ## 0
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code)    ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ ILCOM_code)  ## 0, 0
summary(result)

result <- lm(data=mean_data, Segment ~ LOD)         ## 0
summary(result)

result <- lm(data=mean_data, Segment ~ LOC)         ## 1
summary(result)

result <- lm(data=mean_data, Segment ~ NOM_code)    ## 2, 0
summary(result)

##
## Doubles (all)
##

## CBO_code

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + ILCOM_code)  ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + LOD)  ## 0, 0
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + LOC)  ## 0, 1
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + NOM_code)  ## 0, 1, 0
summary(result)

## DIT_code

result <- lm(data=mean_data, Segment ~ DIT_code + LOD)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + ILCOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + LOC)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + NOM_code)  ## Incoherent
summary(result)

## ILCOM_code

result <- lm(data=mean_data, Segment ~ ILCOM_code + LOC)  ## 0, 0, 0
summary(result)

result <- lm(data=mean_data, Segment ~ ILCOM_code + LOD)  ## 1, 0, 0  | (0, 0 ,0) with S
summary(result)

result <- lm(data=mean_data, Segment ~ ILCOM_code + NOM_code)  ## 0, 0, 1, 0
summary(result)

## LOC

result <- lm(data=mean_data, Segment ~ LOC + LOD)  ## 1, 0
summary(result)

result <- lm(data=mean_data, Segment ~ LOC + NOM_code)  ## 0, 1, 0
summary(result)

## LOD

result <- lm(data=mean_data, Segment ~ LOD + NOM_code)  ## 0, 2, 0
summary(result)

##
## Triples (all)
##
## Metrics in order: CBO_code, DIT_code, ILCOM_code, LOC, LOD, NOM_code
##

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + ILCOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + LOC)    ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + LOD)    ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + ILCOM_code + LOC)  ## 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + ILCOM_code + LOD)  ## 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + ILCOM_code + NOM_code)  ## 0, 0, 1, 0
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + LOC + LOD)  ## 0, 1, 0
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + LOC + NOM_code)  ## 0, 0, 2, 0  | (0, 0, 1, 0 with S)
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + LOD + NOM_code)  ## 0, 0, 2, 0  | (0, 0, 2, 0 with S)
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + ILCOM_code + LOC)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + ILCOM_code + LOD)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + ILCOM_code + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + LOC + LOD)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + LOC + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + LOD + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ ILCOM_code + LOC + LOD)  ## 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, Segment ~ ILCOM_code + LOC + NOM_code)  ## 0, 0, 0, 1, 0  |  (0, 0, 0, 0, 0 with S)
summary(result)

result <- lm(data=mean_data, Segment ~ ILCOM_code + LOD + NOM_code)  ## 0, 0, 0, 1, 0  |  (0, 0, 0, 2, 0 with S)
summary(result)

## LOC

result <- lm(data=mean_data, Segment ~ LOC + LOD + NOM_code)    ## 0, 0, 1, 0  |  (0, 0, 2, 0 with S)
summary(result)

##
## Quatruples (all)
##

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + ILCOM_code + LOC)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + ILCOM_code + LOD)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + ILCOM_code + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + ILCOM_code + LOC + LOD)  ## 0, 0, 0, 0, 0
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + ILCOM_code + LOC + NOM_code)  ## 0, 0, 0, 0, 0, 0  |  (0, 0, 0, 0, 1, 0 with S)
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + ILCOM_code + LOD + NOM_code)  ## 0, 0, 0, 0, 0, 0  |  (0, 0, 0, 0, 1, 0 with S)
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + LOC + LOD + NOM_code)  ## 0, 0, 0, 1, 0  |  (0, 0, 0, 2, 0 with S)
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + ILCOM_code + LOC + LOD)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + ILCOM_code + LOC + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + ILCOM_code + LOD + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + LOC + LOD + NOM_code)  ## Incoherent
summary(result)

##
## Quintuples (all)
##

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + ILCOM_code + LOC + LOD )  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + ILCOM_code + LOC + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + ILCOM_code + LOD + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + LOC + LOD + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + ILCOM_code + LOC + LOD + NOM_code)  ## 0, 0, 0, 0, 0, 0, 0  |  (0, 0, 0, 0, 0, 1, 0 with S)
summary(result)

result <- lm(data=mean_data, Segment ~ DIT_code + ILCOM_code + LOC + LOD + NOM_code)  ## Incoherent
summary(result)

##
## All metrics
##

result <- lm(data=mean_data, Segment ~ CBO_code + DIT_code + ILCOM_code + LOC + LOD + NOM_code)  ## Incoherent
summary(result)

result <- lm(data=mean_data, Segment ~ CBO_code + ILCOM_code + LOC + LOD + NOM_code)  ## 0, 0, 0, 0, 0, 0, 0  | (0, 0, 0, 0, 0, 1, 0 with S)
summary(result)

## If VIF > 10, multicolinearity is strongly suggested
print(paste("VIF: ", VIF(result), paste=""))
plot(result)

##
## Independence tests
##

##
## Variables used for tests (pick a pair at a time)
##
var_one = "CBO_code"    # Error: only has one group
var_two = "DIT_code"

var_one = "DIT_code"    # Error: only has one group
var_two = "ILCOM_code"

var_one = "DIT_code"    # Error: only has one group
var_two = "NOM_code"

var_one = "CBO_code"    # Validated, except Segment = 19, null not rejected
var_two = "ILCOM_code"

var_one = "CBO_code"    # Validated, except Segment = 19, null not rejected
var_two = "NOM_code"

var_one = "ILCOM_code"  # No systematic relation, null rejected
var_two = "NOM_code"

var_three = "Segment"

##
## Independence tests
##
table(mean_data[, var_one], mean_data[, var_two])
chisq.test(table(mean_data[, var_one], mean_data[, var_two]))
fisher.test(table(mean_data[, var_one], mean_data[, var_two]))
mantelhaen.test(table(mean_data[, var_one], mean_data[, var_two], mean_data[, var_three]))

##
## Visual test for no three-way interaction
##
data_table <- data.frame(
    table(
        mean_data[, var_one],
        mean_data[, var_two],
        mean_data[, var_three]
    )
)
colnames(data_table) <- c(var_one, var_two, var_three, "Frequency")
unique_segments <- unique(mean_data[, var_three])
plots <- list()
for (i in 1:length(unique_segments)) {
    aux_df <- data_table[data_table[, var_three] == unique_segments[i], ]
    plots[[i]] <- ggplot(
        data=as.data.frame(aux_df),
        aes_string(x=var_one, y="Frequency", fill=var_two)
    ) +
        geom_bar(stat="identity") +
        labs(title=paste("Segment ", unique_segments[i]), sep="")

}
multiplot(plotlist=plots, cols=5)
