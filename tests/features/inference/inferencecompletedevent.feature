Feature: Raise an InferenceCompletedEvent when the inference is successfully performed
  As a researcher, I want to raise an InferenceCompletedEvent when the inference is successfully performed
  so that I can trigger other actions or notify other components of the successful completion of the inference.

  Background:
    Given I have imported the InferenceCompletedEvent class from the thunderpath.inference module
    And I have an instance of the chosen InferenceEngine

  Scenario: Raise an InferenceCompletedEvent when the inference is successfully performed
    Given I have executed the chosen InferenceEngine
    When the InferenceEngine successfully completes the inference
    Then I raise an InferenceCompletedEvent containing the InferenceResult object
