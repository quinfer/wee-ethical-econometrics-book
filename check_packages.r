# List of required packages
required_packages <- c(
  'tidyverse',      # includes ggplot2, dplyr, tidyr, etc.
  'tidyquant', 
  'quantmod', 
  'PortfolioAnalytics', 
  'timetk', 
  'lubridate',
  'scales', 
  'ggthemes', 
  'kableExtra',
  'janitor', 
  'rmarkdown', 
  'knitr', 
  'bookdown', 
  'htmltools',
  'remotes',
  'shiny',
  'rugarch',
  'sandwich',
  'dlm',
  'signal',
  'dagitty',
  'caret'
)

# Set CRAN mirror
options(repos = c(CRAN = "https://cran.r-project.org"))

# Function to check and install packages
install_if_missing <- function(packages) {
  new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
  if(length(new_packages)) {
    cat("Installing missing packages:", paste(new_packages, collapse = ", "), "\n")
    install.packages(new_packages)
  } else {
    cat("All required CRAN packages are installed.\n")
  }
}

# Install missing CRAN packages
install_if_missing(required_packages)

# Try to load each package to verify installation
cat("\nVerifying package loading:\n")
for(pkg in required_packages) {
  tryCatch({
    library(pkg, character.only = TRUE)
    cat(sprintf("✓ %s loaded successfully\n", pkg))
  }, error = function(e) {
    cat(sprintf("✗ Error loading %s: %s\n", pkg, e$message))
  })
}

# Install GitHub packages
cat("\nInstalling GitHub packages:\n")
tryCatch({
  remotes::install_github("quinfer/tsfe")
  cat("✓ tsfe installed successfully from GitHub\n")
}, error = function(e) {
  cat("✗ Error installing tsfe:", e$message, "\n")
})