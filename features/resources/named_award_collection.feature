Feature: named_award_collection API endpoint

    In order to operate with named award collections
    As object-oriented API client user
    I want to use NamedAwardCollection object

    Scenario: get list of all NamedAwardCollections
        Given low-level client
        When I call it to list all NamedAwardCollection objects
        Then I should get list of all [0] NamedAwardCollection objects

    Scenario: create a new NamedAwardCollection
        Given low-level client
        When I create a new NamedAwardCollection
        Then I should get a NamedAwardCollection object
    
    Scenario: create and save a new NamedAwardCollection
        Given low-level client
        When I create a new NamedAwardCollection
        And set some data on it
        And save it
        Then I should get a NamedAwardCollection object
        And it should has resource_id defined
        And I should be able to remove it
    
    Scenario: add NamedAward to NamedAwardCollection 
        Given low-level client
        And new empty NamedAwardCollection
        When I create a new NamedAward
        And set NamedAward data on it
        And save it
        Then I should get a NamedAward object
        And it should has resource_id defined
        And I should be able to remove it
        And NamedAwardCollection should be removed too
