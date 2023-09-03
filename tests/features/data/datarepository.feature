Feature: Store the loaded data in the DataRepository
  As a researcher, I want to store the loaded data in the DataRepository
  so that I can easily access and manage the data for probabilistic inference with thunderpath.

  Background:
    Given I have imported the DataLoader and DataRepository classes from the thunderpath.data module
    And I have a DataLoader instance with data loaded

  Scenario: Store data in the DataRepository
    Given I create a DataRepository instance
    When I store the data from the DataLoader instance in the DataRepository
    Then the DataRepository should contain the stored data as a pandas DataFrame

  Scenario: Retrieve data from the DataRepository
    Given I have stored data in the DataRepository
    When I retrieve the data from the DataRepository
    Then the retrieved data should be the same as the original data loaded in the DataLoader instance

  Scenario: Replace data in the DataRepository
    Given I have stored data in the DataRepository
    And I have a new DataLoader instance with new data loaded
    When I replace the data in the DataRepository with the new data from the new DataLoader instance
    Then the DataRepository should contain the new data as a pandas DataFrame
