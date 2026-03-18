# Title: Kaplan-Meier Survival Analysis
# Author: Juliana / Adriana
# Description: Evaluating survival probabilities based on N, M, Cx, and DM factors.

# --- 1. Load Dependencies ---
if (!require("pacman")) install.packages("pacman")
pacman::p_load(readxl, survival, survminer, ggplot2)

# --- 2. Data Loading ---
# Using relative paths so it works on any machine
data_path <- "data/Analises056_17.xlsx"
df <- read_excel(data_path, sheet = "dados")

# --- 3. Analysis Function ---
# A reusable function to generate plots and statistical tests
run_km_analysis <- function(variable, labels, title_suffix) {
  
  # Create the survival formula
  formula_str <- as.formula(paste("Surv(Tempo_DiagFinal, DiagFinal) ~", variable))
  
  # Fit the KM model
  fit <- survfit(formula_str, data = df)
  
  # Create the plot
  plot <- ggsurvplot(
    fit, 
    data = df,
    palette = "Set1",              # Professional color palette
    xlab = "Follow-up Time",
    ylab = "Probability of No Alteration",
    title = paste("Survival Analysis by", title_suffix),
    legend.labs = labels,
    risk.table = TRUE,             # Adds the "At Risk" table below the plot
    pval = TRUE,                   # Adds Log-Rank test p-value
    conf.int = FALSE,              # Set to TRUE if you want shaded error margins
    ggtheme = theme_bw()
  )
  
  return(plot)
}

# --- 4. Running the Analyses ---

# Analysis for N-Stage
km_n <- run_km_analysis("N", c("N0", "N1", "N2", "N3"), "N-Stage")
print(km_n)

# Analysis for Surgery (Cx)
km_cx <- run_km_analysis("Cx", c("No", "Yes"), "Surgery Intervention")
print(km_cx)

# --- 5. Exporting Results ---
# dev.off() # Clear device if needed
# ggsave("output/km_surgery.png", km_cx$plot, width = 8, height = 6)
