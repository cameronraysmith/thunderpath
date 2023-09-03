Feature: Store the InferenceResult Value Object containing the results of the inference
  As a researcher, I want to store the InferenceResult Value Object containing the results of the inference
  so that I can analyze and review the results later using thunderpath.

  Background:
    Given I have imported the InferenceResult class from the thunderpath.inference module
    And I have imported the InferenceRepository class from the thunderpath repositories
    And I have an instance of the chosen InferenceEngine

  Scenario: Store the InferenceResult Value Object containing the results of the inference
    Given I have executed the chosen InferenceEngine
    When the InferenceEngine returns an InferenceResult object containing the results of the inference
    Then I store the InferenceResult object in the InferenceRepository
