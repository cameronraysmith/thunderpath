Feature: Raise ModelComparisonCompletedEvent when model comparison is successfully performed
  As a researcher, I want to raise a ModelComparisonCompletedEvent when model comparison is successfully performed
  so that I can be notified when the model comparison process is completed.

  Background:
    Given I have imported the ModelCriticism class from the thunderpath.model_criticism module
    And I have imported the ModelComparisonCompletedEvent class from the thunderpath.model_criticism.events module
    And I have multiple ModelRepository, GuideRepository, and InferenceResult objects for different models

  Scenario: Raise ModelComparisonCompletedEvent after successful model comparison
    Given I have an instance of the ModelCriticism class
    And I have an event listener registered for ModelComparisonCompletedEvent
    When I pass the ModelRepository, GuideRepository, and InferenceResult objects of different models to the ModelCriticism.compare_models method
    Then a ModelComparisonCompletedEvent is raised after the comparison is completed
