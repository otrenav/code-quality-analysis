##
## Software quality and sustainability — Descriptive Analysis with Aggregated Data
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

##
## All data
##

## Number of observations
print(nrow(mean_data))

## Frequency
graph <- ggplot(mean_data, aes(x=Segment)) +
    geom_bar(colour=dark_color) +
    stat_bin(
        aes(y=..count.., label=..count..),
        geom="text",
        size=3,
        vjust=-1,
        binwidth=1
    ) +
    scale_x_continuous(breaks=1:19) +
    labs(x="Segment", y="Count")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_all_data_frequencies.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## Correlations
##
ggcorr(
    mean_data[, c("Segment", "S", "CBO", "DIT", "ILCOM", "LOC", "LOD", "NOM")],
    low=primary_color,
    mid="#EEEEEE",
    high=secondary_color,
    label=TRUE
)
if (save_images) {
    ggsave(
        "./document/images/aggregated_correlations.png",
        width=square_width,
        height=square_height,
        units="cm"
    )
}

##
## Coupling Between Objects (CBO) (Integer, Standard: [1, 4])
##

## Density
graph <- ggplot(mean_data, aes(x=CBO)) +
    geom_density(aes(y=..density..), fill=dark_color, colour=dark_color) +
    geom_vline(xintercept=1, size=0.5, linetype="longdash", colour="red") +
    geom_vline(xintercept=4, size=0.5, linetype="longdash", colour="red") +
    labs(y="Density")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_CBO_density.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## Density by groups
graph <- ggplot(mean_data, aes(x=CBO)) +
    geom_density(
        aes(
            y=..density..,
            colour=factor(SRG),
            fill=factor(SRG)
        ),
        alpha=0.2,
        size=0.7
    ) +
    geom_vline(xintercept=1, size=0.5, linetype="longdash", colour="red") +
    geom_vline(xintercept=4, size=0.5, linetype="longdash", colour="red") +
    scale_fill_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    scale_colour_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    labs(y="Density")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_CBO_density_by_groups.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## By segment
graph <- ggplot(mean_data, aes(x=factor(Segment), y=CBO)) +
    geom_point(alpha=0.1) +
    geom_boxplot(outlier.color=secondary_color, fill="black", alpha=0.1) +
    geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
    geom_hline(yintercept=1, size=0.5, linetype="longdash", colour="red") +
    geom_hline(yintercept=4, size=0.5, linetype="longdash", colour="red") +
    geom_hline(yintercept=0, size=0.5, colour="black") +
    labs(x="Segment") +
    scale_y_sqrt()

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_CBO_by_segments.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## Lines of Code (LOC) (Integer, non-linear relation ISO)
##

## Density
graph <- ggplot(mean_data, aes(x=LOC)) +
    geom_density(aes(y=..density..), fill=dark_color, colour=dark_color) +
    labs(y="Density") +
    scale_x_sqrt() +
    scale_y_sqrt()

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_LOC_density.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## Density by groups
graph <- ggplot(mean_data, aes(x=LOC)) +
    geom_density(
        aes(
            y=..density..,
            colour=factor(SRG),
            fill=factor(SRG)
        ),
        alpha=0.2,
        size=0.7
    ) +
    scale_fill_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    scale_colour_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    labs(y="Density") +
    scale_x_sqrt() +
    scale_y_sqrt()

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_LOC_density_by_groups.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## By segment
graph <- ggplot(mean_data, aes(x=factor(Segment), y=LOC)) +
    geom_point(alpha=0.1) +
    geom_boxplot(outlier.color=secondary_color, fill="black", alpha=0.1) +
    geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
    geom_hline(yintercept=0, size=0.5, colour="black") +
    labs(x="Segment") +
    scale_y_sqrt()

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_LOC_by_segments.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## Lack of Documentation (LOD) (Rational, (Unreal) Optimum: 0)
##

## Density
graph <- ggplot(mean_data, aes(x=LOD)) +
    geom_vline(xintercept=0, size=0.5, linetype="longdash", colour="red") +
    geom_density(aes(y=..density..), colour=dark_color, fill=dark_color) +
    labs(y="Density")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_LOD_density.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## Density by groups
graph <- ggplot(mean_data, aes(x=LOD)) +
    geom_density(
        aes(
            y=..density..,
            colour=factor(SRG),
            fill=factor(SRG)
        ),
        alpha=0.2,
        size=0.7
    ) +
    geom_vline(xintercept=0, size=0.5, linetype="longdash", colour="red") +
    scale_fill_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    scale_colour_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    labs(y="Density")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_LOD_density_by_groups.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## By segment
graph <- ggplot(mean_data, aes(x=factor(Segment), y=LOD)) +
    geom_point(alpha=0.1) +
    geom_boxplot(outlier.color=secondary_color, fill="black", alpha=0.1) +
    geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
    geom_hline(yintercept=0, size=0.5, linetype="longdash", colour="red") +
    labs(x="Segment") +
    scale_y_sqrt()

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_LOD_by_segments.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## Number of Methods (NOM) (Integer, Standard: [3, 7])
##

## Density
graph <- ggplot(mean_data, aes(x=NOM)) +
    geom_density(aes(y=..density..), colour=dark_color, fill=dark_color) +
    geom_vline(xintercept=3, size=0.5, linetype="longdash", colour="red") +
    geom_vline(xintercept=7, size=0.5, linetype="longdash", colour="red") +
    labs(y="Density")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_NOM_density.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## Density by groups
graph <- ggplot(mean_data, aes(x=NOM)) +
    geom_density(
        aes(
            y=..density..,
            colour=factor(SRG),
            fill=factor(SRG)
        ),
        alpha=0.2,
        size=0.7
    ) +
    scale_fill_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    scale_colour_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    geom_vline(xintercept=3, size=0.5, linetype="longdash", colour="red") +
    geom_vline(xintercept=7, size=0.5, linetype="longdash", colour="red") +
    labs(y="Density")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_NOM_density_by_groups.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## By segment
graph <- ggplot(mean_data, aes(x=factor(Segment), y=NOM)) +
    geom_point(alpha=0.1) +
    geom_boxplot(outlier.color=secondary_color, fill="black", alpha=0.1) +
    geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
    geom_hline(yintercept=0, size=0.5, colour="black") +
    geom_hline(yintercept=3, size=0.5, linetype="longdash", colour="red") +
    geom_hline(yintercept=7, size=0.5, linetype="longdash", colour="red") +
    labs(x="Segment") +
    scale_y_sqrt()

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_NOM_by_segments.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## Depth of Inheritance (DIT) (Integer, Standard: [0, 4])
##

## Density
graph <- ggplot(mean_data, aes(x=DIT)) +
    geom_density(aes(y=..density..), colour=dark_color, fill=dark_color) +
    geom_vline(xintercept=0, size=0.5, linetype="longdash", colour="red") +
    geom_vline(xintercept=4, size=0.5, linetype="longdash", colour="red") +
    scale_x_sqrt()

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_DIT_density.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## Density by groups
graph <- ggplot(mean_data, aes(x=DIT)) +
    geom_density(
        aes(
            y=..density..,
            colour=factor(SRG),
            fill=factor(SRG)
        ),
        alpha=0.2,
        size=0.7
    ) +
    scale_fill_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    scale_colour_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    geom_vline(xintercept=0, size=0.5, linetype="longdash", colour="red") +
    geom_vline(xintercept=4, size=0.5, linetype="longdash", colour="red") +
    labs(y="Density") +
    scale_x_sqrt()

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_DIT_density_by_groups.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## By segment
graph <- ggplot(mean_data, aes(x=factor(Segment), y=DIT)) +
    geom_point(alpha=0.1) +
    geom_boxplot(outlier.color=secondary_color, fill="black", alpha=0.1) +
    geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
    geom_hline(yintercept=0, size=0.5, colour="black") +
    labs(x="Segment")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_DIT_by_segments.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

##
## Improvement of Lack of Cohesion in Methods (ILCOM) (Integeres)
##
## The more the better, but it depends on the number of methods in a class
## therefore it would be better to divide this metric by the NOM metric, to
## get a fraction between 0 and 1, where 1 indicates fully cohesive.
##

## Density
graph <- ggplot(mean_data, aes(x=ILCOM)) +
    geom_density(aes(y=..density..), colour=dark_color, fill=dark_color) +
    labs(y="Density")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_ILCOM_density.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## Density by groups
graph <- ggplot(mean_data, aes(x=ILCOM)) +
    geom_density(
        aes(
            y=..density..,
            colour=factor(SRG),
            fill=factor(SRG)
        ),
        alpha=0.2,
        size=0.7
    ) +
    scale_fill_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    scale_colour_discrete(
        name="Segments",
        breaks=c("1", "2", "3"),
        labels=c("1 - 6", "7 - 12", "13 - 19")
    ) +
    labs(y="Density")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_ILCOM_density_by_groups.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}

## By segment
graph <- ggplot(mean_data, aes(x=factor(Segment), y=ILCOM)) +
    geom_point(alpha=0.1) +
    geom_boxplot(outlier.color=secondary_color, fill="black", alpha=0.1) +
    geom_smooth(aes(x=Segment), method=lm, colour=primary_color) +
    geom_hline(yintercept=0, size=0.5, colour="black") +
    labs(x="Segment")

print(graph)
if (save_images) {
    ggsave(
        "./document/images/aggregated_ILCOM_by_segments.png",
        width=landscape_width,
        height=landscape_height,
        units="cm"
    )
}
