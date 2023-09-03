Feature: Use the DataLoader Entity to load data from a specified source
  As a researcher, I want to use the DataLoader entity to load data from a specified source
  so that I can easily prepare data for probabilistic inference with thunderpath.

  Background:
    Given I have imported the DataLoader class from the thunderpath.data module

  Scenario: Load data from a CSV file
    Given I have a CSV file with data at "data.csv"
    When I create a DataLoader instance with the file path "data.csv"
    And I load the data using the DataLoader instance
    Then the data should be loaded into memory as a pandas DataFrame

  Scenario: Load data from a JSON file
    Given I have a JSON file with data at "data.json"
    When I create a DataLoader instance with the file path "data.json"
    And I load the data using the DataLoader instance
    Then the data should be loaded into memory as a pandas DataFrame

  Scenario: Load data from a remote URL
    Given I have a remote URL with data at "https://example.com/data.csv"
    When I create a DataLoader instance with the URL "https://example.com/data.csv"
    And I load the data using the DataLoader instance
    Then the data should be loaded into memory as a pandas DataFrame
