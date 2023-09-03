Feature: Choose between VIEngine or MCEngine for inference
  As a researcher, I want to choose between VIEngine and MCEngine for inference
  so that I can perform inference using the most suitable engine for my problem with thunderpath.

  Background:
    Given I have imported the InferenceEngine, VIEngine, and MCEngine classes from the thunderpath.inference module

  Scenario: Choose the appropriate inference engine for a given problem
    Given I have a problem that requires either Variational Inference or Hamiltonian Monte Carlo
    When I decide to use Variational Inference
    Then I create a VIEngine instance that inherits from the InferenceEngine interface
    And I can perform Variational Inference-based inference using the VIEngine instance

    Given I have a problem that requires either Variational Inference or Hamiltonian Monte Carlo
    When I decide to use Hamiltonian Monte Carlo
    Then I create a MCEngine instance that inherits from the InferenceEngine interface
    And I can perform Hamiltonian Monte Carlo-based inference using the MCEngine instance
