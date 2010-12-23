Feature: attribute API endpoint

    In order to operate with attribute objects
    As object-oriented API client user
    I want to use Attribute object

    @remote @wip
    Scenario: get list of all Attribute
        Given low-level client
        When I call it to list all "Attribute" objects
        Then I should get list of all "6" "Attribute" objects

    @local @wip
    Scenario: create a new Attribute
        Given low-level client
        When I create a new "Attribute" object
        Then I should get a "Attribute" object
    
    @remote @wip
    Scenario: create and save a new Attribute
        Given low-level client
        When I create a new "Attribute" object
        And assign "Attribute" data to object
        And save object
        Then I should get a "Attribute" object
        And object should has resource_id defined
        And I should be able to remove object
    
