Feature: Creating a JUnit test report

    Background:
        Given the tests have started running

    Scenario: Showing a test suite
        Given I have a passing test in my suite
        When I pipe to xcpretty with "--report junit"
        Then I should see a test suite node

    Scenario: Showing failed tests
        Given I have a failing test in my suite
        When I pipe to xcpretty with "--report junit"
        Then I should see a failed test node in my report

    Scenario: Showing passing tests
        Given I have a passing test in my suite
        When I pipe to xcpretty with "--report junit"
        Then I should see a passing test node in my report

    Scenario: Counting tests
        Given I have a passing test in my suite
        And I have a failing test in my suite
        And the test suite has finished
        When I pipe to xcpretty with "--report junit"
        Then I should see 2 tests in my report

    Scenario: Having many test classes
        Given I have tests in my suite from 2 classes
        When I pipe to xcpretty with "--report junit"
        Then I should see 2 test suites

    Scenario: Writing to a custom file path
        When I pipe to xcpretty with "--report junit" and specify a custom path
        Then I should have a test report in a custom path
