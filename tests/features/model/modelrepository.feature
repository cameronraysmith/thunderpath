Feature: Store the created model in the ModelRepository
  As a researcher, I want to store the created model in the ModelRepository
  so that I can easily access and manage the model for probabilistic inference with thunderpath.

  Background:
    Given I have imported the ModelSpecification and ModelRepository classes from the thunderpath.model module
    And I have a ModelSpecification instance with a model definition

  Scenario: Store the model in the ModelRepository
    Given I create a ModelRepository instance
    When I store the model from the ModelSpecification instance in the ModelRepository
    Then the ModelRepository should contain the stored model

  Scenario: Retrieve the model from the ModelRepository
    Given I have stored a model in the ModelRepository
    When I retrieve the model from the ModelRepository
    Then the retrieved model should be the same as the original model defined in the ModelSpecification instance

  Scenario: Replace the model in the ModelRepository
    Given I have stored a model in the ModelRepository
    And I have a new ModelSpecification instance with a new model definition
    When I replace the model in the ModelRepository with the new model from the new ModelSpecification instance
    Then the ModelRepository should contain the new model
