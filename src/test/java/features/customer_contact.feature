#Author: Carlos José Cogollo Hernandez

Feature: test the response of the MDM customer contact

  Background:
    * def urlBase = 'https://internal-apigateway-qa.bancolombia.corp'
    * def usersPath = '/int/testing/v1/sales-services/customer-management/customer-reference-data-management/customer-contact/retrieve-contact-information'
    * def req = {"data":{"customerDocumentId":"63457989","customerDocumentType":"TIPDOC_FS001"}}

  @CoustomerContactStorie
  Scenario Outline: get the status service
    * configure ssl = true
    * configure headers = { 'Content-Type': 'application/json', 'X-IBM-Client-Secret': 'yL1oA7tB3rJ8dT7vW7dC1kU6gC5lB0tI2fF6vK0iX0nT2eD2fJ', 'X-IBM-Client-Id':'cb0f83c0-4cbb-4ada-8395-3e7783e8a265', 'Message-id':'asdfghjklopiuytredfggbfbcvbnm,klijhgfdsdrtyujknmbvcxsddfghj'}
    Given url urlBase + usersPath
    And request req
    When method POST
    * print response.data.contact[0]
    * print response.data.contact[0].email
    Then match response.data.contact[0].email == "<resp>"
    And match response.data.contact[0].mobilPhone == "3148794903"
    Examples:
      |          resp         |
      |eaza@bancolombia.com.co|
