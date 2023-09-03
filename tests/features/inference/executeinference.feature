Feature: Execute the chosen InferenceEngine
  As a researcher, I want to execute the chosen InferenceEngine
  so that I can perform inference on my model and guide using thunderpath.

  Background:
    Given I have imported the InferenceEngine, VIEngine, and MCEngine classes from the thunderpath.inference module
    And I have imported the ModelRepository and GuideRepository classes from the thunderpath repositories
    And I have configured the chosen InferenceEngine with the ModelRepository and GuideRepository instances

  Scenario: Execute the chosen InferenceEngine
    Given I have chosen an InferenceEngine for my problem
    When I execute the chosen InferenceEngine
    Then the InferenceEngine performs inference on the model and guide stored in the repositories
    And the InferenceEngine returns an InferenceResult object containing the results of the inference
