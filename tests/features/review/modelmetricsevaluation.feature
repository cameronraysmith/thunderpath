Feature: Evaluate the model using the Metrics Domain Service and store the results in MetricValues Value Object
  As a researcher, I want to evaluate the model using the Metrics Domain Service and store the results in the MetricValues Value Object
  so that I can easily access and analyze the performance of the model.

  Background:
    Given I have imported the Metrics class from the thunderpath.utils.metrics module
    And I have the ModelRepository, GuideRepository, and InferenceResult objects

  Scenario: Evaluate the model and store the results in MetricValues
    Given I have an instance of the Metrics class
    When I pass the ModelRepository, GuideRepository, and InferenceResult objects to the Metrics.evaluate method
    Then I get a MetricValues Value Object containing the evaluation results of the model
