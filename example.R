
COHORT_VARIABLE <- "cohort"
DOMAIN_VARIABLE <- "domain"
AGE_VARIABLE <- "age"

# Simulated data
data <- data.frame(
  domain=c(1, 2, 5, 4, 3, 2, 1),
  cohort=c('A', 'C', 'B', 'A', 'B', 'A', 'C'),
  age=c(15, 20, 30, 31, 18, 20, 21)
)

# Simulated selection
input <- list()
input$cohorts <- c("B", "C", "A")
input$domains <- c(3, 1, 2)
input$age <- c(15, 31, 20)

print(data)

# USE FROM HERE TO THE BOTTOM TO REPLACE THE IF STATEMENTS IN
# YOUR CODE AND ADD THE ORDERING LINE IN YOUR AT THE BOTTOM

if (is.null(input$cohorts)) {
  cohort_selection <- unique(data[, COHORT_VARIABLE])
} else {
  cohort_selection <- input$cohorts
}
if (!is.null(input$cohorts)) {
  data <- data[data[, COHORT_VARIABLE] %in% cohort_selection, ]
  cohorts <- data.frame(
    cohort=cohort_selection,
    cohort_order=1:length(cohort_selection)
  )
  data <- merge(data, cohorts, by=COHORT_VARIABLE)
}
if (is.null(input$domains)) {
  domain_selection <- unique(data[, DOMAIN_VARIABLE])
} else {
  domain_selection <- input$domains
}
if (!is.null(input$domains)) {
  data <- data[data[, DOMAIN_VARIABLE] %in% domain_selection, ]
  domains <- data.frame(
    domain=domain_selection,
    domain_order=1:length(domain_selection)
  )
  data <- merge(data, domains, by=DOMAIN_VARIABLE)
}
if (is.null(input$age)) {
  age_selection <- unique(data[, AGE_VARIABLE])
} else {
  age_selection <- input$age
}
if (!is.null(input$age)) {
  data <- data[data[, AGE_VARIABLE] %in% age_selection, ]
  ages <- data.frame(age=age_selection, age_order=1:length(age_selection))
  data <- merge(data, ages, by=AGE_VARIABLE)
}

## print(input)
## print(data)

data <- data[
  order(data$cohort_order, data$domain_order, data$age_order),
]

# You can delete this line. It's only for you to verify it works.
print(data[, c(COHORT_VARIABLE, DOMAIN_VARIABLE, AGE_VARIABLE)])
