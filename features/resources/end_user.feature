@wip
Feature: end_user API endpoint

    In order to operate with end users objects
    As object-oriented API client user
    I want to use EndUser object

    @remote @passing
    Scenario: get list of all EndUser
        Given low-level client
        When I call it to list all "EndUser" objects
        Then I should get list of all "0" "EndUser" objects

    @local @passing
    Scenario: create a new EndUser
        Given low-level client
        When I create a new "EndUser" object
        Then I should get a "EndUser" object
    
    @remote @passing
    Scenario: create and save a new EndUser
        Given low-level client
        When I create and save a new "EndUser" object with "random" name
        Then I should get a "EndUser" object
        And I should be able to assign "Profile" to "EndUser"
        And object should has guid defined
        And I should be able to remove object
    
    @remote @passing
    Scenario: get CurrencyBalances for EndUsers
        Given low-level client
        And freshly created "EndUser" object with "random" name
        When I call it to list all "CurrencyBalance" objects from "EndUser"
        Then I should get list of all "0" "CurrencyBalance" objects
        And "EndUser" object should be removed
