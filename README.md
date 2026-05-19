# Air Quality Classification Project

Predicting air quality classes (Good, Moderate, Poor) using environmental and pollutant measurements from Gijón, Spain.

This project focuses on analyzing air quality data and building machine learning models to classify air quality levels based on environmental and pollutant measurements. The project follows structured data stewardship principles to ensure reproducibility, traceability, metadata management, FAIR compliance, and clarity.

---

# Version

## v1.6 (Complete till T2.6)

- Structured repository (`data`, `src`, `outputs`, `models`, `configs`, `docs`)
- Implemented complete ML workflow
- Added naming conventions (`inp_`, `outp_`, `model_`, `src_`, `config_`)
- Generated visual outputs and trained models
- Added reproducibility support through `requirements.txt`
- Implemented normalized DBRepo schema in 3NF
- Added SQL view definitions and DBRepo integration
- Implemented DBRepo REST API reimplementation workflow
- Added API-only experiment notebook (`src_air_quality_api_experiment_v1.ipynb`)
- Removed dependency on local CSV loading in API workflow
- Added robust API retrieval and error handling
- Reconstructed normalized joins through pandas merges after API retrieval

---

# Objective

The goal of this project is to:

- Process raw air quality data
- Create a classification target based on PM2.5 levels
- Train machine learning models to predict air quality classes
- Organize all artifacts in a reproducible and well-documented manner
- Implement normalized database stewardship workflows using DBRepo
- Reimplement the experiment pipeline using the DBRepo REST API

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
  Contains all input datasets used in the project, including raw and processed datasets.

- `src/`
  Contains Jupyter notebooks and source code for preprocessing, machine learning, DBRepo stewardship, and API-based experimentation workflows.

- `outputs/`
  Stores generated figures, evaluation plots, and analytical outputs.

- `models/`
  Stores trained machine learning models.

- `configs/`
  Stores configuration files for reproducibility and experimentation.

- `docs/`
  Stores SQL definitions, ER diagrams, and additional stewardship documentation.

---

# File Organisation

```text
data/
├── inp_air_quality_raw_v1.csv
└── inp_air_quality_processed_v1.csv

src/
├── src_air_quality_experiment.ipynb
├── src_air_quality_api_experiment_v1.ipynb
├── src_dbrepo_setup_v1.ipynb
├──  src_dbrepo_views_v1.ipynb
├──  src_semantic_mapping_v1.ipynb

models/
├── model_randomforest_v1.pkl
└── model_randomforest_api_v1.pkl

outputs/
├── outp_confusion_matrix_v1.png
├── outp_model_comparison_v1.png
├── outp_pm25_histogram_v1.png
├── outp_confusion_matrix_api_v1.png
├── outp_model_comparison_api_v1.png
└── outp_pm25_histogram_api_v1.png

docs/
├── schema.sql
├── views.sql
└── er_diagram_air_quality_v1.png
```

---

# DBRepo Stewardship Notebooks

- `src_dbrepo_setup_v1.ipynb`
  Creates the normalized DBRepo schema and uploads the datasets.

- `src_dbrepo_views_v1.ipynb`
  Creates and validates analytical and ML-ready DBRepo views.

- `src_air_quality_api_experiment_v1.ipynb`
  Reimplements the experiment workflow entirely through DBRepo REST API retrieval.

- `src_semantic_mapping_v1.ipynb`
  Maps DBRepo table columns to semantic concepts and unit URIs using registered ontologies such as OM2 and DBpedia, uploads the mappings via the DBRepo REST API, and verifies the resulting FAIR metadata.

- `src_mapping_units_of_measurement`
  Maps numeric DBRepo attributes to ontology-based measurement unit concepts using OM2 unit URIs, uploads the unit mappings through the DBRepo REST API, and verifies the resulting FAIR unit metadata.

---

# Naming Convention

To ensure consistency, traceability, and reproducibility, the following naming conventions are applied.

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

## 2. Create a virtual environment

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

Navigate to the source directory and launch Jupyter Notebook.

```bash
cd src
jupyter notebook
```

## Original Local-File Workflow

Run:

```text
src_air_quality_experiment.ipynb
```

## DBRepo API-Based Workflow

Run:

```text
src_air_quality_api_experiment_v1.ipynb
```

---

# Machine Learning Pipeline

The workflow includes:

- Data loading and preprocessing
- Data normalization and stewardship integration
- Target variable creation based on PM2.5
- Feature engineering and cleaning
- Train-validation-test split
- Feature scaling
- Model training
- Model evaluation and comparison
- Visualization generation
- Model persistence and reproducibility

Implemented machine learning models:

- Logistic Regression
- Decision Tree
- Random Forest

---

# Target Variable

The target variable `Air_Quality_Class` is derived from PM2.5 values.

| PM2.5 Range | Class |
|---|---|
| PM2.5 < 20 | Good |
| 20 ≤ PM2.5 < 50 | Moderate |
| PM2.5 ≥ 50 | Poor |

---

# Data Stewardship Considerations

## Data Leakage Prevention

PM2.5 is excluded from model features because it directly determines the target variable.

## Reproducibility

The project supports reproducibility through:

- fixed random states,
- versioned datasets,
- pinned dependencies,
- structured repository organization,
- DBRepo integration,
- API-based data retrieval.

## Traceability

The repository uses clear separation between:

- raw inputs,
- processed datasets,
- models,
- SQL definitions,
- stewardship notebooks,
- outputs,
- API-based workflows.

## Metadata and FAIR Stewardship

The project integrates metadata management through DBRepo, including:

- persistent identifiers,
- licensing metadata,
- dataset descriptions,
- normalized schema documentation.

---

# Database and DBRepo Integration

The project implements a normalized relational database schema in DBRepo to support reproducible data stewardship and analytical processing.

## Persistent Identifier (DOI)

The DBRepo database was assigned a persistent DOI:

```text
10.82556/0h29-hr36
```

## Metadata Registered

The registered metadata includes:

- dataset title,
- creator information,
- abstract description,
- publication year,
- licensing metadata.

## License

The dataset metadata was registered under:

```text
CC-BY-4.0
```

License URL:

```text
https://creativecommons.org/licenses/by/4.0/
```

---

# Implemented Tables

## `t_station`

Stores station metadata including:

- station identifiers,
- station names,
- latitude,
- longitude.

## `t_time`

Stores temporal metadata including:

- dates,
- hourly timestamps.

## `t_measurement`

Stores pollutant and meteorological measurements linked to station and time identifiers.

---

# Data Normalization

The raw dataset was transformed into a normalized schema consisting of:

- station dimension table,
- time dimension table,
- measurement fact table.

The schema follows Third Normal Form (3NF) principles.

Normalization improves:

- consistency,
- storage efficiency,
- analytical flexibility,
- stewardship quality,
- reproducibility.

---

# DBRepo Integration

The project integrates with DBRepo through the Python REST API for:

- database creation,
- schema creation,
- metadata registration,
- persistent identifier management,
- table ingestion,
- analytical view creation,
- stewardship documentation.

All datasets were validated before ingestion.

---

# SQL Views

SQL definitions are stored in:

```text
docs/views.sql
```

Implemented analytical views include:

## `vw_air_quality_features`

ML-ready feature view exposing pollutant and meteorological measurements.

## `vw_daily_pollution_summary`

Daily pollution aggregation supporting:

- trend analysis,
- temporal exploration,
- forecasting workflows.

## `vw_station_pollution_summary`

Station-level analytical aggregation supporting:

- hotspot analysis,
- spatial comparison,
- monitoring station evaluation.

All views were validated successfully after ingestion.

---

# DBRepo API Reimplementation (T2.6)

The experiment workflow was reimplemented to retrieve datasets exclusively through the DBRepo REST API instead of local CSV files.

## API-Based Experiment Notebook

```text
src/src_air_quality_api_experiment_v1.ipynb
```

## API Base URL

```text
https://test.dbrepo.tuwien.ac.at
```

## API Retrieval Workflow

The API-based workflow retrieves:

- `vw_air_quality_features`
- `t_station`
- `t_time`

through the DBRepo Python REST client.

The normalized datasets are reconstructed into a denormalized ML-ready dataframe using pandas merge operations after API retrieval.

## Authentication

Authentication is performed using DBRepo username/password credentials loaded through environment variables.

## Error Handling

The implementation includes:

- retry logic,
- connection failure handling,
- metadata validation,
- API exception handling.

## Important Technical Note

DBRepo Python client version `1.13.4` exhibited instability during multi-table `QueryDefinition` join operations.

To ensure stability and reproducibility:

- datasets were retrieved independently through the REST API,
- joins were reconstructed through pandas merge operations.

All data access remains fully API-driven and compliant with T2.6 requirements.

## Result Reproducibility

The API-based implementation reproduces the same analytical workflow as the original local-file experiment while removing dependency on local CSV ingestion.

---

# Outputs

The project generates:

- confusion matrix visualizations,
- model comparison plots,
- PM2.5 distribution histograms.

Outputs are stored in the `outputs/` directory.

Additional API-based outputs are generated through the DBRepo REST API workflow.

---

# Models

Stored trained models include:

```text
models/model_randomforest_v1.pkl
models/model_randomforest_api_v1.pkl
```

These models can be reused for predictions and downstream applications.

---

# Reproducibility

The repository follows reproducible data science and stewardship practices through:

- deterministic preprocessing,
- normalized schema design,
- API-based retrieval,
- documented SQL definitions,
- tracked model artifacts,
- metadata management,
- pinned dependencies.

---

# Repository Updates

This repository will continue evolving through:

- metadata extensions,
- stewardship improvements,
- model refinements,
- analytical view extensions,
- API workflow enhancements.

---

# Future Work

- Develop frontend applications using Streamlit or Flask
- Implement real-time prediction workflows
- Extend temporal aggregation pipelines
- Add metadata lineage tracking
- Improve semantic interoperability mappings

---

# Authors

Group Members (A–D):

- A: Chattopadhyay, Sneha, 12450741
- B: Sharma, Anurkti, 12433727
- C: Lucas, Yash, 12433688
- D: Chowdhury, Bikramjit, 12434671

---

# License

This project is licensed under the terms specified in the LICENSE file.
