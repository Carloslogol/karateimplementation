#Author: Carlos José Cogollo Hernandez

  Feature: Get list test on reqres.in

    Background:
      * def urlBase = 'https://reqres.in'
      * def listPath = '/api/users?page=2'

    Scenario Outline:
      As a Admin
      I want to get list from users
      Given url urlBase + listPath
      When method GET
      * print response
      Then response.status == <status_code>
      Examples:
        | status_code |
        |     200     |
        |     400     |