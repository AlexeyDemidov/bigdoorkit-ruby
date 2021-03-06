@passing
Feature: url API endpoint

    In order to operate with url objects
    As object-oriented API client user
    I want to use URL object

    @remote 
    Scenario: get list of all URL
        Given low-level client
        When I call it to list all "URL" objects
        Then I should get list of "URL" objects

    @local
    Scenario: create a new URL
        Given low-level client
        When I create a new "URL" object
        Then I should get a "URL" object
    
    @remote
    Scenario: create and save a new URL
        Given low-level client
        When I create a new "URL" object
        And assign "URL" data to object
        And save object
        Then I should get a "URL" object
        And object should has resource_id defined
        And I should be able to remove object
    
    @remote
    Scenario: create, save and associate a new URL
        Given low-level client
        And some Currency
        When I create a new "URL" object
        And assign "URL" data to object
        And save object
        And associate "URL" with "Currency"
        Then I should get a "URL" object
        And object should has resource_id defined
        And I should be able to remove object
        And Currency should be removed
