Feature: Raise a DataLoadedEvent when data is successfully loaded
  As a researcher, I want to raise a DataLoadedEvent when data is successfully loaded
  so that I can keep track of the data loading process and trigger subsequent actions in the thunderpath workflow.

  Background:
    Given I have imported the DataLoader, DataRepository, and DataLoadedEvent classes from the thunderpath.data module
    And I have a DataLoader instance with data loaded
    And I have a DataRepository instance

  Scenario: Raise a DataLoadedEvent on successful data load
    Given I store the data from the DataLoader instance in the DataRepository
    When the data is successfully stored in the DataRepository
    Then a DataLoadedEvent should be raised

  Scenario: Listen for DataLoadedEvent to trigger further actions
    Given I have a function that will be triggered by the DataLoadedEvent
    When the DataLoadedEvent is raised
    Then the function should be called with the stored data as a pandas DataFrame
