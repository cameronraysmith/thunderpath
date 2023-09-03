Feature: Raise a ModelCreatedEvent when the model is successfully defined
  As a researcher, I want to raise a ModelCreatedEvent when the model is successfully defined
  so that I can keep track of the model creation process and trigger subsequent actions in the thunderpath workflow.

  Background:
    Given I have imported the ModelSpecification, ModelRepository, and ModelCreatedEvent classes from the thunderpath.model module
    And I have a ModelSpecification instance with a model definition
    And I have a ModelRepository instance

  Scenario: Raise a ModelCreatedEvent on successful model definition
    Given I store the model from the ModelSpecification instance in the ModelRepository
    When the model is successfully stored in the ModelRepository
    Then a ModelCreatedEvent should be raised

  Scenario: Listen for ModelCreatedEvent to trigger further actions
    Given I have a function that will be triggered by the ModelCreatedEvent
    When the ModelCreatedEvent is raised
    Then the function should be called with the stored model
