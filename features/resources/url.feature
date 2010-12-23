Feature: url API endpoint

    In order to operate with url objects
    As object-oriented API client user
    I want to use URL object

    @remote @wip
    Scenario: get list of all URL
        Given low-level client
        When I call it to list all "URL" objects
        Then I should get list of all "0" "URL" objects

    @local @wip
    Scenario: create a new URL
        Given low-level client
        When I create a new "URL" object
        Then I should get a "URL" object
    
    @remote @wip
    Scenario: create and save a new URL
        Given low-level client
        When I create a new "URL" object
        And assign "URL" data to object
        And save object
        Then I should get a "URL" object
        And object should has resource_id defined
        And I should be able to remove object
    
