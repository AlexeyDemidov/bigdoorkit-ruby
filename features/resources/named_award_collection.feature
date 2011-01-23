@passing
Feature: named_award_collection API endpoint

    In order to operate with named award collections
    As object-oriented API client user
    I want to use NamedAwardCollection object

    @remote
    Scenario: get list of all NamedAwardCollections
        Given low-level client
        When I call it to list all "NamedAwardCollection" objects
        Then I should get list of "NamedAwardCollection" objects

    @local
    Scenario: create a new NamedAwardCollection
        Given low-level client
        When I create a new "NamedAwardCollection" object
        Then I should get a "NamedAwardCollection" object
    
    @remote
    Scenario: create and save a new NamedAwardCollection
        Given low-level client
        When I create a new "NamedAwardCollection" object
        And assign some NamedAwardCollection data to object
        And save object
        And load object
        And save object
        Then I should get a "NamedAwardCollection" object
        And object should has resource_id defined
        And I should be able to remove object
    
    @remote
    Scenario: add NamedAward to NamedAwardCollection 
        Given low-level client
        And new empty "NamedAwardCollection" collection
        When I create a new "NamedAward" object
        And assign NamedAward data to object
        And save object
        Then I should get a "NamedAward" object
        And object should has resource_id defined
        And I should be able to remove object
        And collection should be removed too
