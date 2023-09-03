Feature: Raise a GuideCreatedEvent when the guide is successfully defined
  As a researcher, I want to raise a GuideCreatedEvent when the guide is successfully defined
  so that I can track the progress of the thunderpath workflow and respond to the event if needed.

  Background:
    Given I have imported the GuideSpecification, GuideRepository, and GuideCreatedEvent classes from the thunderpath.guide module
    And I have a GuideSpecification instance with a guide definition for the model
    And I have a GuideRepository instance

  Scenario: Raise a GuideCreatedEvent after defining a guide
    Given I define the guide using the GuideSpecification instance
    When I store the guide from the GuideSpecification instance in the GuideRepository
    Then a GuideCreatedEvent should be raised to indicate the guide has been successfully defined
