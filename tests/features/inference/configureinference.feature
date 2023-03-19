Feature: Configure the chosen InferenceEngine with ModelRepository and GuideRepository
  As a researcher, I want to configure the chosen InferenceEngine with the ModelRepository and GuideRepository
  so that I can perform inference using the model and guide stored in the repositories with Pyro-Thunder.

  Background:
    Given I have imported the InferenceEngine, VIEngine, and MCEngine classes from the thunder.inference module
    And I have imported the ModelRepository and GuideRepository classes from the pyro-thunder repositories

  Scenario: Configure the InferenceEngine with ModelRepository and GuideRepository
    Given I have chosen an InferenceEngine for my problem
    When I have a ModelRepository instance containing the model
    And I have a GuideRepository instance containing the guide
    Then I can configure the chosen InferenceEngine with the ModelRepository and GuideRepository instances
    And the InferenceEngine can access the model and guide for performing inference
