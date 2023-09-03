Feature: Use the GuideSpecification Entity to define a guide (approximate posterior) for the model
  As a researcher, I want to use the GuideSpecification Entity to define a guide (approximate posterior)
  so that I can perform probabilistic inference using thunderpath with my model.

  Background:
    Given I have imported the GuideSpecification class from the thunderpath.guide module
    And I have a model defined in a ModelSpecification instance

  Scenario: Define a guide using the GuideSpecification Entity
    Given I create a GuideSpecification instance with a guide definition for the model
    When I define the guide using the GuideSpecification instance
    Then the guide should be compatible with the model defined in the ModelSpecification instance

  Scenario: Validate the guide definition
    Given I have a GuideSpecification instance with a guide definition for the model
    When I validate the guide definition
    Then the guide should meet the requirements for performing probabilistic inference with thunderpath
