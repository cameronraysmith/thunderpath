Feature: Store the created guide in the GuideRepository
  As a researcher, I want to store the created guide in the GuideRepository
  so that I can manage and access the guide throughout the thunderpath workflow.

  Background:
    Given I have imported the GuideSpecification, GuideRepository, and GuideCreatedEvent classes from the thunderpath.guide module
    And I have a GuideSpecification instance with a guide definition for the model
    And I have a GuideRepository instance

  Scenario: Store the guide in the GuideRepository
    Given I define the guide using the GuideSpecification instance
    When I store the guide from the GuideSpecification instance in the GuideRepository
    Then the guide should be successfully stored in the GuideRepository

  Scenario: Access the stored guide from the GuideRepository
    Given I have stored a guide in the GuideRepository
    When I request the stored guide from the GuideRepository
    Then I should receive the stored guide
