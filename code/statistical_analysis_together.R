##
## Software quality and sustainability — Statistical Analysis with All Data
##
## Objective: understand code metrics impact on sustainability
##
## Omar Trejo
## August, 2016
##

setwd("/home/otrenav/Projects/personal/code_quality_analysis/")
source("./code/initial_setup.R")

##
## Final used regressions
##

model_one <- lm(data=mean_data, Segment ~ CBO_code + ILCOM_code + LOC + LOD + DIT + NOM_code)
summary(model_one)

model_two <- lm(data=mean_data, S ~ CBO_code + ILCOM_code + LOC + LOD + DIT + NOM_code)
summary(model_two)

stargazer(
    model_one,
    model_two,
    title="Multiple Categorical Regression Results",
    align=TRUE
)

model_one <- lm(data=mean_data, Segment ~ NOM_code)
summary(model_one)

model_two <- lm(data=mean_data, S ~ NOM_code)
summary(model_two)

stargazer(
    model_one,
    model_two,
    title="Multiple Categorical Regression Results",
    align=TRUE
)
