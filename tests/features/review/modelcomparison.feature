Feature: Compare models using the ModelCriticism Domain Service and store the results in ModelComparisonResult Value Object
  As a researcher, I want to compare models using the ModelCriticism Domain Service and store the results in the ModelComparisonResult Value Object
  so that I can easily access and analyze the comparison of different models.

  Background:
    Given I have imported the ModelCriticism class from the thunderpath.model_criticism module
    And I have multiple ModelRepository, GuideRepository, and InferenceResult objects for different models

  Scenario: Compare models and store the results in ModelComparisonResult
    Given I have an instance of the ModelCriticism class
    When I pass the ModelRepository, GuideRepository, and InferenceResult objects of different models to the ModelCriticism.compare_models method
    Then I get a ModelComparisonResult Value Object containing the comparison results of the models
