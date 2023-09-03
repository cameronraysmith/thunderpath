Feature: Configure the entire process using the Config Entity
  As a researcher, I want to configure the entire process using the Config Entity
  so that I can manage settings for data loading, model and guide definition, inference, and diagnostics generation in one place.

  Background:
    Given I have imported the Config class from the thunderpath.config module
    And I have a configuration file with all necessary settings

  Scenario: Load and apply configuration settings for the entire process
    Given I have an instance of the Config class
    When I load the configuration file using the Config.load method
    Then the Config Entity should contain settings for data loading, model and guide definition, inference, and diagnostics generation
    And I can use the Config Entity to configure the entire process, including DataLoader, ModelSpecification, GuideSpecification, InferenceEngine, Diagnostics, Metrics, and ModelCriticism
