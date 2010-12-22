Feature: end_user API endpoint

    In order to operate with end users
    As object-oriented API client user
    I want to use EndUser object

    Scenario: get list of all EndUser
        Given low-level client
        When I call it to list all EndUser objects
        Then I should get list of all [0] EndUser objects

    Scenario: create a new EndUser
        Given low-level client
        When I create a new EndUser object
        Then I should get a EndUser object
    
    Scenario: create and save a new EndUser
        Given low-level client
        When I create and save a new EndUser object with random name
        Then I should get a EndUser object
        And I should be able to assign Profile to EndUser
        And object should has guid defined
        And I should be able to remove object
    
