# pyro-thunder

**Table of Contents**

- [pyro-thunder](#pyro-thunder)
  - [Introduction](#introduction)
  - [Functional Requirements](#functional-requirements)
    - [User](#user)
    - [Developer](#developer)
  - [Architecture and Design](#architecture-and-design)
    - [Data model](#data-model)
    - [State transformation workflow](#state-transformation-workflow)
    - [Draft project structure](#draft-project-structure)
  - [Non-functional Requirements](#non-functional-requirements)
  - [External interfaces](#external-interfaces)
  - [Testing](#testing)
  - [Deployment and Maintenance](#deployment-and-maintenance)

## Introduction

`pyro-thunder` (this name is an analogy to the library formerly known as pytorch-lightning) is a python library designed to provide a flexible and easy-to-use platform for performing probabilistic inference and iterating Box's loop using probabilistic programming with pyro. Built on top of the powerful pyro family of libraries, pyro-thunder aims to simplify the process of defining probabilistic models, setting up inference engines, and evaluating the results. For a quick summary of the proposed usage workflow, skip to the [state transformation workflow](#state-transformation-workflow) section.

Box's loop is an iterative process that helps scientists and researchers refine their models and understanding of the underlying phenomena by constantly comparing model predictions to observed data. This loop is an essential component of reproducible science, as it encourages the continuous improvement of models and assumptions based on new data, analyses, and insights. By facilitating the iteration of Box's loop, pyro-thunder enables researchers to create more accurate and robust models, supporting the opportunity to achieve better scientific outcomes.

The architecture of pyro-thunder intends to loosely adhere to the principles of Domain-Driven Design (DDD), which focuses on organizing software around so-called core domain concepts and the relationships between them. This design approach is associated with several potential advantages:

* Expressiveness: By modeling the domain explicitly, the library's design intends to closely matches the mental model that researchers have of the problem domain, making it easier to understand and work with.
* Flexibility: Separating concerns into distinct modules allows for easier extension and modification of the library's functionality, enabling users to adapt it to their specific needs.
* Maintainability: The modular structure promotes a clean separation of concerns, making the codebase more manageable and less prone to errors.

pyro-thunder aims to become a powerful and flexible library for probabilistic modeling with the pyro family. It intends to streamline the process of iterating Box's loop and foster reproducible science.


## Functional Requirements

### User

1. Load Data
    - Users can load data from various sources using the DataLoader Entity.
    - Loaded data is stored in the DataRepository.

2. Define Model
    - Users can define probabilistic models using the ModelSpecification Entity.
    - Created models are stored in the ModelRepository.

3. Define Guide
    - Users can define guides (approximate posteriors) for the models using the GuideSpecification Entity.
    - Created guides are stored in the GuideRepository.

4. Set up Inference
    - Users can choose between VIEngine or MCEngine for inference, both inheriting from the InferenceEngine.
    - The chosen InferenceEngine is configured with the ModelRepository and GuideRepository.

5. Perform Inference
    - Users can execute the chosen InferenceEngine.
    - The InferenceResult Value Object stores the results of the inference.

6. Generate summaries and diagnostics
    - Users can create diagnostic plots using the Diagnostics Domain Service, with results stored in DiagnosticPlots Value Objects.
    - Users can evaluate the model using the Metrics Domain Service, with results stored in MetricValues Value Objects.
    - Users can compare models using the ModelCriticism Domain Service, with results stored in ModelComparisonResult Value Objects.

7. (Optional) Configure the entire process using the Config Entity.

### Developer

The library is packaged with hatch. Developer usage is documented in `README.md`.

## Architecture and Design

The library follows the Domain-Driven Design (DDD) principles, with core modules for Data, Model, Guide, Inference, and Review (containing Diagnostics, Metrics, and ModelCriticism). Events are used to signal successful completion of various stages in the workflow.

### Data model

1. Data
    - DataLoader Entity: Handles loading data from various sources.
    - DataRepository: Stores the loaded data.
    - DataLoadedEvent: Signals successful data loading.
2. Model
    - ModelSpecification Entity: Defines probabilistic models.
    - ModelRepository: Stores the created models.
    - ModelCreatedEvent: Signals successful model definition.
3. Guide
    - GuideSpecification Entity: Defines guides (approximate posteriors) for the models.
    - GuideRepository: Stores the created guides.
    - GuideCreatedEvent: Signals successful guide definition.
4. Inference
    - InferenceEngine Interface: Defines the base interface for inference engines.
    - VIEngine and MCEngine Entities: Implementations of the InferenceEngine for Variational Inference and Hamiltonian Monte Carlo, respectively.
    - InferenceResult Value Object: Stores the results of the inference.
    - InferenceCompletedEvent: Signals successful inference execution.
5. Diagnostics
    - Diagnostics Domain Service: Generates diagnostic plots.
    - DiagnosticPlots Value Object: Stores the diagnostic plots.
    - DiagnosticPlotsGeneratedEvent: Signals successful generation of diagnostic plots.
6. Metrics
    - Metrics Domain Service: Evaluates the model using various metrics.
    - MetricValues Value Object: Stores the metric results.
    - MetricsCalculatedEvent: Signals successful calculation of metrics.
7. ModelCriticism
    - ModelCriticism Domain Service: Compares models using various techniques.
    - ModelComparisonResult Value Object: Stores the model comparison results.
    - ModelComparisonCompletedEvent: Signals successful model comparison.
8. Config
    - Config Entity: (Optional) Configuration for the entire process.

### State transformation workflow

Please see the [features folder](https://github.com/cameronraysmith/pyro-thunder/tree/main/tests/features) for a more detailed description of proposed features.

1. Load Data
    - Use the DataLoader Entity to load data from a specified source
    - Store the loaded data in the DataRepository
    - Raise a DataLoadedEvent when data is successfully loaded

2. Define Model
    - Use the ModelSpecification Entity to define the probabilistic model
    - Store the created model in the ModelRepository
    - Raise a ModelCreatedEvent when the model is successfully defined

3. Define Guide
    - Use the GuideSpecification Entity to define a guide (approximate posterior) for the model
    - Store the created guide in the GuideRepository
    - Raise a GuideCreatedEvent when the guide is successfully defined

4. Set up Inference
    - Choose between VIEngine or MCEngine, inheriting from InferenceEngine
    - Configure the chosen InferenceEngine with the ModelRepository and GuideRepository

5. Perform Inference
    - Execute the chosen InferenceEngine
    - Store the InferenceResult Value Object containing the results of the inference
    - Raise an InferenceCompletedEvent when the inference is successfully performed

6. Generate summaries and diagnostics
    - Use the Diagnostics Domain Service to create diagnostic plots with DiagnosticPlots Value Object
    - Raise a DiagnosticPlotsGeneratedEvent when diagnostic plots are successfully created
    - Evaluate the model using the Metrics Domain Service and store the results in MetricValues Value Object
    - Raise MetricsCalculatedEvent when metrics are successfully calculated
    - Compare models using the ModelCriticism Domain Service and store the results in ModelComparisonResult Value Object
    - Raise ModelComparisonCompletedEvent when model comparison is successfully performed

7. (Optional) Configure the entire process using the Config Entity

### Draft project structure

```shell
pyro-thunder/
├── src/
|   └── thunder/
|       ├── data/
|       |   ├── __init__.py
|       |   ├── data_loader.py
|       |   ├── data_repository.py
|       |   └── events.py
|       ├── model/
|       |   ├── __init__.py
|       |   ├── model_specification.py
|       |   ├── model_repository.py
|       |   └── events.py
|       ├── guide/
|       |   ├── __init__.py
|       |   ├── guide_specification.py
|       |   ├── guide_repository.py
|       |   └── events.py
|       ├── inference/
|       |   ├── __init__.py
|       |   ├── inference_engine.py
|       |   ├── vi_engine.py
|       |   ├── mc_engine.py
|       |   ├── events.py
|       |   └── results.py
|       ├── review/
|       |   ├── __init__.py
|       |   ├── diagnostics.py
|       |   ├── metrics.py
|       |   ├── model_criticism.py
|       |   ├── events.py
|       |   └── results.py
|       ├── config.py
|       └── __init__.py
├── tests/
|   ├── __init__.py
|   ├── test_data.py
|   ├── test_model.py
|   ├── test_guide.py
|   ├── test_inference.py
|   ├── test_review.py
|   └── test_config.py
├── pyproject.toml
├── README.md
├── LICENSE
└── .gitignore
```

## Non-functional Requirements

- Performance: The library should perform inference efficiently, leveraging available hardware resources.
- Scalability: The library should be able to handle large-scale datasets and models.
- Extensibility: The library should be designed to allow easy extension of functionality and integration with other libraries.
- Usability: The library should be user-friendly, providing clear documentation and examples.

## External interfaces

- Pyro: Integration

## Testing

pyro-thunder will be tested using the [pytest](https://docs.pytest.org/en/stable/) framework. It may include some tests in [pytest-bdd](https://pytest-bdd.readthedocs.io/en/stable/), but gherkin feature specification files will primarily serve as documentation with loose association to test modules.

## Deployment and Maintenance

pyro-thunder will be distributed as a python package via PyPI that can be installed and executed on any system with python version 3.8 or greater. The library will be maintained and updated using a version control system.
