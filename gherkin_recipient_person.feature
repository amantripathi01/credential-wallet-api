Feature: Credential Wallet API
  As a user of the Credential Wallet API
  I want to get registration details of people allowed to receive credentials 
  So that I can manage my account effectively

  Background:
    Given the base URL is "http://localhost:8080"

  Scenario: Get Registration Details Of Recipient Person
    Given id of recipient as 27364922937 in path parameter
    And size=13 and offset=42 in request query
    When the client sends a GET request to endpoint "/recipients/persons/{id}/registrations" 
    When authentication token is sent in request
    Then for successful request having status code 200, Verify that headers have api-version, page-size and  page-offset
    And response body must have element registrations and total.

  Scenario: Request must fail with error if request not authenticated
    Given id of recipient as 09237482347 in path parameter
    And size=43 and offset=22 in request query
    When the client sends a GET request to endpoint "/recipients/persons/{id}/registrations" 
    When authentication token is not sent in request
    Then for unauthenticated request having status code 401, Verify that headers have api-version
    And response body must have appropriate error schema

