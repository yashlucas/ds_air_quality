# Air Quality FAIR Data Science Experiment


[![DOI](https://zenodo.org/badge/1084013384.svg)](https://doi.org/10.5281/zenodo.20297891)

Predicting air quality classes (Good, Moderate, Poor) using environmental and pollutant measurements from Gijón, Spain.

This project implements a FAIR data science workflow for air quality prediction using machine learning, metadata standards, semantic mappings, and reproducible computational notebooks. The repository integrates DBRepo workflows, RO-Crate metadata, FAIR4ML metadata, Croissant dataset metadata, CodeMeta software metadata, and structured model documentation. The project demonstrates reproducible and interoperable machine learning experimentation using environmental monitoring datasets and Random Forest classification models.

---

# Version

## v3.0

- Structured FAIR repository organization
- Complete machine learning workflow implementation
- DBRepo normalized schema integration
- DBRepo REST API-based experiment workflow
- Semantic ontology mappings
- Unit ontology mappings
- FAIR metadata integration:
  - RO-Crate
  - CodeMeta
  - FAIR4ML
  - Croissant
  - Model Card
- Explicit licence separation for:
  - datasets
  - software
  - produced outputs
- Reproducibility and stewardship documentation

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
├── croissant.json
├── codemeta.json
├── ro-crate-metadata.json
├── requirements.txt
├── CITATION.cff
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
  Stores SQL definitions, ER diagrams, model documentation, validation outputs, and stewardship documentation.
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
├── src_dbrepo_views_v1.ipynb
├── src_semantic_mapping_v1.ipynb
└── src_mapping_units_of_measurement_v1.ipynb

models/
├── model_randomforest_v1.pkl
├── model_randomforest_api_v1.pkl
└── fair4ml-randomforest-v1.json

outputs/
├── outp_confusion_matrix_v1.png
├── outp_model_comparison_v1.png
├── outp_pm25_histogram_v1.png
├── outp_confusion_matrix_api_v1.png
├── outp_model_comparison_api_v1.png
└── outp_pm25_histogram_api_v1.png

docs/
├── schema.sql
├── standards-overlap-analysis.md
├── views.sql
├── er_diagram_air_quality_v1.png
├── model-card.md
└── validation/
    └── ro-crate-validation.txt

configs/

croissant.json
CITATION.cff
codemeta.json
ro-crate-metadata.json
requirements.txt
README.md
LICENSE
```

---


# FAIR Metadata Standards

The repository integrates multiple FAIR metadata standards to improve interoperability, discoverability, provenance tracking, and reproducibility
| Standard | File |
|---|---|
| RO-Crate | `ro-crate-metadata.json` |
| Standards Overlap Analysis | `docs/standards-overlap-analysis.md`|
| CodeMeta | `codemeta.json` |
| FAIR4ML | `models/fair4ml-randomforest-v1.json` |
| Croissant | `croissant.json` |
| Model Card | `docs/model-card.md` |

RO-Crate validation output is available in:

```text
docs/validation/ro-crate-validation.txt
```

# DBRepo Stewardship Notebooks

- `src_dbrepo_setup_v1.ipynb`
  Creates the normalized DBRepo schema and uploads the datasets.

- `src_dbrepo_views_v1.ipynb`
  Creates and validates analytical and ML-ready DBRepo views.

- `src_air_quality_api_experiment_v1.ipynb`
  Reimplements the experiment workflow entirely through DBRepo REST API retrieval.

- `src_semantic_mapping_v1.ipynb`
  - Maps DBRepo table columns to semantic concepts and unit URIs using registered ontologies such as OM2 and DBpedia, uploads the mappings via the DBRepo REST API, and verifies the resulting FAIR metadata.

- `src_mapping_units_of_measurement`
  - Maps numeric DBRepo attributes to ontology-based measurement unit concepts using OM2 unit URIs, uploads the unit mappings through the DBRepo REST API, and verifies the resulting FAIR unit metadata.

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

## Metadata files

```text
ro-crate-metadata.json
codemeta.json
croissant.json
fair4ml-<model>-v<version>.json
```

## Documentation files

```text
model-card.md
README.md
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
- licensing metadata,
- semantic ontology mappings,
- unit ontology mappings,
- SQL view definitions,
- provenance metadata,
- FAIR metadata artefacts,
- reproducibility documentation.

The repository additionally integrates FAIR metadata standards including RO-Crate, CodeMeta, FAIR4ML, Croissant, and Model Cards to support interoperability, discoverability, provenance tracking, and reproducibility.

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

FAIR4ML metadata describing the trained Random Forest model is stored in:

```text
models/fair4ml-randomforest-v1.json
```

The model card documentation is stored in:

```text
docs/model-card.md
```

These models can be reused for predictions and downstream applications.

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

# Repository Updates

This repository documents the final FAIR data science workflow developed for the project and integrates reproducible machine learning experimentation, DBRepo stewardship workflows, semantic interoperability mappings, and multiple FAIR metadata standards.

The repository currently includes:

- FAIR metadata integration through RO-Crate, CodeMeta, FAIR4ML, Croissant, and Model Cards,
- DOI-linked archival deposits for software, models, and generated outputs,
- reproducible DBRepo REST API-based workflows,
- semantic ontology mappings for environmental variables and measurement units,
- structured provenance and stewardship documentation,
- machine learning evaluation outputs and trained models,
- interoperability-focused metadata records and FAIR documentation.


# Model Deposit DOI

The trained machine learning model artefacts are archived in the TU Wien Research Data Repository.

```text
https://doi.org/10.70124/gv54r-hph13
```
# Generated Output Data Deposit DOI

The generated datasets, processed outputs, classification results, and evaluation figures are archived in the TU Wien Research Data Repository.

```text
https://doi.org/10.70124/3rp20-vpc28
```
# Future Work

- Develop frontend applications using Streamlit or Flask
- Implement real-time prediction workflows
- Extend temporal aggregation pipelines
- Add metadata lineage tracking
- Improve semantic interoperability mappings

---

# Authors

# Contributors

| Contributor | ORCID |
|---|---|
| Sneha Chattopadhyay | https://orcid.org/0009-0000-1849-5804 |
| Anukriti Sharma | https://orcid.org/0009-0001-2969-8567 |
| Yash Lucas | https://orcid.org/0009-0000-3575-9517 |
| Bikramjit Chowdhury | https://orcid.org/0009-0004-0869-709X |

# Licences

### Input Dataset Licence

The input air quality dataset used in this project is distributed under the Creative Commons Attribution 4.0 International (CC BY 4.0) licence.

https://creativecommons.org/licenses/by/4.0/

This licence permits sharing and adaptation of the dataset provided that appropriate attribution is given to the original data source. The project workflow, processed datasets, and metadata records were developed in accordance with the attribution requirements of the source dataset licence.

### Software and Code Licence

The software components of this repository, including Python notebooks, scripts, SQL files, metadata artefacts, and workflow documentation, are distributed under the MIT License.

The MIT License was selected because it is a widely used permissive open-source software licence that supports reuse, modification, distribution, and reproducibility. The licence is compatible with the CC BY 4.0 dataset licence because it applies specifically to the software implementation rather than to the original input dataset itself.

The full licence text is available in the repository root:

`LICENSE`

### Produced Data and Model Licence

The produced artefacts generated during the experiment, including trained machine learning models, generated figures, evaluation outputs, and metadata records, are distributed under the Creative Commons Attribution 4.0 International (CC BY 4.0) licence.

This licence allows reuse and redistribution of generated outputs provided that attribution is given to the project authors. The selected licence is compatible with the attribution obligations associated with the source dataset licence and supports FAIR and open-science reuse practices.

---
