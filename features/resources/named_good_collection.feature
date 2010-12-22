Feature: named_good_collection API endpoint

    In order to operate with named good collections
    As object-oriented API client user
    I want to use NamedGoodCollection object

    Scenario: get list of all NamedGoodCollections
        Given low-level client
        When I call it to list all NamedGoodCollection objects
        Then I should get list of all [0] NamedGoodCollection objects

    Scenario: create a new NamedGoodCollection
        Given low-level client
        When I create a new NamedGoodCollection object
        Then I should get a NamedGoodCollection object
    
    Scenario: create and save a new NamedGoodCollection
        Given low-level client
        When I create a new NamedGoodCollection object
        And assign some NamedGoodCollection data to object
        And save object
        Then I should get a NamedGoodCollection object
        And object should has resource_id defined
        And I should be able to remove object
    
    Scenario: add NamedGood to NamedGoodCollection 
        Given low-level client
        And new empty NamedGoodCollection
        When I create a new NamedGood object
        And assign NamedGood data to object
        And save object
        Then I should get a NamedGood object
        And object should has resource_id defined
        And I should be able to remove object
        And collection should be removed too
