@passing
Feature: named_level_collection API endpoint

    In order to operate with named level collections
    As object-oriented API client user
    I want to use NamedLevelCollection object

    @local
    Scenario: get list of all NamedLevelCollections
        Given low-level client
        When I call it to list all "NamedLevelCollection" objects
        Then I should get list of all "0" "NamedLevelCollection" objects

    @local
    Scenario: create a new NamedLevelCollection
        Given low-level client
        When I create a new "NamedLevelCollection" object
        Then I should get a "NamedLevelCollection" object
    
    @remote
    Scenario: create and save a new NamedLevelCollection
        Given low-level client
        And some Currency
        When I create a new "NamedLevelCollection" object
        And assign some NamedLevelCollection data to object
        And save object
        Then I should get a "NamedLevelCollection" object
        And object should has resource_id defined
        And I should be able to remove object
        And Currency should be removed
    
    @remote
    Scenario: add NamedLevel to NamedLevelCollection 
        Given low-level client
        And some Currency
        And new empty NamedLevelCollection
        When I create a new "NamedLevel" object
        And assign NamedLevel data to object
        And save object
        Then I should get a "NamedLevel" object
        And object should has resource_id defined
        And I should be able to remove object
        And collection should be removed too
        And Currency should be removed
