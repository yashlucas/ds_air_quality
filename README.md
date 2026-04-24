# Air Quality Classification Project

Predicting the Air Quality as good, moderate and poor from Gijón, Spain.

This project focuses on analyzing air quality data and building a machine learning model to classify air quality levels based on environmental and pollutant measurements. The project follows structured data stewardship principles to ensure reproducibility, traceability, and clarity.

---

## Version

### v1.0 (Initial Release)
- Structured repository (data, src, outputs, models, configs, docs)
- Implemented full ML pipeline in notebook
- Added naming conventions (inp_, outp_, model_, src_, config_)
- Generated outputs and saved trained model
- Added requirements.txt for reproducibility

---

## Objective

The goal of this project is to:
- Process raw air quality data
- Create a classification target based on PM2.5 levels
- Train machine learning models to predict air quality classes
- Organize all artifacts in a reproducible and well-documented manner

---

## Project Structure

ds_air_quality/
│
├── data/
├── src/
├── outputs/
├── models/
├── configs/
├── docs/
├── requirements.txt
├── README.md
└── LICENSE

---

## Directory Description

- data/  
  Contains all input datasets used in the project, including raw and processed data.

- src/  
  Contains source code such as Jupyter notebooks and Python scripts used for preprocessing, training, and evaluation.

- outputs/  
  Stores generated outputs such as plots, figures, and evaluation results.

- models/  
  Stores trained machine learning models for reuse and deployment.

- configs/  
  Contains configuration files (e.g., YAML or JSON) for experiment and pipeline settings.

- docs/  
  Contains additional documentation such as reports and supporting materials.

---

## File Organisation

data/
├── inp_air_quality_raw_v1.csv
└── inp_air_quality_processed_v1.csv

src/
└── src_air_quality_experiment.ipynb

models/
└── model_randomforest_v1.pkl

outputs/
├── outp_confusion_matrix_v1.png
├── outp_model_comparison_v1.png
└── outp_pm25_histogram_v1.png

---

### Naming Convention

To ensure consistency, traceability, and reproducibility, the following naming rules are applied:

Input datasets:  
inp_<description>_v<version>.csv  

Output files:  
outp_<type>_<description>_v<version>.<ext>  

Model files:  
model_<algorithm>_v<version>.pkl  

Scripts:  
src_<description>.py / .ipynb  

Configuration files:  
config_<purpose>.yaml / .json  

---

## Setup Instructions

1. Clone the repository:
   git clone <repository_link>  
   cd ds_air_quality  

2. Create a virtual environment (recommended):
   python3 -m venv venv  
   source venv/bin/activate  

3. Install dependencies:
   pip install -r requirements.txt  

---

## How to Run

Navigate to the source directory and start Jupyter Notebook:

cd src  
jupyter notebook  

Open and run:  
src_air_quality_experiment.ipynb  

---

## Machine Learning Pipeline

The workflow includes:
- Data loading and preprocessing
- Column renaming and standardization
- Target variable creation based on PM2.5
- Feature selection and cleaning
- Train-validation-test split
- Feature scaling
- Model training (Logistic Regression, Decision Tree, Random Forest)
- Model evaluation and comparison
- Model saving

---

## Target Variable

The target variable `Air_Quality_Class` is derived from PM2.5 values:

- PM2.5 < 20 → Good  
- 20 ≤ PM2.5 < 50 → Moderate  
- PM2.5 ≥ 50 → Poor  

---

## Data Stewardship Considerations

- Data leakage prevention:  
  PM2.5 is excluded from model features since it is directly used to derive the target variable.

- Reproducibility:  
  The project uses fixed random states, versioned datasets, and a requirements file with pinned dependencies.

- Traceability:  
  Clear naming conventions and structured directories are used to distinguish between inputs, outputs, and models.

---

## Outputs

The project generates:
- Confusion matrix visualization
- Model comparison plot
- PM2.5 distribution histogram

All outputs are stored in the outputs/ directory.

---

## Model

The trained Random Forest model is stored at:

models/model_randomforest_v1.pkl

This model can be reused for predictions or integrated into future applications.

---

## Repository Updates

This repository will be continuously updated throughout the project lifecycle, including reimplementation of experiments, addition of metadata, and improvements to models and documentation.

---

## Future Work

- Develop a frontend application (e.g., Streamlit or Flask)
- Implement real-time prediction capabilities

---

## Authors

Group members (A–D):
- A: Chattopadhyay, Sneha, 12450741
- B: Sharma, Anurkti, 12433727
- C: Lucas, Yash, 12433688
- D: Chowdhury, Bikramjit, 12434671

---

## License

This project is licensed under the terms specified in the LICENSE file.
