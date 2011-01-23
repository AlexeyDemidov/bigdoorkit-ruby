@passing
Feature: end_user API endpoint

    In order to operate with end users objects
    As object-oriented API client user
    I want to use EndUser object

    @remote @passing
    Scenario: get list of all EndUser
        Given low-level client
        When I call it to list all "EndUser" objects
        Then I should get list of "EndUser" objects

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

    @remote @passing
    Scenario: Run Transaction for EndUser
        Given low-level client
        And freshly created "EndUser" object with "random" name
        And some Currency
        And some NamedTransactionGroup with some NamedTransaction
        And some NamedLevelCollection with some NamedLevel
        When I execute NamedTransactionGroup
        And I call it to list all "CurrencyBalance" objects from "EndUser"
        Then I should get list of all "1" "CurrencyBalance" objects
        And I should see Leaderboard
        And "EndUser" object should be removed
        And "NamedTransactionGroup" should be removed
        And "NamedLevelCollection" should be removed
        And Currency should be removed
    
    @remote @passing
    Scenario: Run Transaction for EndUser with Level Up
        Given low-level client
        And freshly created "EndUser" object with "random" name
        And some Currency
        And some NamedTransactionGroup with some NamedTransaction
        And some NamedLevelCollection with some NamedLevel
        When I execute NamedTransactionGroup
        And I call it to list all "Level" objects from "EndUser"
        Then I should get list of all "1" "Level" objects
        And "EndUser" object should be removed
        And "NamedTransactionGroup" should be removed
        And "NamedLevelCollection" should be removed
        And Currency should be removed
    
    @remote  @passing
    Scenario: Assign Award to EndUser
        Given low-level client
        And freshly created "EndUser" object with "random" name
        And some NamedAwardCollection with some NamedAward
        When I assign Award to EndUser
        And I call it to list all "Award" objects from "EndUser"
        Then I should get list of all "1" "Award" objects
        And "EndUser" object should be removed
        And "NamedAwardCollection" should be removed
    
    @remote @passing
    Scenario: Run Transaction for EndUser with Good
        Given low-level client
        And freshly created "EndUser" object with "random" name
        And some Currency
        And some NamedGoodCollection with some NamedGood
        And some NamedTransactionGroup with some NamedTransaction with Good
        When I execute NamedTransactionGroup
        And I call it to list all "Good" objects from "EndUser"
        Then I should get list of all "1" "Good" objects
        And "EndUser" object should be removed
        And "NamedGoodCollection" should be removed
        And "NamedTransactionGroup" should be removed
        And Currency should be removed
