Feature: Raise a DiagnosticPlotsGeneratedEvent when diagnostic plots are successfully created
  As a researcher, I want to raise a DiagnosticPlotsGeneratedEvent when diagnostic plots are successfully created
  so that other components can respond to the completion of the diagnostic plots generation process.

  Background:
    Given I have imported the DiagnosticPlotsGeneratedEvent class from the thunderpath.utils.diagnostics module
    And I have the DiagnosticPlots Value Object from the Diagnostics Domain Service

  Scenario: Raise a DiagnosticPlotsGeneratedEvent when diagnostic plots are successfully created
    Given I have an instance of the DiagnosticPlotsGeneratedEvent class
    When I pass the DiagnosticPlots Value Object to the DiagnosticPlotsGeneratedEvent constructor
    Then the DiagnosticPlotsGeneratedEvent is raised, signaling that the diagnostic plots have been successfully created
