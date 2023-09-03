Feature: InferenceEngine Interface: Defines the base interface for inference engines
  As a researcher, I want to use the InferenceEngine interface
  so that I can create custom inference engines for thunderpath with a consistent API.

  Background:
    Given I have imported the InferenceEngine class from the thunderpath.inference module

  Scenario: Implement a custom inference engine with InferenceEngine interface
    Given I create a CustomInferenceEngine class that implements the InferenceEngine interface
    When I define the required methods for the CustomInferenceEngine class
    Then the CustomInferenceEngine class should be a valid implementation of the InferenceEngine interface
