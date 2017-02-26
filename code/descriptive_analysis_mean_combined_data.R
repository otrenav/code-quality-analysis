##
## Software quality and sustainability — Descriptive Analysis with Mean Data Combined
##
## Objective: understand data structure and characteristics
##
## Code metrics:
##
## - Coupling Between Objects (CBO) (Integer, Standard: [1, 4])
## - Lines of Code (LOC) (Integer, non-linear relation ISO)
## - Lack of Documentation (LOD) (Rational, (Unreal) Optimum: 0)
## - Number of Methods (NOM) (Integer, Standard: [3, 7])
## - Depth of Inheritance (DIT) (Integer, Standard: [0, 4])
## - Improvement of Lack of Cohesion in Methods (ILCOM) (Integeres)
## - Cohesion Percentage (CP) (Fraction: [0, 1], Optimum: 1)
##
## Omar Trejo
## August, 2016
##

setwd("/home/otrenav/Projects/personal/code_quality_analysis/")
source("./code/initial_setup.R")
source("./code/summarySE.R")
source("./code/combine_variables.R")

##
## CBO / LOC
##

## aux_df <- summarySE(mean_data, measurevar="CBO_by_LOC", groupvars=c("Segment", "SRG"))
## graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=CBO_by_LOC)) +
##     geom_errorbar(aes(ymin=CBO_by_LOC-se, ymax=CBO_by_LOC+se), width=1, size=1) +
##     geom_point(size=4) +
##     geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
##     labs(x="Segment")
## print(graph)

##
## CBO / NOM
##

## aux_df <- summarySE(mean_data, measurevar="CBO_by_NOM", groupvars=c("Segment", "SRG"))
## graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=CBO_by_NOM)) +
##     geom_errorbar(aes(ymin=CBO_by_NOM-se, ymax=CBO_by_NOM+se), width=1, size=1) +
##     geom_point(size=4) +
##     geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
##     labs(x="Segment")
## print(graph)

##
## ILCOM / LOC
##

## aux_df <- summarySE(mean_data, measurevar="ILCOM_by_LOC", groupvars=c("Segment", "SRG"))
## graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=ILCOM_by_LOC)) +
##     geom_errorbar(aes(ymin=ILCOM_by_LOC-se, ymax=ILCOM_by_LOC+se), width=1, size=1) +
##     geom_point(size=4) +
##     geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
##     labs(x="Segment")
## print(graph)

##
## ILCOM / NOM
##

## aux_df <- summarySE(mean_data, measurevar="ILCOM_by_NOM", groupvars=c("Segment", "SRG"))
## graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=ILCOM_by_NOM)) +
##     geom_errorbar(aes(ymin=ILCOM_by_NOM-se, ymax=ILCOM_by_NOM+se), width=1, size=1) +
##     geom_point(size=4) +
##     geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
##     labs(x="Segment")
## print(graph)

##
## LOD / LOC
##

## aux_df <- summarySE(mean_data, measurevar="LOD_by_LOC", groupvars=c("Segment", "SRG"))
## graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=LOD_by_LOC)) +
##     geom_errorbar(aes(ymin=LOD_by_LOC-se, ymax=LOD_by_LOC+se), width=1, size=1) +
##     geom_point(size=4) +
##     geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
##     labs(x="Segment")
## print(graph)

##
## LOD / NOM
##

## aux_df <- summarySE(mean_data, measurevar="LOD_by_NOM", groupvars=c("Segment", "SRG"))
## graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=LOD_by_NOM)) +
##     geom_errorbar(aes(ymin=LOD_by_NOM-se, ymax=LOD_by_NOM+se), width=1, size=1) +
##     geom_point(size=4) +
##     geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
##     labs(x="Segment")
## print(graph)

##
## DIT / LOC
##

## aux_df <- summarySE(mean_data, measurevar="DIT_by_LOC", groupvars=c("Segment", "SRG"))
## graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=DIT_by_LOC)) +
##     geom_errorbar(aes(ymin=DIT_by_LOC-se, ymax=DIT_by_LOC+se), width=1, size=1) +
##     geom_point(size=4) +
##     geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
##     labs(x="Segment")
## print(graph)

##
## DIT / NOM
##

## aux_df <- summarySE(mean_data, measurevar="DIT_by_NOM", groupvars=c("Segment", "SRG"))
## graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=DIT_by_NOM)) +
##     geom_errorbar(aes(ymin=DIT_by_NOM-se, ymax=DIT_by_NOM+se), width=1, size=1) +
##     geom_point(size=4) +
##     geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
##     labs(x="Segment")
## print(graph)

##
## LOC / NOM
##

##
## General with outlier
##
temp_data <- mean_data
aux_df <- summarySE(mean_data, measurevar="LOC_by_NOM", groupvars=c("Segment", "SRG"))
graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=LOC_by_NOM)) +
    geom_errorbar(aes(ymin=LOC_by_NOM-se, ymax=LOC_by_NOM+se), width=1, size=1) +
    geom_point(size=4) +
    geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
    labs(x="Segment")
print(graph)
if (save_images) {
    ggsave(
        "./document/automatic_images/LOC_NOM_by_segments_with_outlier.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## General without outlier
##
temp_data <- mean_data
temp_data <- temp_data[temp_data$Segment != 10, ]
aux_df <- summarySE(temp_data, measurevar="LOC_by_NOM", groupvars=c("Segment"))
graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=LOC_by_NOM)) +
    geom_errorbar(aes(ymin=LOC_by_NOM-se, ymax=LOC_by_NOM+se), width=1, size=1) +
    geom_point(size=4) +
    geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
    labs(x="Segment")
print(graph)
if (save_images) {
    ggsave(
        "./document/automatic_images/LOC_NOM_by_segments_without_outlier.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## ILCOM with outlier
##

## temp_data <- mean_data
## ## temp_data <- temp_data[temp_data$Segment != 10, ]
## ## temp_data <- temp_data[temp_data$ILCOM_code != "_lack_of_methods", ]
## aux_df <- summarySE(temp_data, measurevar="LOC_by_NOM", groupvars=c("Segment", "ILCOM_code"))
## graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=LOC_by_NOM)) +
##     geom_point(size=4, aes(colour=ILCOM_code)) +
##     geom_smooth(aes(x=Segment, colour=ILCOM_code), method=lm, se=FALSE, linetype="dashed") +
##     geom_smooth(aes(x=Segment, colour=ILCOM_code, fill=ILCOM_code), alpha=0.3) +
##     labs(x="Segment")
## print(graph)
## if (save_images) {
##     ggsave(
##         "./document/automatic_images/LOC_NOM_ILCOM_by_segments_with_outlier.png",
##         width=landscape_width,
##         height=landscape_height,
##         units="cm"
##     )
## }


##
## ILCOM without outlier
##

temp_data <- mean_data
temp_data <- temp_data[temp_data$Segment != 10, ]
aux_df <- summarySE(temp_data, measurevar="LOC_by_NOM", groupvars=c("Segment", "ILCOM_code"))
graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=LOC_by_NOM)) +
    geom_point(size=4, aes(colour=ILCOM_code)) +
    geom_smooth(aes(x=Segment, colour=ILCOM_code), method=lm, se=FALSE, linetype="dashed") +
    geom_smooth(aes(x=Segment, colour=ILCOM_code, fill=ILCOM_code), alpha=0.3) +
    labs(x="Segment")
print(graph)
if (save_images) {
    ggsave(
        "./document/automatic_images/LOC_NOM_ILCOM_by_segments_without_outlier.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## ILCOM without outlier and without _lack_of_cohesion
##

temp_data <- mean_data
temp_data <- temp_data[temp_data$Segment != 10, ]
temp_data <- temp_data[temp_data$ILCOM_code != "_lack_of_methods", ]
aux_df <- summarySE(temp_data, measurevar="LOC_by_NOM", groupvars=c("Segment", "ILCOM_code"))
graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=LOC_by_NOM)) +
    geom_point(size=4, aes(colour=ILCOM_code)) +
    geom_smooth(aes(x=Segment, colour=ILCOM_code), method=lm, se=FALSE, linetype="dashed") +
    geom_smooth(aes(x=Segment, colour=ILCOM_code, fill=ILCOM_code), alpha=0.3) +
    labs(x="Segment")
print(graph)
if (save_images) {
    ggsave(
        "./document/automatic_images/LOC_NOM_ILCOM_by_segments_without_outlier_and_lack_of_cohesion.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## CBO with outlier
##

temp_data <- mean_data
aux_df <- summarySE(temp_data, measurevar="LOC_by_NOM", groupvars=c("Segment", "CBO_code"))
graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=LOC_by_NOM)) +
    geom_point(size=4, aes(colour=CBO_code)) +
    geom_smooth(aes(x=Segment, colour=CBO_code), method=lm, se=FALSE, linetype="dashed") +
    geom_smooth(aes(x=Segment, colour=CBO_code, fill=CBO_code), alpha=0.3) +
    labs(x="Segment")
print(graph)
if (save_images) {
    ggsave(
        "./document/automatic_images/LOC_NOM_CBO_by_segments_with_outlier.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## CBO without outlier
##

temp_data <- mean_data
temp_data <- temp_data[temp_data$Segment != 10, ]
aux_df <- summarySE(temp_data, measurevar="LOC_by_NOM", groupvars=c("Segment", "CBO_code"))
graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=LOC_by_NOM)) +
    geom_point(size=4, aes(colour=CBO_code)) +
    geom_smooth(aes(x=Segment, colour=CBO_code), method=lm, se=FALSE, linetype="dashed") +
    geom_smooth(aes(x=Segment, colour=CBO_code, fill=CBO_code), alpha=0.3) +
    labs(x="Segment")
print(graph)
if (save_images) {
    ggsave(
        "./document/automatic_images/LOC_NOM_CBO_by_segments_without_outlier.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## NOM / LOC
##

## aux_df <- summarySE(mean_data, measurevar="NOM_by_LOC", groupvars=c("Segment", "SRG"))
## graph <- ggplot(data=aux_df, aes(x=factor(Segment), y=NOM_by_LOC)) +
##     geom_errorbar(aes(ymin=NOM_by_LOC-se, ymax=NOM_by_LOC+se), width=1, size=1) +
##     geom_point(size=4) +
##     geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
##     labs(x="Segment")
## print(graph)
