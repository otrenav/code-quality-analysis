
| [Website](http://links.otrenav.com/website) | [Twitter](http://links.otrenav.com/twitter) | [LinkedIn](http://links.otrenav.com/linkedin)  | [GitHub](http://links.otrenav.com/github) | [GitLab](http://links.otrenav.com/gitlab) | [CodeMentor](http://links.otrenav.com/codementor) |

---

# Statistical Analysis of Code Quality

- Omar Trejo
- August, 2016

Statistical Analysis of Java source code quality metrics to understand the
relation between code quality and project sustainability, where project
sustainability is defined as software that can be reused in future projects.

In this analysis we are trying to find out if good coding practices will lead to
more sustainable software. It has been proposed that sustainability should be
considered a requirement for projects.

## Objective

- Find a relation between code quality and project lifespan
    - If it exists, explain it and its characteristics
    - If it does not exist, explain why it does not

## Deliverables

- Report of the analysis with explanations
- Reproducible code used to get the results

## Data

Data used for the analysis comes from GitHub repositories. The selection
included programming language used and start dates. Java repositories with a
start date between January 1st and December 31st of 2009 were selected.

#### NOTES

- Had to remove observations with `null` values
- Had to remove extra metrics "LCOM" and "NOC" from a couple of files
- Deleted less than 20 observations in total

### Data files

After following the mentioned procedure, the result was:

- 19 spreadsheet
- 7 projects in each spreadsheet
- 1 project in each speadsheet sheet

## Analysis

### The metrics

- Lines of Code (LOC)
- Number of Local Methods (NOM)
- Depth of Inheritance Tree (DIT)
- Coupling Between Objects (CBO)
- Improvement of Lack of Cohesion in Methods (ILCOM)
- Lack of Documentation (LOD)

#### References

- http://www.arisa.se/compendium/
- http://support.objecteering.com/objecteering6.1/help/us/metrics/toc.htm

### Descriptive analysis

- Descriptive analysis of each metric vs "S"

### Statistical analysis

- Multiple Linear Regressions
- Correlation between metrics and segments

---

> "The best ideas are common property."
>
> —Seneca
