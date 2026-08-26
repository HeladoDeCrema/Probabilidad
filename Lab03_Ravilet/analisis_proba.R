# Laboratorio 3 - Probabilidad y Estadística Computacional
# Repositorio GitHub:
# https://github.com/HeladoDeCrema/Probabilidad






set.seed(123)

n <- 5000

devops_metrics <- data.frame(
  build_time_min = round(rnorm(n, mean = 12, sd = 4), 2),
  deploy_time_min = round(rnorm(n, mean = 8, sd = 2.5), 2),
  
  commit_size_loc = rpois(n, lambda = 120),
  
  num_bugs = rpois(n, lambda = 2),
  
  test_coverage_pct = round(
    pmin(pmax(rnorm(n, mean = 78, sd = 12), 0), 100),
    2
  ),
  
  ticket_resolution_h = round(
    rgamma(n, shape = 2.5, scale = 5),
    2
  ),
  
  team = sample(
    c("Alpha", "Beta", "Gamma", "Delta"),
    n,
    replace = TRUE
  ),
  
  module = sample(
    c("auth", "api", "ui", "database", "payments"),
    n,
    replace = TRUE
  ),
  
  priority = sample(
    c("baja", "media", "alta", "crítica"),
    n,
    replace = TRUE,
    prob = c(0.25, 0.40, 0.25, 0.10)
  ),
  
  deploy_status = sample(
    c("success", "failed", "rolled_back"),
    n,
    replace = TRUE,
    prob = c(0.82, 0.12, 0.06)
  )
)

# Evitar tiempos negativos
devops_metrics$build_time_min[
  devops_metrics$build_time_min < 0
] <- 0.5

devops_metrics$deploy_time_min[
  devops_metrics$deploy_time_min < 0
] <- 0.5

# Guardar archivo CSV
write.csv(
  devops_metrics,
  "devops_metrics.csv",
  row.names = FALSE
)

# Revisar la base generada
head(devops_metrics)

summary(devops_metrics)

dim(devops_metrics)