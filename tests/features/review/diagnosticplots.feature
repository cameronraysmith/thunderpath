Feature: Use the Diagnostics Domain Service to create diagnostic plots with DiagnosticPlots Value Object
  As a researcher, I want to use the Diagnostics Domain Service to create diagnostic plots with the DiagnosticPlots Value Object
  so that I can visualize and analyze the results of the inference.

  Background:
    Given I have imported the Diagnostics class from the thunderpath.review.diagnostics module
    And I have the InferenceResult Value Object from the completed inference

  Scenario: Use the Diagnostics Domain Service to create diagnostic plots with DiagnosticPlots Value Object
    Given I have an instance of the Diagnostics Domain Service
    When I pass the InferenceResult to the Diagnostics Domain Service
    Then I receive a DiagnosticPlots Value Object containing the diagnostic plots for the inference results
