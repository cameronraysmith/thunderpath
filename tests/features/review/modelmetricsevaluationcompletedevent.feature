Feature: MetricsCalculatedEvent
    As a user of the thunderpath library,
    I want to receive a MetricsCalculatedEvent when metrics are successfully calculated,
    So that I can take further actions or continue the application workflow.

Scenario: Raise MetricsCalculatedEvent after successful metric calculations
    Given I have the InferenceResult Value Object from an inference task
    When I calculate the metrics using the Metrics Domain Service
    Then I should receive a MetricsCalculatedEvent
