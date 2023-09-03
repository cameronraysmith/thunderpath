Feature: Use the ModelSpecification Entity to define the probabilistic model
  As a researcher, I want to use the ModelSpecification entity to define the probabilistic model
  so that I can build custom models for probabilistic inference with thunderpath.

  Background:
    Given I have imported the ModelSpecification class from the thunderpath.model module

  Scenario: Define a probabilistic model using Pyro primitives
    Given I have a model definition function using Pyro primitives
    When I create a ModelSpecification instance with the model definition function
    Then the ModelSpecification instance should contain the model definition

  Scenario: Define a probabilistic model using NumPyro primitives
    Given I have a model definition function using NumPyro primitives
    When I create a ModelSpecification instance with the model definition function
    Then the ModelSpecification instance should contain the model definition

  Scenario: Retrieve the model definition from the ModelSpecification instance
    Given I have a ModelSpecification instance with a model definition
    When I retrieve the model definition from the ModelSpecification instance
    Then the retrieved model definition should be the same as the original model definition
