Feature: Implementation of the InferenceEngine for Hamiltonian Monte Carlo
  As a researcher, I want to use the MCEngine for Hamiltonian Monte Carlo
  so that I can perform Hamiltonian Monte Carlo-based inference using thunderpath.

  Background:
    Given I have imported the InferenceEngine and MCEngine classes from the thunderpath.inference module

  Scenario: Use MCEngine for Hamiltonian Monte Carlo
    Given I create a MCEngine instance that inherits from the InferenceEngine interface
    When I define the required methods for the MCEngine instance
    Then the MCEngine instance should be a valid implementation of the InferenceEngine interface
    And I can perform Hamiltonian Monte Carlo-based inference using the MCEngine instance
