@passing
Feature: currency_type API endpoint shows list of currency types

    In order to known which currency types are available
    As object-oriented API client user
    I want to get list of currency types

    @remote
    Scenario: 
        Given low-level client
        When I call it to list all "CurrencyType" objects
        Then I should get list of all "9" "CurrencyType" objects
