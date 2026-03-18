# Kaplan-Meier Survival Analysis Project

This repository contains an R-based statistical analysis using the **Kaplan-Meier estimator** to evaluate clinical outcomes across different patient groups.

## 📊 Objective
The goal is to determine if variables such as nodal stage (N), metastasis (M), surgery (Cx), and diabetes (DM) significantly influence the "Time to Alteration" (Tempo_DiagFinal).

## 🗂️ Variables Evaluated
- **N**: Nodal involvement (Categorical: 0, 1, 2, 3).
- **M**: Distant metastasis (Binary).
- **Cx**: Surgical intervention (Yes/No).
- **DM**: History of Diabetes Mellitus (Yes/No).

## 🛠️ Requirements
This project requires **R (version 4.0 or higher)** and the following libraries:
- `survival`: For core statistical calculations.
- `survminer`: For high-quality visualization and risk tables.
- `readxl`: To handle Excel data input.

## 🚀 How to Run
1. **Clone the repo**:
   ```bash
   git clone [https://github.com/your-username/survival-analysis-km.git](https://github.com/your-username/survival-analysis-km.git)
