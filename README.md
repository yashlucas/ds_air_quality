# Air Quality Classification Project

Predicting the Air Quality as good, moderate and poor from Gijón, Spain.

This project focuses on analyzing air quality data and building a machine learning model to classify air quality levels based on environmental and pollutant measurements. The project follows structured data stewardship principles to ensure reproducibility, traceability, metadata management, and clarity.

---

# Version

## v1.5 (Complete till T2.5)

- Structured repository (`data`, `src`, `outputs`, `models`, `configs`, `docs`)
- Implemented full ML pipeline in notebook
- Added naming conventions (`inp_`, `outp_`, `model_`, `src_`, `config_`)
- Generated outputs and saved trained model
- Added `requirements.txt` for reproducibility
- Implemented normalized DBRepo schema
- Added SQL view definitions and DBRepo integration

---

# Objective

The goal of this project is to:

- Process raw air quality data
- Create a classification target based on PM2.5 levels
- Train machine learning models to predict air quality classes
- Organize all artifacts in a reproducible and well-documented manner
- Implement normalized database stewardship workflows using DBRepo

---

# Project Structure

```text
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
```

---

# Directory Description

- `data/`  
  Contains all input datasets used in the project, including raw and processed data.

- `src/`  
  Contains source code such as Jupyter notebooks and Python scripts used for preprocessing, training, evaluation, and DBRepo stewardship workflows.

- `outputs/`  
  Stores generated outputs such as plots, figures, and evaluation results.

- `models/`  
  Stores trained machine learning models for reuse and deployment.

- `configs/`  
  Contains configuration files (e.g., YAML or JSON) for experiment and pipeline settings.

- `docs/`  
  Contains documentation, SQL definitions, and supporting materials.

---

# File Organisation

```text
data/
├── inp_air_quality_raw_v1.csv
└── inp_air_quality_processed_v1.csv

src/
├── src_air_quality_experiment.ipynb
├── src_dbrepo_setup_v1.ipynb
└── src_dbrepo_views_v1.ipynb

models/
└── model_randomforest_v1.pkl

outputs/
├── outp_confusion_matrix_v1.png
├── outp_model_comparison_v1.png
└── outp_pm25_histogram_v1.png

docs/
├── schema.sql
├── views.sql
└── er_diagram_air_quality_v1.png
```

---

# DBRepo Stewardship Notebooks

- `src_dbrepo_setup_v1.ipynb`
  - Creates normalized DBRepo schema and database structures.

- `src_dbrepo_views_v1.ipynb`
  - Creates and validates ML-ready database views in DBRepo.

---

# Naming Convention

To ensure consistency, traceability, and reproducibility, the following naming rules are applied:

## Input datasets

```text
inp_<description>_v<version>.csv
```

## Output files

```text
outp_<type>_<description>_v<version>.<ext>
```

## Model files

```text
model_<algorithm>_v<version>.pkl
```

## Scripts and notebooks

```text
src_<description>.py
src_<description>.ipynb
```

## Configuration files

```text
config_<purpose>.yaml
config_<purpose>.json
```

---

# Setup Instructions

## 1. Clone the repository

```bash
git clone <repository_link>
cd ds_air_quality
```

## 2. Create a virtual environment (recommended)

```bash
python3 -m venv venv
source venv/bin/activate
```

## 3. Install dependencies

```bash
pip install -r requirements.txt
```

---

# How to Run

Navigate to the source directory and start Jupyter Notebook:

```bash
cd src
jupyter notebook
```

Open and run:

```text
src_air_quality_experiment.ipynb
```

---

# Machine Learning Pipeline

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

# Target Variable

The target variable `Air_Quality_Class` is derived from PM2.5 values:

- PM2.5 < 20 → Good
- 20 ≤ PM2.5 < 50 → Moderate
- PM2.5 ≥ 50 → Poor

---

# Data Stewardship Considerations

## Data Leakage Prevention

PM2.5 is excluded from model features since it is directly used to derive the target variable.
- Persistent identifiers (DOIs) were created through DBRepo to support FAIR data stewardship principles.

## Reproducibility

The project uses:
- fixed random states,
- versioned datasets,
- pinned Python dependencies,
- structured repository organization.

## Traceability

Clear naming conventions and structured directories are used to distinguish between:
- inputs,
- outputs,
- models,
- SQL definitions,
- stewardship notebooks.

## Metadata and Documentation

The project documents:
- schema definitions,
- SQL view definitions,
- stewardship workflows,
- normalized database structures.

---

# Database and DBRepo Integration

The project implements a normalized relational schema in DBRepo to support reproducible data stewardship workflows and analytical processing.

## Persistent Identifier (DOI)

The DBRepo database was assigned a persistent DOI identifier for reproducibility and stewardship purposes.

```text
DOI: 10.82556/0h29-hr36
```

### Metadata Registered

The identifier includes:
- dataset title,
- creator information,
- abstract description,
- publication year,
- licensing metadata.

### License

The dataset metadata was registered under:

```text
CC-BY-4.0
```

License URL:
https://creativecommons.org/licenses/by/4.0/

## Implemented Tables

- `t_station`
  - Stores monitoring station metadata including station identifiers and geographic coordinates.

- `t_time`
  - Stores temporal attributes including date and hourly measurements.

- `t_measurement`
  - Stores pollutant and meteorological measurements linked to stations and timestamps through foreign-key style identifiers.

## Data Normalization

The original raw dataset was transformed into a normalized schema consisting of:
- station dimension table,
- time dimension table,
- measurement fact table.

This normalization improves:
- data consistency,
- storage efficiency,
- analytical flexibility,
- reproducibility of downstream ML workflows.

## DBRepo Integration

The project integrates with DBRepo using the Python API for:
- database management,
- schema creation,
- metadata management,
- table ingestion,
- view creation,
- stewardship documentation.

All datasets were validated and uploaded into DBRepo after preprocessing and missing-value handling.

---

# SQL Views

SQL view definitions are provided in:

```text
docs/views.sql
```

These views expose denormalized and query-ready structures for downstream machine learning and analytical workflows.

## Implemented DBRepo Views

### `vw_air_quality_features`

A denormalized ML-ready feature table containing:
- pollutant measurements,
- meteorological variables,
- station identifiers,
- temporal identifiers.

### `vw_daily_pollution_summary`

A pollution monitoring view supporting:
- temporal trend analysis,
- forecasting workflows,
- time-oriented analytical exploration.

### `vw_station_pollution_summary`

A station-oriented analytical view supporting:
- spatial comparison,
- hotspot identification,
- monitoring station analysis.

All views were successfully created and validated in DBRepo after ingestion of normalized datasets.
---

# Outputs

The project generates:

- Confusion matrix visualization
- Model comparison plot
- PM2.5 distribution histogram

All outputs are stored in the `outputs/` directory.

---

# Model

The trained Random Forest model is stored at:

```text
models/model_randomforest_v1.pkl
```

This model can be reused for predictions or integrated into future applications.

---

# Reproducibility

The repository follows reproducible data science and stewardship practices through:

- versioned datasets,
- deterministic preprocessing,
- structured repository organization,
- normalized database schema design,
- documented SQL view definitions,
- tracked model artifacts,
- pinned Python dependencies.

---

# Repository Updates

This repository will be continuously updated throughout the project lifecycle, including:
- reimplementation of experiments,
- metadata improvements,
- stewardship extensions,
- model refinements,
- documentation updates.

---

# Future Work

- Develop a frontend application (e.g., Streamlit or Flask)
- Implement real-time prediction capabilities
- Extend DBRepo analytical views with temporal aggregation pipelines
- Add automated metadata validation and lineage tracking

---

# Authors

Group members (A–D):

- A: Chattopadhyay, Sneha, 12450741
- B: Sharma, Anurkti, 12433727
- C: Lucas, Yash, 12433688
- D: Chowdhury, Bikramjit, 12434671

---

# License

This project is licensed under the terms specified in the LICENSE file.
