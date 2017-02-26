##
## Software quality and sustainability — Variable combination
##
## Objective: setup combined variables for analysis
##
## Omar Trejo
## August, 2016
##

mean_data$CBO_by_LOC <- mean_data$CBO / mean_data$LOC
mean_data$CBO_by_NOM <- mean_data$CBO / mean_data$NOM

mean_data$IILCOM_by_LOC <- mean_data$ILCOM / mean_data$LOC
mean_data$ILCOM_by_NOM <- mean_data$ILCOM / mean_data$NOM

mean_data$LOD_by_LOC <- mean_data$LOD / mean_data$LOC
mean_data$LOD_by_NOM <- mean_data$LOD / mean_data$NOM

mean_data$DIT_by_LOC <- mean_data$DIT / mean_data$LOC
mean_data$DIT_by_NOM <- mean_data$DIT / mean_data$NOM

mean_data$LOC_by_NOM <- mean_data$LOC / mean_data$NOM
mean_data$NOM_by_LOC <- mean_data$NOM / mean_data$LOC
